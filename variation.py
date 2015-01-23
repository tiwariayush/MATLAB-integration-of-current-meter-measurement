#!usr/bin/python

'''
    Importing xlrd library to read xls file from which
    data of velocity variation would be determined 
'''

import xlrd
from integration import Integrate

# Opening workbook of velocity data
book = xlrd.open_workbook("velocity.xlsx")

# Reading the sheet in which velocity variation is given
sheet = book.sheet_by_name('Sheet1')

# Creating empty list to store all velocities
velocities = []
 
# Looping in the data to find maximum velocity
for i in range (1,sheet.nrows):
  for j in range (1,sheet.ncols):

    # Appending all velocities in a list
    velocities.append(sheet.cell(i,j).value)

    # Reverse sorting the velocities list
    velocities.sort(reverse=True)

    # Finding maximum velocity as the firt element in sorted velocities list
    vmax = velocities[0]

# Looping in the data to find width, depth and velocity for all points
for i in range (1,sheet.nrows):
  for j in range (1,sheet.ncols):

    # Finding width as the element where row is 0
    width = sheet.cell(0,j).value

    # Finding depth as the element where column is 0
    depth = sheet.cell(i,0).value

    # Finding velocity as the cell where row, column is i,j
    velocity = sheet.cell(i,j).value

    integ = Integrate(vmax)
    integ.calculate_vel(width, depth, velocity)
