#!bin/bash

echo "Enter new assignment name:"
read new_assignment

sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=$new_assignment/" submission_reminder_*/config/config.env

bash submission_reminder_*/startup.sh
