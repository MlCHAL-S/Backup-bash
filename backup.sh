#!/bin/bash

# This checks if the number of arguments is correct
# If the number of arguments is incorrect ( $# != 2) print error message and exit

if [[ $# != 2 ]]
then
  echo "Usage: backup.sh target_directory_name destination_directory_name"
  exit 1
fi

# This checks if argument 1 and argument 2 are valid directory paths
if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid directory path provided"
  exit 1
fi

targetDirectory=$1
destinationDirectory=$2

# Display the values of the two command line arguments
echo "Target Directory: $targetDirectory"
echo "Destination Directory: $destinationDirectory"

# Define currentTS as the current timestamp
currentTS=$(date +%s)
echo "Current Timestamp: $currentTS"

# Define backupFileName to store the name of the backup file
backupFileName="backup-${currentTS}.tar.gz"
echo "Backup File Name: $backupFileName"

# Define origAbsPath with the absolute path of the current directory
origAbsPath=$(pwd)
echo "Original Absolute Path: $origAbsPath"

# Define destAbsPath as the absolute path of the destination directory
cd $destinationDirectory
destAbsPath=$(pwd)
echo "Destination Absolute Path: $destAbsPath"

# Change directories to the target directory
cd $origAbsPath
cd $targetDirectory

# Define yesterdayTS as the timestamp 24 hours prior to currentTS
yesterdayTS=$(($currentTS - 24*60*60))
echo "Yesterday Timestamp: $yesterdayTS"

# List all files and directories in the current folder
declare -a toBackup
for file in $(ls)
do
  # Check if the file was modified within the last 24 hours
  if [[ $(date -r $file +%s) -gt $yesterdayTS ]]
  then
    # Add the file to the toBackup array
    toBackup+=("$file")
  fi
done

# Compress and archive the files to a backup file
tar -czvf "$backupFileName" "${toBackup[@]}"

# Move the backup file to the destination directory
mv "$backupFileName" "$destAbsPath"
echo "Moved $backupFileName to $destAbsPath"

echo "Backup completed successfully!"

