#!/usr/bin/env python

import os
import time
import datetime

DATETIME_FORMAT = "%Y-%m-%d %H:%M:%S"
TIMESHEET_FILE = "/home/alec/timesheet.txt"
TIMESHEET_ACTIVATED = "Timesheet Activated"
TIMESHEET_DEACTIVATED = "Timesheet Deactivated"
TIMESHEET_ENTRY_CHAR = "T"

def processSession(line):
	if not (previousLine == None or previousLine == TIMESHEET_ACTIVATED or previousLine == TIMESHEET_DEACTIVATED):
		endTimestamp = time.strptime(previousLine, DATETIME_FORMAT)
		session = time.mktime(endTimestamp) - time.mktime(startTimestamp)
		print("Session found: ", session)
		return session
	return 0.0

timeTotalSeconds = 0.0
timesheetActive = False
previousLine = None
startTimestamp = None

with open(TIMESHEET_FILE) as file:
	for line in file:
		if line.endswith("\n"):
			line = line[:-1]
		if line == TIMESHEET_ACTIVATED:
			timesheetActive = True
			startTimestamp = None
		elif line == TIMESHEET_DEACTIVATED:
			timesheetActive = False
			timeTotalSeconds += processSession(previousLine)
		else:
			line = line[1:]
			if startTimestamp == None:
				startTimestamp = time.strptime(line, DATETIME_FORMAT)
			
		previousLine = line

timeTotalSeconds += processSession(previousLine)
hours = round(timeTotalSeconds / 60 / 60)
minutes = round(timeTotalSeconds / 60 - (hours * 60))
print("Total time: %d hours and %d minutes" % (hours, minutes))
