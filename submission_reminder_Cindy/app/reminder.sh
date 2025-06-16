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

