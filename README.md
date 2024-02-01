# helsinki-guide-test
This repository contains UI tests for [a Helsinki Guide bot](https://github.com/AndreyAD1/helsinki-guide).

## Project Goals
Since the Helsinki Guide bot has a quite diverse interface, end-to-end tests are helpful.
Moreover, this project nicely helps me refresh and refine my Robot Framework and Selenium skills.

## Getting Started
1. Install Python 3.12 or newer.
2. Install [Poetry](https://python-poetry.org/).
3. Clone this repository.
4. Open the downloaded directory in your terminal and run this command: 
    ```shell
    poetry install --no-root
    ```
   This command will create a new virtual environment and install the project dependencies.
5. Follow [this instruction](http://robotframework.org/SeleniumLibrary/#browser-drivers) 
to install Selenium drivers for the browsers that you are going to test.
6. Determine the name of the bot chat you are going to test. 
Use this name as a `BOT_NAME` variable in a test run command:
   ```shell
   robot --variable BOT_NAME:[The bot name] .
   ```

If everything works fine, you will see an open browser window with an invitation to log in to your account.
After signing in, tests will run.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.