# -*- coding: utf-8 -*-
import glob
# Reading all *.dat filenames with the tests time values
files = glob.glob("data/*.dat")
# Loading files and processing data
i = 1
for datafile in files:
    print ('Current filename ' + str(i) + ': ' + datafile)
    i += 1
    f = open(datafile + '_mean.mdat', 'w')    # Calculated values of mean
    # Creating local variables for statistics
    index = 1          # Storage the index of the value
    currentValue = 0   # Value read from the file
    previousValue = 0  # Value read from the previous iteration
    mean = 0           # Contains the mean cumulative
    for fileLine in open(datafile):
        currentVal = float(fileLine)
        if index > 1:
            if index > 2:
                print('Index greather than 2')
                mean = (mean * (index - 1) + currentVal) / index
            else:
                print('Index equal than 2')
                mean = (currentVal + previousValue) / index
            print ('Mean value: ' + str(mean))
            f.write(str(mean)+'\n')
        else:
            print('Readed first value from file...')
        # Preparing variables for the next iteration
        previousValue = currentVal
        index += 1
print 'End calculator'
