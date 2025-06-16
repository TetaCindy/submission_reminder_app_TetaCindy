#!/usr/bin/env bash
# Script to set up the submission reminder application with correct structure

read -p "Enter your name: " username
dir="submission_reminder_${username}"

mkdir -p "${dir}/app" "${dir}/modules" "${dir}/assets" "${dir}/config"

# Create and populate submissions.txt with 10 students
cat <<EOF > "${dir}/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Keira, Git, not submitted
EOF

# Create config.env
cat <<EOF > "${dir}/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

# Create functions.sh
cat <<'EOF' > "${dir}/modules/functions.sh"
# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF

# Create reminder.sh
cat <<'EOF' > "${dir}/app/reminder.sh"
# Get the directory of the current script
SCRIPT_DIR="$(dirname "$0")"

# Source config and functions
source "$SCRIPT_DIR/../config/config.env"
source "$SCRIPT_DIR/../modules/functions.sh"

# Use values from config
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING"
echo "--------------------------------------------"

# Check submission status
check_submissions "$SCRIPT_DIR/../assets/submissions.txt"

EOF

# Create startup.sh
cat <<'EOF' > "${dir}/startup.sh"
bash "$(dirname "$0")/app/reminder.sh"
EOF

# Make all .sh files executable
find "${dir}" -type f -name "*.sh" -exec chmod +x {} \;

echo "Environment setup complete in directory: $dir"
