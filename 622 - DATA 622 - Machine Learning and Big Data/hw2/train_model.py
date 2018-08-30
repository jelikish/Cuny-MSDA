#Joseph Elikishvili IS622 HW2
#This file loads  files downloaded from kaggle runs RandomForestClassifier and outputs trained model in a file also saves training set into csv files

import pandas as pd
import os
from sklearn.ensemble import RandomForestClassifier
from sklearn.preprocessing import Imputer
from sklearn.model_selection import train_test_split
from sklearn.pipeline import Pipeline
import pickle

#Stores final trained model
model_file = 'model.pkl'



#Function reads csv file, prepares data, drops columns we will not be using, splits data into X=training set, y=target
def prep():

    #read csv file
    try:
        df = pd.read_csv("train.csv")
    except:
        print("Download files first")

    # get rid of columns we do not need
    df = df.drop(['PassengerId', 'Name', 'Cabin', 'Ticket'], axis=1)

    # Dropping 2 rows with NaN in Embarked. Should have minimal impact since only dropping 2/
    df = df.dropna(subset=['Embarked'], how='all')

    #Convert Sex & Embarked columns to binary
    df_dum = pd.get_dummies(df)

    # get rid of redundant data
    df_dum = df_dum.drop(['Sex_female', 'Embarked_C'], axis=1)

    # Assign target to y and training set to X
    y = df_dum['Survived']
    X = df_dum.drop('Survived', axis=1)

    return([X,y])

#Function takes in X = training dataset and y=target and returns pipeline object including a trained model using RandomForestClassifier
def ml(X, y):
    # instantiate an imputer object and randomforestclassifier
    imp1 = Imputer(missing_values='NaN', strategy='mean', axis=0)
    f1 = RandomForestClassifier(max_depth=10, min_samples_split=2, n_estimators=100, random_state=1)

    # list steps for pipline
    steps = [('imputation', imp1), ('random_forest', f1)]

    # instatiate pipeline
    pipeline = Pipeline(steps)

    # Split the data
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

    #save X_test & y_test to csv
    try:
        X_test.to_csv('x_test.csv')
        y_test.to_csv('y_test.csv')
    except:
        print("Could not save test set")



    # fit the model
    try:
        model = pipeline.fit(X_train, y_train)
    except:
        print("Can't fit model, check code")

    return(model)



#Function takes trained model and file name as arguments and saves the trained model to the specified file.
def model_write(model, model_file):
    try:
        p = open(model_file, 'wb')
        pickle.dump(model, p)
    except:
        print("can't save model to a file")
    p.close()


def main():
    X, y = prep()
    model = ml(X,y)
    model_write(model, model_file)


if  __name__ =='__main__':
    main()