
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


class mydata:
    in_dir = "data"
    
    img_size = 224
    
    img_size_touple = (img_size, img_size)
    
    

    num_channels = 3
    
    img_size_flat = img_size * img_size * num_channels
    
    num_classes = 2
    
    _num_files_train = 1
    
    _images_per_file = 20
    
    _num_images_train = _num_files_train * _images_per_file
    
    video_exts = ".avi"
    
    
    
    
    in_dir = "data"
   
c1=mydata()


def print_progress(count, max_count):
    pct_complete = count / max_count

    msg = "\r- Progress: {0:.1%}".format(pct_complete)

    sys.stdout.write(msg)
    sys.stdout.flush()
    

def get_frames(current_dir, file_name):
    
    in_file = os.path.join(current_dir, file_name)
    
    images = []
    
    vidcap = cv2.VideoCapture(in_file)
    
    success,image = vidcap.read()
        
    count = 0

    while count<c1._images_per_file:
                
        RGB_img = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
    
        res = cv2.resize(RGB_img, dsize=(c1.img_size, c1.img_size),
                                 interpolation=cv2.INTER_CUBIC)
    
       
        
        images.append(res)
    
        success,image = vidcap.read()
    
        count += 1
        
    resul = np.array(images)
    
    
    resul = (resul / 255.).astype(np.float16)
        
    return resul

    


image_model = VGG19(include_top=True, weights='imagenet')


image_model.summary()



transfer_layer = image_model.get_layer('fc2')

image_model_transfer = Model(inputs=image_model.input, outputs=transfer_layer.output)

transfer_values_size = K.int_shape(transfer_layer.output)[1]





def get_transfer_values(current_dir, file_name):
    
    
    shape = (c1._images_per_file,) + c1.img_size_touple + (3,)
    
    image_batch = np.zeros(shape=shape, dtype=np.float16)
    
    image_batch = get_frames(current_dir, file_name)
    
   
    shape = (c1._images_per_file, transfer_values_size)
    transfer_values = np.zeros(shape=shape, dtype=np.float16)

    transfer_values = \
            image_model_transfer.predict(image_batch)
            
    return transfer_values

in_dir_prueba = 'data'

def proces_transfer(vid_names, in_dir, labels):
    
    
    count = 0
    
    tam = len(vid_names)
    
    shape = (c1._images_per_file,) + c1.img_size_touple + (3,)
    
    while count<tam:
        
        video_name = vid_names[count]
        
        image_batch = np.zeros(shape=shape, dtype=np.float16)
    
        image_batch = get_frames(in_dir, video_name)
        
        shape = (c1._images_per_file, transfer_values_size)
        transfer_values = np.zeros(shape=shape, dtype=np.float16)
        
        transfer_values = \
            image_model_transfer.predict(image_batch)
         
        labels1 = labels[count]
        
        aux = np.ones([20,2])
        
        labelss = labels1*aux
        
        yield transfer_values, labelss
        
        count+=1
    

def make_files(n_files):
    
    gen = proces_transfer(names_training, in_dir_prueba, labels_training)

    numer = 1

    chunk = next(gen)

    row_count = chunk[0].shape[0]
    row_count2 = chunk[1].shape[0]
    
    with h5py.File('prueba.h5', 'w') as f:
    
        maxshape = (None,) + chunk[0].shape[1:]
        maxshape2 = (None,) + chunk[1].shape[1:]
    
    
        dset = f.create_dataset('data', shape=chunk[0].shape, maxshape=maxshape,
                                chunks=chunk[0].shape, dtype=chunk[0].dtype)
    
        dset2 = f.create_dataset('labels', shape=chunk[1].shape, maxshape=maxshape2,
                                 chunks=chunk[1].shape, dtype=chunk[1].dtype)
    
        dset[:] = chunk[0]
        dset2[:] = chunk[1]

        for chunk in gen:
            
            if numer == n_files:
            
                break

            dset.resize(row_count + chunk[0].shape[0], axis=0)
            dset2.resize(row_count2 + chunk[1].shape[0], axis=0)

            dset[row_count:] = chunk[0]
            dset2[row_count:] = chunk[1]

            row_count += chunk[0].shape[0]
            row_count2 += chunk[1].shape[0]
            
            print_progress(numer, n_files)
        
            
            
            numer += 1
            
def make_files_validation(n_files):
    
    gen = proces_transfer(names_validation, in_dir_prueba, labels_validation)

    numer = 1

    chunk = next(gen)

    row_count = chunk[0].shape[0]
    row_count2 = chunk[1].shape[0]
    
    with h5py.File('pruebavalidation.h5', 'w') as f:
    
        maxshape = (None,) + chunk[0].shape[1:]
        maxshape2 = (None,) + chunk[1].shape[1:]
    
    
        dset = f.create_dataset('data', shape=chunk[0].shape, maxshape=maxshape,
                                chunks=chunk[0].shape, dtype=chunk[0].dtype)
    
        dset2 = f.create_dataset('labels', shape=chunk[1].shape, maxshape=maxshape2,
                                 chunks=chunk[1].shape, dtype=chunk[1].dtype)
    
        dset[:] = chunk[0]
        dset2[:] = chunk[1]

        for chunk in gen:
            
            if numer == n_files:
            
                break

            dset.resize(row_count + chunk[0].shape[0], axis=0)
            dset2.resize(row_count2 + chunk[1].shape[0], axis=0)

            dset[row_count:] = chunk[0]
            dset2[row_count:] = chunk[1]

            row_count += chunk[0].shape[0]
            row_count2 += chunk[1].shape[0]
            
            print_progress(numer, n_files)
        
            
            
            numer += 1
  

#valores = get_transfer_values(in_dir, file_name)

#transfer_values = cache.cache(cache_path='datos_cache.pkl',
#                        fn=get_transfer_values,
#                        current_dir=in_dir,
#                        file_name="no381_xvid.avi")


def label_video_names(in_dir):
    
    names = []
    labels = []
      
    for current_dir, dir_names,file_names in os.walk(in_dir):
        
        for file_name in file_names:
            
            if file_name[0:2] == 'fi':
                labels.append([1,0])
                names.append(file_name)
            elif file_name[0:2] == 'no':
                labels.append([0,1])
                names.append(file_name)
                     
            
    c = list(zip(names,labels))
    
    shuffle(c)
    
    names, labels = zip(*c)
            
    return names, labels




names, labels = label_video_names(in_dir_prueba)



training_set = int(len(names)*0.8)
validation_set = int(len(names)*0.2)


names_training = names[0:training_set]      #x_train
names_validation = names[training_set:]     #x_test

labels_training = labels[0:training_set]    #y_train
labels_validation = labels[training_set:]   #y_test

make_files(training_set)
make_files_validation(validation_set)


 
    

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
        
    
