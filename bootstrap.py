import os
import sys
import subprocess
from pathlib import Path

BASE_DIR = Path.cwd()
VENV_DIR = BASE_DIR / "venv"
DEPENDENCIES_FILE = BASE_DIR / "dependencies.txt"

def create_venv():
  if not VENV_DIR.exists():
    print("Creating Virtual Environment")
    subprocess.check_call([sys.executable, "-m", "venv", str(VENV_DIR)])
  else:
    print("Virtual Environment Already Exists")

def get_pip_executable():
  pip_executable_name = "pip.exe" if os.name == "nt" else "pip"
  return VENV_DIR / ("Scripts" if os.name == "nt" else "bin") / pip_executable_name

def install_dependencies():
  if DEPENDENCIES_FILE.exists():
    print("Installing Dependencies")
    subprocess.check_call([str(get_pip_executable()), "install", "-r", str(DEPENDENCIES_FILE)])

def main():
  create_venv()
  install_dependencies()

if __name__ == "__main__":
  main()