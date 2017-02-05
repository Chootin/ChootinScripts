#!/usr/bin/env python

import os
import time
import datetime

ORGANPAD_PATH = "/home/alec/.organpad/"
TIMESHEET_FILE = "/home/alec/timesheet.txt"

BUTTON_1 = 17

def writeTime(timesheetFile):
	ts = time.time()
	timesheetFile.write("T" + datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d %H:%M:%S') + "\n")

timesheetActive = False

while True:	
	filename = ORGANPAD_PATH + "%s" % (BUTTON_1)
	if os.path.exists(filename):
		with open(TIMESHEET_FILE, "a") as timesheetFile:
			if not timesheetActive:
				timesheetFile.write("Timesheet Activated\n")
				timesheetActive = True
			writeTime(timesheetFile)
	else:
		if timesheetActive:
			with open(TIMESHEET_FILE, "a") as timesheetFile:
				writeTime(timesheetFile)
				timesheetFile.write("Timesheet Deactivated\n")
			timesheetActive = False
	time.sleep(30)
