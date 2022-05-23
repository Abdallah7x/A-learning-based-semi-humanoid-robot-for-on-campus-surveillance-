from neuralintents import GenericAssistant
import speech_recognition 
import pyttsx3 as tts 
import sys
import os
import cv2
from ExcelReading import ReadFileData_Day as Read_Day
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
        speak("Unable to Recognize your voice.. Please repeat.") 
        #speak("Can't Recognize please repeat")
        s=takeCommand()
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
        
    
    
def say_MySchaduel_Day():
    speak('Here I can Read the schaduel for you')
    
    speak('Tell me The Day')
    
    Day = takeCommand()
    
    Read_Day("Pierre Malak", Day)
    
    
    
        
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
    
    
mapings ={"greeting":hello ,
          "empty_spaces": empty_spaces , 
          "empty_rooms":empty_rooms ,
          "find_doctor":find_doctor ,
          "exit": out ,
          "cant_hear":cant_hear ,
          "find_student":find_student,
          "say_MySchaduel_Day":say_MySchaduel_Day
          }



#assistant = GenericAssistant.load_model('self',model_name="test_model",)
assistant = GenericAssistant('intents.json', model_name = "test_model",intent_methods=mapings)
assistant.train_model()
assistant.save_model()

            

            
                       
if __name__ == '__main__':
    # ---------- This Function clear will clean any command before execution of this python file------
    clear = lambda: os.system('cls')
    #--------------------------------#
    clear()
    speak("Here's M i u's  Robot , how can i help you?")
    while True:
        
        query = takeCommand().lower()
        assistant.request(query) 
            
             
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
