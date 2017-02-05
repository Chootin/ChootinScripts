#!/usr/bin/env python

import RPi.GPIO as GPIO
import os
import time

OUTPUT_PATH = "/home/alec/.organpad/"

BUTTON_1 = 17
BUTTON_2 = 27
BUTTON_3 = 22
BUTTON_4 = 23
BUTTON_5 = 24
BUTTON_6 = 25

INPUT_LIST = [BUTTON_1, BUTTON_2, BUTTON_3, BUTTON_4, BUTTON_5, BUTTON_6]

GPIO.setmode(GPIO.BCM)

for i in INPUT_LIST:
	GPIO.setup(i, GPIO.IN, pull_up_down=GPIO.PUD_UP)

if not os.path.exists(OUTPUT_PATH):
	os.makedirs(OUTPUT_PATH)

while True:	
	for i in INPUT_LIST:
		filename = OUTPUT_PATH + "%s" % (i)
		input_state = GPIO.input(i)
		if input_state == False:
			open(filename, 'a').close()
		else:
			if os.path.exists(filename):
				os.remove(filename)
	time.sleep(0.2)


def checkInput(pin):
	input_state = GPIO.input(pin)
	return input_state == False
