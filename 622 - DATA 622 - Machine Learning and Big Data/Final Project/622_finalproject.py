# Data622 Final Project.  Joseph Elikishvili
# The puprose of this script is to doownload the MINST dataset consisting of images handwritten numbers and to develop a neural network mased
# script which would be able to read the images and guess the number written correctly.
# Requremenets: install Tensorflow and Keras, using python 3.6 (64)

import keras
from keras.datasets import mnist
from keras.models import Sequential
from keras.layers import Dense
from keras.optimizers import RMSprop
from keras.callbacks import EarlyStopping

#Creating callback for early epoch stop
early_stop = EarlyStopping(patience=2)

#The pulldata function downloads NNIST data set shapes the data and returns x/y train and test data ready for keras model
def pulldata():
    # We have imported the keras mnist dataset so we can directly downloaded it
    # More info here https://keras.io/datasets/#mnist-database-of-handwritten-digits
    (x_train, y_train), (x_test, y_test) = mnist.load_data()

    # Reshaping data for keras input training set=60000 and test set=10000
    # Each image is 28x28 pixels = 784, so dimentions are 60000x784
    x_train = x_train.reshape(60000, 784)
    x_test = x_test.reshape(10000, 784)

    # Converting from 0-256 coding to float.  Darkness of a pixel was controlled by 0-256, by dividing by 255 and converting to
    # float we have the same relative numbers but within 0-1
    x_train = x_train.astype('float32')
    x_test = x_test.astype('float32')
    x_train /= 255
    x_test /= 255

    # Converting to binary for keras to process, since categories are not binary we will convert manually
    y_train = keras.utils.to_categorical(y_train, 10)
    y_test = keras.utils.to_categorical(y_test, 10)

    return([x_train, x_test, y_train, y_test])


#The following function creates keras model, compiles it and returns it
def create_model():
    # Using 3 hidden layers with 200 nodes.
    model = Sequential()
    model.add(Dense(200, activation='relu', input_shape=(784,)))
    model.add(Dense(200, activation='relu'))
    model.add(Dense(200, activation='relu'))
    model.add(Dense(200, activation='relu'))
    model.add(Dense(10, activation='softmax'))

    # Comppiling the model
    model.compile(loss='categorical_crossentropy', optimizer=RMSprop(), metrics=['accuracy'])

    return(model)



def main():
    x_train, x_test, y_train, y_test = pulldata()
    model = create_model()

    # Training the model
    train = model.fit(x_train, y_train, batch_size=100, epochs=20, verbose=1, validation_data=(x_test, y_test), callbacks=[early_stop])
    results = model.evaluate(x_test, y_test)

    print('Loss score:', results[0])
    print('Prediction Accuracy:', results[1])



if  __name__ =='__main__':
    main()