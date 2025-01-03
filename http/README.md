# Daxi HTTP Input Monitoring Script

This is a simple Lua script created for Daxi devices. The purpose of this script is to monitor the states of multiple inputs and send data to a remote server using HTTP when an input is activated. It's a practical solution for situations where you need to keep track of different input signals and respond when one of them is active.

## Features

- **Input Monitoring**: The script can check up to 8 different inputs to see which ones are active.
- **HTTP Notifications**: It sends a message over the internet to a specified address whenever an input is detected as active.
- **Easy Debugging**: The script logs the current status of each input to the console, which helps in monitoring and debugging.

## How It Works

1. **Initialization**: The script begins by setting a timeout, which determines how often it checks the input states.
2. **Checking Input States**: The `timeoutHandler` function loops through the inputs one by one to see which input is currently active. If an input is found to be active (state = 1), it logs this information and prepares to send data.
3. **Sending Data**: When an active input is detected, the script creates a message that includes the index of the activated input. This message is then sent to a specific HTTP endpoint.
4. **Continuous Monitoring**: After sending the data, the script continues to check all inputs in a loop, ensuring that it catches any newly activated inputs right away.
5. **Resetting the Index**: When the script finishes checking all inputs, it resets the index to start checking from the first input again.

![image](https://github.com/user-attachments/assets/0be33638-f986-44b1-8275-1911d7809a28)

![image](https://github.com/user-attachments/assets/f814cfc7-ea47-4333-b0db-24fb5a3b3a7a)

![image](https://github.com/user-attachments/assets/d14bb79b-a710-4c36-827b-23dbdfb161b8)

![image](https://github.com/user-attachments/assets/071e30d3-a1ba-40bb-af0a-6c7c35b78bdb)

## Check the effect in out app Discoverer:

![image](https://github.com/user-attachments/assets/9275b7fc-32c1-46d2-a2a0-4681e4bb9999)
