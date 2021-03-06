# from flask import Flask, jsonify, request
# import json

# #declared an empty variable for reassignment
# response = ''

# #creating the instance of our flask application
# app = Flask(__name__)

# #route to entertain our post and get request from flutter app
# @app.route('/name', methods = ['GET', 'POST'])
# def nameRoute():

#     #fetching the global response variable to manipulate inside the function
#     global response

#     #checking the request type we get from the app
#     if(request.method == 'POST'):
#         request_data = request.data #getting the response data
#         request_data = json.loads(request_data.decode('utf-8')) #converting it from json to key value pair
#         name = request_data['name'] #assigning it to name
#         response = f'Hi {name}! this is Python' #re-assigning response with the name we got from the user
#         return " " #to avoid a type error 
#     else:
#         return jsonify({'name' : response}) #sending data back to your frontend app

# if __name__ == "__main__":
#     app.run(debug=True)

from flask import Flask, jsonify, request
import json
import face_recognition
import cv2
import numpy as np
import os
response = ''

#creating the instance of our flask application
app = Flask(__name__)

#route to entertain our post and get request from flutter app
@app.route('/name2', methods = ['GET', 'POST'])
def nameRoute():

    #fetching the global response variable to manipulate inside the function
    global response
    global name


    #checking the request type we get from the app
    if(request.method == 'POST'):

        path = 'C:/Users/Dell/Desktop/Grad/face_rec/training2'
        images = []   # LIST CONTAINING ALL THE IMAGES
        className =[]    # LIST CONTAINING ALL THE CORRESPONDING CLASS Names
        myList = os.listdir(path)
        for x,cl in enumerate(myList):
                curImg = cv2.imread(f'{path}/{cl}')
                images.append(curImg)
                className.append(os.path.splitext(cl)[0])
        #print(className)
        
        
        def findEncodings(images):
            encodeList = []
            for img in images:
                img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
                encode = face_recognition.face_encodings(img)[0]
                encodeList.append(encode)
            return encodeList
        
        encodeListKnown = findEncodings(images)
        print('Encodings Complete')
        cap = cv2.VideoCapture('https:192.168.1.3:8080/video')
        
        
        while True:
            success, img = cap.read()
            imgS = cv2.resize(img, (0, 0), fx=0.25, fy=0.25)
            imgS = cv2.cvtColor(imgS, cv2.COLOR_BGR2RGB)
            
            
            facesCurFrame = face_recognition.face_locations(imgS)
            encodesCurFrame = face_recognition.face_encodings(imgS, facesCurFrame)
            
            for encodeFace,faceLoc in zip(encodesCurFrame,facesCurFrame):
                matches = face_recognition.compare_faces(encodeListKnown, encodeFace)
                faceDis = face_recognition.face_distance(encodeListKnown, encodeFace)
                matchIndex = np.argmin(faceDis)
                
                if matches[matchIndex]:
                    name = className[matchIndex]
                    print(name)

                    y1,x2,y2,x1=faceLoc
                    y1, x2, y2, x1 = y1*4,x2*4,y2*4,x1*4
                    cv2.rectangle(img, (x1, y1), (x2, y2), (0, 255, 0), 2)
                    cv2.rectangle(img, (x1, y2 - 35), (x2, y2), (0, 255, 0), cv2.FILLED)
                    cv2.putText(img, name, (x1 + 6, y2 - 6), cv2.FONT_HERSHEY_DUPLEX, 1.0, (255, 255, 255), 1)
                else:


                    name = "Unknown"
                    y1,x2,y2,x1=faceLoc
                    y1, x2, y2, x1 = y1*4,x2*4,y2*4,x1*4
                    cv2.rectangle(img, (x1, y1), (x2, y2), (0, 255, 0), 2)
                    cv2.rectangle(img, (x1, y2 - 35), (x2, y2), (0, 255, 0), cv2.FILLED)
                    cv2.putText(img, name, (x1 + 6, y2 - 6), cv2.FONT_HERSHEY_DUPLEX, 1.0, (255, 255, 255), 1)
                     
        
                    
            cv2.imshow('webcam',img)
            cv2.waitKey(1)
        
            response = f'Hi {name}! you did it' #re-assigning response with the name we got from the user
            return " " #to avoid a type error 
    else:

        return jsonify({'name' : response}) #sending data back to your frontend app

if __name__ == "__main__":
     app.debug = True
     app.run(host="0.0.0.0")
