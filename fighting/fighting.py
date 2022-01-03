import sklearn
import cv2
import os
import numpy as np
import matplotlib.pyplot as plt
import download
from random import shuffle
from tensorflow.keras.applications import VGG19
from keras import backend as K
from keras.models import Model, Sequential
from keras.layers import Input
from keras.layers import LSTM
from keras.layers import Dense, Activation
import sys
import h5py
import tensorflow as tf
import pandas as pd
import keras
from keras import metrics
from mydata import *

class machine():
    

    chunk_size = 4096
    n_chunks = 20
    rnn_size = 512
    
    model = Sequential()
    model.add(LSTM(rnn_size, input_shape=(n_chunks, chunk_size)))
    model.add(Dense(1024))
    model.add(Activation('relu'))
    model.add(Dense(50))
    model.add(Activation('sigmoid'))
    model.add(Dense(2))
    model.add(Activation('softmax'))
    model.compile(loss='mean_squared_error', optimizer='adam',metrics=['accuracy'])
    
    
    epoch = 25
    batchS = 100
    
    data, target = process_alldata_training()

    
    data_val, target_val = process_alldata_validation()
    history=model.fit(np.array(data), np.array(target), epochs=epoch, batch_size=batchS, verbose=2)
    model.save("C:/Users/Dell/Desktop/Grad/Violence-Detection-CNN-LSTM-master/mymodel.h5")


    #model.fit(data, target, epochs=epoch, batch_size=batchS, verbose=2)


    result = model.evaluate(np.array(data_val), np.array(target_val))



    for name, value in zip(model.metrics_names, result):
        print(name,value)
        

    plt.plot(history.history['accuracy'])
    plt.title('model accuracy')
    plt.ylabel('accuracy')
    plt.xlabel('epoch')
    plt.legend(['train'], loc='upper left')
    plt.savefig('destination_path.eps', format='eps', dpi=1000)
    plt.show()

    plt.plot(history.history['loss'])
    plt.title('model loss')
    plt.ylabel('loss')
    plt.xlabel('epoch')
    plt.legend(['train'], loc='upper left')
    plt.savefig('destination_path1.eps', format='eps', dpi=1000)
    plt.show()    


    # training_set = int(len(names)*0.8)
    # validation_set = int(len(names)*0.2)

    # names_training = names[0:training_set]      #x_train
    # names_validation = names[training_set:]     #x_test

    # labels_training = labels[0:training_set]    #y_train
    # labels_validation = labels[training_set:]   #y_test
