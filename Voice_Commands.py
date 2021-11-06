#=====================================#
# !pip install speechrecognition      #
# !pip install pyaudio                # <------------- Should Install These Packages Before To Run The APP 
# !pip install pyttsx3                #
#######################################


import speech_recognition as sr   
import pyttsx3
import datetime
import os
import webbrowser 
import cv2
import matplotlib.pyplot as plt
import matplotlib.image as mpimg

# =============================================================================
#                                                                             #
# =============================================================================
#-------- SEt Of Definations --------#
# Defeinations Of Object To Recognize

# Defeinations Of Object To Speak
engine = pyttsx3.init('sapi5')
voices = engine.getProperty('voices')
engine.setProperty('voice', voices[1].id)
engine.setProperty(engine.getProperty('volume'),1.0)

engine.setProperty('rate', 150)     # setting up new voice rate
rate = engine.getProperty('rate')   # getting details of current speaking rate
print (rate)                        #printing current voice rate

# ------------------------------ -----------



#--------------------- Defination Of Functions to help us in the Program -----------------#

# ---------- Def OF function speak to boost the coding progress ----------
def speak(audio):
    engine.say(audio)
    engine.runAndWait()
#-----------------------

# ---------- Def OF function wishMe to greet according to the time  ----------
def wishMe():
    hour = int(datetime.datetime.now().hour)
    if hour>= 0 and hour<12:
        speak("Good Morning Sir !")
  
    elif hour>= 12 and hour<18:
        speak("Good Afternoon Sir !")  
  
    else:
        speak("Good Evening Sir !") 
  
    #assname =("Python")
    speak("I am your Assistant Pepper")
    speak("How Can I Help You")
    #speak(assname)
#--------------------------------------------

# -------------- Def Of Function takeCommand To take Voice Command (Voice Input) From the user -----------
def takeCommand():
     # Def Of obcject to recognize the voice command ( Voice Input )
    r = sr.Recognizer()
    
    with sr.Microphone() as source:
         
        print("Listening...")
        r.pause_threshold = 0.5
        r.adjust_for_ambient_noise(source)
        audio = r.listen(source)
  
    try:
        print("Recognizing...")   
        query = r.recognize_google(audio, language ='en-US')
        print(f"User said: {query}\n")
  
    except Exception as e:
        print(e)   
        print("Unable to Recognize your voice.") 
        speak("Can't Recognize please repeat")
        return "None"
     
    return query
#------------------------------------------------------------

#-----------------------------The END Defination Of Functions ---------------------------#


#--------------- The Main ------------#
if __name__ == '__main__':
    # ---------- This Function clear will clean any command before execution of this python file------
    clear = lambda: os.system('cls')
    #--------------------------------#
    clear()
    wishMe()
    while True:
         
        query = takeCommand().lower()
         
        # All the commands said by user will be
        # stored here in 'query' and will be
        # converted to lower case for easily
        # recognition of command
        if 'where dr ' in query:
            speak('Searching For the Doctor Schedule...')
            
            img = mpimg.imread('table.png')
            imgplot = plt.imshow(img)
            plt.show()
            
            im = cv2.imread('table.png')
            cv2.imshow('table',im)
            speak('Here is his schedule..')
            cv2.waitKey(0)
            cv2.destroyAllWindows()
            
 
        elif ' youtube'  in query:
            speak("Here you go to Youtube\n")
            webbrowser.open("youtube.com")
 
        elif ' google' in query:
            speak("Here you go to Google\n")
            webbrowser.open("google.com")
            
        elif 'room' in query:
            speak('Empty Room now is in the main building room 224')
        
        elif 'space' in query:
            speak('Empty space now is infront of gyro')
            
        elif 'bench' in query:
            speak('Empty benches now is behind The N Building')
            
        elif 'thank ' in query:
            speak("You are Welcome , Thanks for giving me your time")
            exit()
        elif '' in query:
            speak("Sorry.., I can't hear you")
 
    










# with sr.Microphone()as source:
#     print('Speak Now')
#     audio =r3.listen(source)

# if 'apple' in r2.recognize_google(audio):
#     #r2=sr.Recognizer()
#     url='https://www.youtube.com/'
#     with sr.Microphone()as source:
#         print('Search your query')
#         audio = r2.listen(source)
        
#         try:
#             get=r2.recognize_google(audio)
#             print(get)
#             wb.get().open_new(url+get)
#         except sr.UnknownValueError:
#             print('error')
#         except sr.RequestError:
#             print('failed')
