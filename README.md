The purpose of this Bash-based project is to assist students in remembering to turn in their homework on time. 
It produces a reminder message, checks who hasn't turned in a specific assignment, and reads from a list of submissions.

## Scripts Explained

 create_environment.sh

This script sets up the project structure:

- Creates folders and necessary scripts.
- Writes core logic into:
  - `app/reminder.sh`
  - `startup.sh`
- Makes all `.sh` scripts executable.
- Prints a confirmation message upon successful setup.

### `reminder.sh`

Main logic for checking submissions:

- Loads config values from `config.env`.
- Loads function definitions from `functions.sh`.
- Displays the current assignment name and days remaining.
- Calls the `check_submissions` function to display reminders for students who haven’t submitted their work.

### `startup.sh`

This is a launcher script. It runs the main reminder logic:
bash "$(dirname "$0")/app/reminder.sh"

### `functions.sh`
Contains the logic used to check submission statuses
This function is called by reminder.sh and reads from submissions.txt, skipping the header row because it contains only the
structure of the content.

### `config.env`
keeps values that can be updated

### `Copilot Shell Script`
This script automatically re-runs the reminder logic with the updated assignment name after allowing the user to interactively 
alter the assignment name used in the Submission Reminder App.
