from neuralintents import GenericAssistant
import speech_recognition 
import pyttsx3 as tts 
import sys
import os
import cv2

# =============================================================================
#                                                                             #
# =============================================================================
#-------- SEt Of Definations --------#
# Defeinations Of Object To Recognize

# Defeinations Of Object To Speak
engine = tts.init('sapi5')
voices = engine.getProperty('voices')
engine.setProperty('voice', voices[1].id)
engine.setProperty(engine.getProperty('volume'),1.0)

engine.setProperty('rate', 150)     # setting up new voice rate
rate = engine.getProperty('rate')



recognizer = speech_recognition.Recognizer()
# ---------- Def OF function speak to boost the coding progress ----------
def speak(audio):
    engine.say(audio)
    engine.runAndWait()
    
def empty_spaces():
    speak('Empty benches now are behind The N Building')
            
# -------------- Def Of Function takeCommand To take Voice Command (Voice Input) From the user -----------
def takeCommand():
     # Def Of obcject to recognize the voice command ( Voice Input )
    r = speech_recognition.Recognizer()
    
    with speech_recognition.Microphone() as source:
         
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
        #speak("Can't Recognize please repeat")
        s="can't hear"
        return s
     
    return query            
def cant_hear():
    speak ("sorry I can't hear you ")
            
def empty_rooms():
    
    speak("here you can find empty rooms in")
    speak("main building room 224")
    speak("R building room R C 4")
    
    
    
def find_doctor():
    speak('Searching For the Doctor Schedule...')
    
    
    
    im = cv2.imread('table.png')
    cv2.imshow('table',im)
    speak('Here is his schedule..')
    cv2.waitKey(0)
    cv2.destroyAllWindows()
        
        
def hello():
    speak ("hello ,What can i do for you ?")
    
def out():
    speak("Goodbye , Thanks for your time!")
    sys.exit(0)
    
def find_student():
    speak('Searching For your Schedule...')
    im = cv2.imread('table.png')
    cv2.imshow('table',im)
    speak('Here is your schedule..')
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    
def find_Day():
    
    speak("Tell The day You want to know")
    # Day=input(takeCommand().capitalize())
    # speak("I will Print It to you on the screen")
    # ExR.ReadFileData_Day("Pierre Malak", Day)
    # #cv2.waitKey(0)
    
def find_Time():
    
    speak("Tell Me The Day ")
    # Day=input(takeCommand().capitalize())
    # speak(" The System will detect The time in 24 hours format")
    # speak(" Tell me the time in format of 24 hours ")
    # Time=input(takeCommand().lower)
    # ExR.ReadFileData_Time("Pierre Malak", Day, Time)
    
mapings ={"greeting":hello ,
          "empty_spaces": empty_spaces , 
          "empty_rooms":empty_rooms ,
          "find_doctor":find_doctor ,
          "exit": out ,
          "cant_hear":cant_hear ,
          "find_student":find_student,
          "find_Day":find_Day,
          "find_Time": find_Time
          }

          



assistant = GenericAssistant('intents.json', model_name = "test_model",intent_methods=mapings)
assistant.train_model()
assistant.save_model()

            

            
def begin():
    # ---------- This Function clear will clean any command before execution of this python file------
    clear = lambda: os.system('cls')
    #--------------------------------#
    clear()
    img=face_rec.img_name()
    Name=face_rec.rec_face(img)
    #print(img)
    engine.say("Hello "+Name)
    engine.runAndWait()
    speak("Here's M i u's  Robot , how can i help you ?")
    while True:
        
        query = takeCommand().lower()
        assistant.request(query) 
            
            
                       
if __name__ == '__main__':
    
   # begin()
            
             
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
