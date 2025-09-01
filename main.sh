#!/bin/bash
set -e

# Download and run the bootstrap.py by using a temporary file.
BOOTSTRAP_FILE_URL="https://raw.githubusercontent.com/shourovfoisal/python-bootstrapper/refs/heads/main/bootstrap.py"
TEMP_FILE="$(mktemp /tmp/bootstrap.XXXXXX.py)"
curl -sSL "$BOOTSTRAP_FILE_URL" -o "$TEMP_FILE"
python3 "$TEMP_FILE"
echo "Running the Script..."
rm -f "$TEMP_FILE"  # Delete after use

# Activate the VENV
if [ -d "venv" ]; then
  echo "Activating the Python Virtual Environment"
  source venv/bin/activate
  echo "Virtual Environment Activated"
  echo "Running the Program..."
else
  echo "Could not find the VENV Directory"
  exit 1
fi