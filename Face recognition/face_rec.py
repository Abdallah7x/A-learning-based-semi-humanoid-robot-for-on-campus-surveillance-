import face_recognition as fr
import os
import sys
import cv2
import face_recognition
import numpy as np
from time import sleep



def imagename():
    vid = cv2.VideoCapture(0)
  
cam = cv2.VideoCapture(0)

cv2.namedWindow("test")

img_counter = 0
cascPath=os.path.dirname(cv2.__file__)+"/data/haarcascade_frontalface_default.xml"
faceCascade = cv2.CascadeClassifier(cascPath)

while True:
    ret, frame = cam.read()
    if not ret:
        print("failed to grab frame")
        break
    

    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    faces = faceCascade.detectMultiScale(
        gray,
        scaleFactor=1.1,
        minNeighbors=5,
        minSize=(30, 30),
        flags=cv2.CASCADE_SCALE_IMAGE
    )

    # Draw a rectangle around the faces
    for (x, y, w, h) in faces:
        cv2.rectangle(frame, (x, y), (x+w, y+h), (0, 0, 0), 2)

    # Display the resulting frame
    cv2.imshow("test", frame)

    k = cv2.waitKey(1)
    if k%256 == 27:
        # ESC pressed
        print("Escape hit, closing...")
        break
    elif k%256 == 32:
        # SPACE pressed
        img_name = "opencv_frame_{}.png".format(img_counter)
        cv2.imwrite(img_name, frame)
        x=img_name
        
        print("{} written!".format(img_name))
        img_counter += 1

cam.release()

cv2.destroyAllWindows()


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
# =============================================================================
#             cv2.rectangle(img, (left-20, top-20), (right+20, bottom+20), (0, 255, 255), 2)
# 
# =============================================================================
            # Draw label 
            cv2.rectangle(img, (left-20, bottom -15), (right+60, bottom+20), (0, 0, 0), cv2.FILLED)
            font = cv2.FONT_HERSHEY_DUPLEX
            cv2.putText(img, name, (left -20, bottom + 15), font, 1.0, (255, 255, 255), 2)
            print(name)



    x=True
    while x==True:

        cv2.imshow('face', img)
        if cv2.waitKey(0) & 0xFF == ord('q'):
            return face_names 
        x=False
        cv2.destroyAllWindows()
        
        
if __name__ == "__main__": 
    print(rec_face(img_name))

        
 
