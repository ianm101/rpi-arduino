#!/bin/bash

# Replace 'path/to/your/sketch' with the actual path to your Arduino sketch (.ino) file
sketch_path="./arduino_script.ino""

# Replace 'your_board_fqbn' with the Fully Qualified Board Name for your specific Arduino board
# For example, for Arduino Uno: 'arduino:avr:uno'
# You can find the FQBN by running 'arduino-cli board listall'
board_fqbn="arduino:avr:uno"

# Set the port to which your Arduino board is connected (e.g., '/dev/ttyACM0')
arduino_port="/dev/ttyACM0"


echo "Compiling sketch..."
# Compile the sketch
arduino-cli compile --fqbn $board_fqbn $sketch_path

echo "Uploading sketch..."
# Upload the compiled sketch to the Arduino board
arduino-cli upload -p $arduino_port --fqbn $board_fqbn $sketch_path

echo "Done."
