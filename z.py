import os
import xlwt
from xlwt import Workbook

# Workbook is created
wb = Workbook()
folder = "C:\\Users\\anujp\\OneDrive\\Documents\\Dataset_ICME"
f = open("z.txt","r")

list1=[]
lines = f.readlines(36080334)
i=0

for line in lines:
    if(line.__contains__("VMAF score:")):
        list1.append(line[-10:])
        i+=1

# add_sheet is used to create sheet.
sheet1 = wb.add_sheet('Sheet 1')

sheet1.write(0,0,'File Name')
sheet1.write(0,1,'VMAF Score')

m = 1
for file in os.listdir(folder):
    sheet1.write(m,0,file)
    m+=1

l = 1
for item in list1:
    sheet1.write(l,4,list1[l-1])
    l+=1


wb.save('z2.xls')
f.close()