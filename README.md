## Python VENV Bootstrapper Code

**To run:**

1. Create a shell file at the root of your project. For example `main.sh`.
2. Make it executable using
```shell
chmod +x main.sh
```
3. Add a `dependencies.txt` file at the same level of the `main.sh` file. Write your dependencies in it. A sample is available in this repository.
4. Add the following line to the beginning of the shell file
```shell
source <(curl -fsSL https://raw.githubusercontent.com/shourovfoisal/python-bootstrapper/refs/heads/main/main.sh)
```
5. After the previous line, write your code that executes your python file. For example:
```shell
python3 script.py
```
6. A venv will be created with the desired dependencies, and your code will be executed right after it.