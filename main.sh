#!/bin/bash
set -e

# Download and run the bootstrap.py by using a temporary file.
BOOTSTRAP_FILE_URL="https://raw.githubusercontent.com/shourovfoisal/python-bootstrapper/refs/heads/main/bootstrap.py"
TEMP_FILE="$(mktemp /tmp/bootstrap.XXXXXX.py)"
printf "Installing Dependencies...\n"
curl -sSL "$BOOTSTRAP_FILE_URL" -o "$TEMP_FILE"
printf "Running the Script...\n"
python3 "$TEMP_FILE"
rm -f "$TEMP_FILE"  # Delete after use

# Activate the VENV
if [ -d "venv" ]; then
  printf "Activating the Python Virtual Environment\n"
  source venv/bin/activate
  printf "Virtual Environment Activated\nRunning the Program...\n"
else
  printf "Could not find the VENV Directory.\n"
  exit 1
fi