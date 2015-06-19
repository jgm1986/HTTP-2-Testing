# -*- coding: utf-8 -*-
# This tool provides an automatic way to get basic statistic values as: Mean value and Standar deviation
# The mean data files should be inside "data" directory and "mean" for each file shoud be inside "mean" directory.
#
#
import glob
import os
import math
# Reading all *.dat filenames with the tests time values
files = glob.glob("data/*.dat")
# Loading files and processing data
n = 0
for datafile in files:
    # Reading last value of accumulated mean for the curren test
    fshell = os.popen('tail -n 1 mean/' + os.path.basename(datafile) + '_mean.mdat')
    meanValue = float(fshell.read()) / 1000 # Parsing units us to ms.
    ## Creating local variables for statistics
    sumatoryValue = 0           # Contains the result of the summatory used for calc Standard deviation
    n = 0    # Number of statistical samples storaged in to .dat file.
    for fileLine in open(datafile):
	fileLine = float(fileLine) / 1000 # Parsing units us to ms.
        sumatoryValue = sumatoryValue + math.pow(fileLine-meanValue, 2)
        #print str(sumatoryValue)
        n += 1
    # Calculate Standard deviation
    sDeviation = math.sqrt((1 / float(n)) * sumatoryValue)
    print ('- Current filename: ' + os.path.basename(datafile) + '\tMean value: ' + str(meanValue) + '\tStandar Deviation: ' + str(sDeviation))
print 'End calculator'
