import face_recognition as fr
import os
import sys
import cv2
import face_recognition
import numpy as np
from time import sleep


def get_encoded_faces():
    """

    make dictionary of (name, image encoded)
    """
    encoded = {}

    for dirpath, dnames, fnames in os.walk("./training"):
        for f in fnames:
            if f.endswith(".jpg") or f.endswith(".jpeg"):
                face = fr.load_image_file("training/" + f)
                encoding = fr.face_encodings(face)[0]
                encoded[f.split(".")[0]] = encoding

    return encoded

def unknown_image_encoded(img):
   
      face = fr.load_image_file("training/" + img)
      encoding = fr.face_encodings(face)[0]
      return encoding







  
def rec_face(im):

    faces = get_encoded_faces()
    faces_encoded = list(faces.values())
    known_face_names = list(faces.keys())
    img = cv2.imread(im, 1)
    img = cv2.resize(img, (0, 0), fx=0.9, fy=0.8)
 
    face_locations = face_recognition.face_locations(img)
    unknown_face_encodings = face_recognition.face_encodings(img, face_locations)

    face_names = []
    for face_encoding in unknown_face_encodings:
        # See if the face is a matches
        matches = face_recognition.compare_faces(faces_encoded, face_encoding)
        name = "Unknown"

        # use the known face with the smallest distance to the new face
        face_distances = face_recognition.face_distance(faces_encoded, face_encoding)
        best_match_index = np.argmin(face_distances)
        if matches[best_match_index]:
            name = known_face_names[best_match_index]

        face_names.append(name)
        
        
            # Draw box

        for (top, right, bottom, left), name in zip(face_locations, face_names):
            cv2.rectangle(img, (left-20, top-20), (right+20, bottom+20), (0, 255, 255), 2)

            # Draw label 
            cv2.rectangle(img, (left-20, bottom -15), (right+60, bottom+20), (0, 255, 255), cv2.FILLED)
            font = cv2.FONT_HERSHEY_DUPLEX
            cv2.putText(img, name, (left -20, bottom + 15), font, 1.0, (255, 255, 255), 2)


    x=True
    while x==True:

        cv2.imshow('face', img)
        if cv2.waitKey(0) & 0xFF == ord('q'):
            return face_names 
        x=False
        cv2.destroyAllWindows()
        
        
if __name__ == "__main__": 
     
    directory = "C:/Users/Dell/Desktop/Grad/face_rec/testing"
    files = os.listdir(directory)
    for file in files:
        print(directory+'/'+file)
        print(rec_face(directory+'/'+file))

           x=True
    while x==True:

        cv2.imshow('face', img)
        if cv2.waitKey(0) & 0xFF == ord('q'):
            return face_names 
        x=False
        cv2.destroyAllWindows()
 
