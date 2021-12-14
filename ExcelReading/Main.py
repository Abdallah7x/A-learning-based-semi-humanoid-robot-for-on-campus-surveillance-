import sys
  
# adding Folder_2 to the system path
sys.path.insert(0, 'F:/Senior Year/GP/Proposal/ExcelReading')
  
# importing the add and odd_even 
# function
from ExcelReading import ReadFileData_Time
  
# calling odd_even function
ReadFileData_Time("Pierre Malak" ,"Sunday", "14")
