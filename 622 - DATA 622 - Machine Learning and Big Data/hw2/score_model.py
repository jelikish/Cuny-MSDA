#Joseph Elikishvili IS622 Hw2
# This script reads model.pkl, x_test.csv & y_test.csv and reads train.csv
#1. Script outputs prediction score and classification report based on xtest & ytest predictions
#2. Script makes predictions with the trained model loaded from model.pkl on train.csv data set and saves predictions to predictions.csv

import pickle
import pandas as pd
from sklearn.metrics import classification_report

#file with trained model
model_file = 'model.pkl'

#Read csv files
def read_files():
    try:
        test_df = pd.read_csv("test.csv")
        X_test = pd.read_csv("x_test.csv")
        y_test = pd.read_csv("y_test.csv")
    except:
        print("Could not read files")

    X_test.drop(X_test.columns[[0]], axis=1, inplace=True)
    y_test.drop(y_test.columns[[0]], axis=1, inplace=True)
    X_test.drop(X_test.index[0], inplace=True)
    return([X_test, y_test, test_df])



def model_read(file):
    try:
        p = open(file, 'rb')
        openmodel = pickle.load(p)
    except:
        print("Could not open", file)
    return(openmodel)

def prep_testdf(df):
    # get rid of columns we do not need
    df = df.drop(['PassengerId', 'Name', 'Cabin', 'Ticket'], axis=1)

    # Convert Sex & Embarked columns to binary
    df_dum = pd.get_dummies(df)

    # get rid of redundant data
    df_dum = df_dum.drop(['Sex_female', 'Embarked_C'], axis=1)
    return(df_dum)


def main():
    X_test, y_test, test_df = read_files()
    model = model_read(model_file)
    score = model.score(X_test, y_test)
    preped_df = prep_testdf(test_df)
    y_pred = model.predict(X_test)
    test_pred = model.predict(preped_df)
    class_report = classification_report(y_test, y_pred, )

    print("---------------------------------------------")
    print("Classification Report on Test Set from train.csv ")
    print(class_report)
    print("---------------------------------------------")
    print("Model score on Test set from train.csv:", score)
    print("---------------------------------------------")


    input("Press Enter to continue...")
    print("Predictions on test.csv")
    print(format(test_pred))
    print("---------------------------------------------")

if  __name__ =='__main__':
    main()
