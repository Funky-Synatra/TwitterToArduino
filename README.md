# Twitter to Arduino LED Controller

This project is a fun experiment combining the Twitter API with physical computing using an Arduino. It was created as a personal exploration and demonstrates my ability to integrate web services with hardware.

## Description

This project is designed to:

1.  **Fetch Tweets:** Use a Python script to access the Twitter API v1.1 and retrieve the latest tweets from a specific user.
2.  **Extract Relevant Data:** Parse the tweet content to extract specific keywords or data, depending on user input.
3.  **Control Arduino:** Send instructions via serial communication to an Arduino microcontroller.
4.  **Control LEDs:** Use the Arduino to control connected LEDs based on the instructions received.

This project showcases my ability to:

*   Work with APIs.
*   Use a serial connection to send instructions.
*   Program an Arduino using the C language.
*   Combine a web application with physical computing.

## How to Use

1.  **Hardware Setup:** Connect LEDs to your Arduino board as defined in the `twitterToArduino.ino` code.
2.  **Install Dependencies:**
    *  You will need to install the `tweepy` python library by running
    ```bash
        pip install tweepy
    ```
    *  You will also need to setup an app on twitter API v1.1 and get the necessary API keys (Consumer Key, Consumer Secret, Access Token, Access Token Secret).
3.  **Configure Credentials:**
    *   Add your API keys to the python script or use environment variables.
4.  **Run the Python Script:** Execute the `TwitterToArduino.py` script.
5.  **Upload Arduino Code:** Upload the `twitterToArduino.ino` to your Arduino board.
6.  **Run the code:** The python script will connect to Twitter, fetch the tweets, process them, and send the necessary instruction via serial to your Arduino, which will then blink the LEDs.

## Important Notes

*   This project was created as a fun exploration, and is about 6 years old.
*   It's intended as a showcase of my interest in merging web technologies and hardware.
*   You will need to set up your twitter developer account to get all the required tokens and keys.
*   You may need to tweak some of the code to get it working depending on the API.

## Disclaimer

This project is provided as is and is meant for illustrative and educational purposes.

## About Me

This project demonstrates one aspect of my diverse skill set. I'm also exploring areas such as iOS development, AI/ML, and web development. I am excited to put my knowledge and experience to work!
