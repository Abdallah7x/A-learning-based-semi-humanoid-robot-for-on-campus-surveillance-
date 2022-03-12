
import Detect_From_Frame as DF
from datetime import datetime
import mysql.connector
# datetime object containing current date and time

 
# print("now =", now)

# # dd/mm/YY H:M:S

# print("date", date)	
# print("time", time)	

def convertToBinaryData(filename):
    # Convert digital data to binary format
    with open(filename, 'rb') as file:
        binaryData = file.read()
    return binaryData

def write_file(data, filename):
    # Convert binary data to proper format and write it on Hard Disk
    with open(filename, 'wb') as file:
        file.write(data)
        
def report(im , label) :
    now = datetime.now()
    img = DF.rec_face(im)
    date = now.strftime("%d/%m/%Y")
    time = now.strftime("%H:%M:%S")
    empPicture = convertToBinaryData(img)
    mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="robot")
    name="Pierre1805213"
    mycursor = mydb.cursor()
    
    sql = "INSERT INTO ticket (action,image,Date,Time,users) VALUES (%s, %s,%s,%s,%s)"
    val = ( label,empPicture, date, time, name)
    mycursor.execute(sql, val)

    mydb.commit()
    mycursor.close()
    mydb.close()

    print("1 record inserted, ID:", mycursor.lastrowid)
    
        
# def readBLOB( photo):
#     print("Reading BLOB data from python_employee table")

#     try:
#         connection = mysql.connector.connect(host='localhost',
#                                              database='robot',
#                                              user='root',
#                                              password='')

#         cursor = connection.cursor()
#         sql_fetch_blob_query = """SELECT * from ticket"""

#         cursor.execute(sql_fetch_blob_query)
#         record = cursor.fetchall()
#         for row in record:
#             #print("Id = ", row[0], )
#             #print("Name = ", row[1])
#             image = row[1]
#            # file = row[3]
#             print("Storing employee image and bio-data on disk \n")
#             write_file(image, photo)
#             #write_file(file, bioData)

#     except mysql.connector.Error as error:
#         print("Failed to read BLOB data from MySQL table {}".format(error))

#     finally:
#         if connection.is_connected():
#             cursor.close()
#             connection.close()
#             print("MySQL connection is closed")
            
            
            
# if __name__ == "__main__":
#     # report("Detected_Frame_170.png","Fight")
#     # with open(filename, 'wb') as file:
#     #     file.write(data)
#     readBLOB( "scott_photo1.png")
    
    
    
    
    
    
