#!/bin/bash
source ./rules.sh

echo "Enter max value : (Max : 4.100.200.300)"
read maxValue


checkDivideByTwo
echo $?