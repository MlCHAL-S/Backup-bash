# Backup Script

## Overview

This Bash script creates a backup of files and directories that have been modified within the last 24 hours from a specified source directory to a specified destination directory. It compresses the backup into a `.tar.gz` file and moves it to the destination directory.

## Prerequisites

- **Operating System**: Linux or any Unix-like OS with Bash shell.
- **Dependencies**: `tar`, `date`, `ls`, and basic Unix commands (typically available by default on most Unix-like systems).

## Usage

1. **Clone the Repository** (if this script is part of a repository):

    ```bash
    git clone <repository_url>
    ```

2. **Navigate to the Script Directory**:

    ```bash
    cd <repository_directory>
    ```

3. **Make the Script Executable**:

    ```bash
    chmod +x backup.sh
    ```

4. **Run the Script**:

    ```bash
    ./backup.sh <target_directory> <destination_directory>
    ```

    Replace `<target_directory>` with the path to the directory you want to back up and `<destination_directory>` with the path where you want the backup to be stored.

## Script Details

- **Argument Checking**: The script requires exactly two arguments:
  - `target_directory_name`: The directory to back up.
  - `destination_directory_name`: The directory where the backup will be stored.

  If the number of arguments is incorrect or if any of the provided paths are invalid, the script will display an error message and exit.

- **Timestamp Generation**: The script generates a timestamp for the backup filename and also calculates the timestamp for 24 hours ago to filter recent files.

- **Backup Creation**: The script lists files in the target directory, checks which files have been modified within the last 24 hours, and creates a compressed `.tar.gz` archive of these files.

- **File Movement**: After creating the backup file, it moves the file to the specified destination directory.

- **Messages**: The script provides feedback on the process, including the target and destination directories, the timestamp, and the names of the backup files.

## Example

```bash
./backup.sh /home/user/documents /home/user/backups

