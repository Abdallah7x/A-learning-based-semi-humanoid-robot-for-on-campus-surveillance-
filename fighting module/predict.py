
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
from tensorflow import keras


mymodel = keras.models.load_model('C:/Users/Dell/Desktop/Grad/Violence-Detection-CNN-LSTM-master/mymodel.h5')
mymodel.summary()

in_dir = "dataa"

img_size = 224

img_size_touple = (img_size, img_size)


num_channels = 3

img_size_flat = img_size * img_size * num_channels

num_classes = 2

_num_files_train = 1

_images_per_file = 20

_num_images_train = _num_files_train * _images_per_file

video_exts = ".avi"



def get_frames(current_dir, file_name):
    
    in_file = os.path.join(current_dir, file_name)
    
    images = []
    
    vidcap = cv2.VideoCapture(in_file)
    
    success,image = vidcap.read()
        
    count = 0

    while count<_images_per_file:
                
        RGB_img = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
    
        res = cv2.resize(RGB_img, dsize=(img_size, img_size),
                                 interpolation=cv2.INTER_CUBIC)
    
        
        images.append(res)
    
        success,image = vidcap.read()
    
        count += 1
        
    resul = np.array(images)
    
    
    resul = (resul / 255.).astype(np.float16)
        
    return resul

def label_video_names(in_dir):
    
    names = []
    labels = []
      
    for current_dir, dir_names,file_names in os.walk(in_dir):
        
        for file_name in file_names:
            
            if file_name[0:2] == 'V':
                labels.append([1,0])
                names.append(file_name)
            elif file_name[0:2] == 'NV':
                labels.append([0,1])
                names.append(file_name)
                     
            
    c = list(zip(names,labels))
    
    shuffle(c)
    
    names, labels = zip(*c)
            
    return names, labels
in_dir_prueba = 'dataa'

names, labels = label_video_names(in_dir_prueba)

training_set = int(len(names)*0.8)
validation_set = int(len(names)*0.2)


names_training = names[0:training_set]      #x_train
names_validation =list( names[training_set:])     #x_test
print(type(names_validation))

labels_training = labels[0:training_set]    #y_train
labels_validation = list(labels[training_set:])   #y_test



def process_alldata_validation():
    
    joint_transfer=[]
    frames_num=20
    count = 0
    
    with h5py.File('pruebavalidation.h5', 'r') as f:
            
        X_batch = f['data'][:]
        y_batch = f['labels'][:]

    for i in range(int(len(X_batch)/frames_num)):
        inc = count+frames_num
        joint_transfer.append([X_batch[count:inc],y_batch[count]])
        count =inc
        
    data =[]
    target=[]
    
    for i in joint_transfer:
        data.append(i[0])
        target.append(np.array(i[1]))
        
    return data, target


def process_alldata_training():
    
    joint_transfer=[]
    frames_num=20
    count = 0
    
    with h5py.File('prueba.h5', 'r') as f:
            
        X_batch = f['data'][:]
        y_batch = f['labels'][:]

    for i in range(int(len(X_batch)/frames_num)):
        inc = count+frames_num
        joint_transfer.append([X_batch[count:inc],y_batch[count]])
        count =inc
        
    data =[]
    target=[]
    
    for i in joint_transfer:
        data.append(i[0])
        target.append(np.array(i[1]))
        
    return data, target
print(names_validation[0])
data_val, target_val = process_alldata_validation()

y_pred = mymodel.predict(np.array(data_val))
print(y_pred[29])

