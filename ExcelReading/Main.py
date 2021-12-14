import sys
  
# adding Folder_2 to the system path
sys.path.insert(0, 'E:/CS/Graduation Project/-A-learning-based-semi-Humanoid-Robot-for-On-campus-Surveillance-main/ExcelReading')
sys.path.insert(0, 'E:/CS/Graduation Project/-A-learning-based-semi-Humanoid-Robot-for-On-campus-Surveillance-main/VoiceCommands')

from ExcelReading import ReadFileData_Time
from Project_VoiceCommands import begin

#ReadFileData_Time("Pierre Malak" ,"Sunday", "14")

if __name__ == '__main__':
    
    begin()
