import xlrd

File = xlrd.open_workbook("velocity.xlsx")
sheet = File.sheet_by_name('Sheet1')

for i in range (1,sheet.nrows):
  for j in range (1,sheet.ncols):
    #import pdb;pdb.set_trace()
    width = sheet.cell(0,j).value
    depth = sheet.cell(i,0).value
    velocity = sheet.cell(i,j).value
    print velocity, width, depth
