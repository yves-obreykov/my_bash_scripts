#!/bin/bash

sudo apt update && sudo apt upgrade -y
if [ $? -eq 0 ]
then 
        echo "Successfully installed updates"
else
        echo "Was not able to upgrade"
fi

