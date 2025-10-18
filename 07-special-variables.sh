#!/bin/bash
echo "All variables passed : $@"
echo "Numbers of variables: $#"
echo "Script name: $0"
echo "Present working directory: $PWD"
echo "Home directory of current user: $USER"
echo "Process id of current script: $$"
sleep 100 &
echo "Process id of last command in background: $!"
