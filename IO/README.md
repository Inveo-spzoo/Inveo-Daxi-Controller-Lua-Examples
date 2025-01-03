1. blink.lua
Example: Basic Blink with Built-In Relay on Daxi Controller

This code demonstrates how to control the built-in relay on a Daxi controller by performing a simple blink operation. The example uses the out_blink function to toggle the relay with customizable timing.

Code Explanation
Parameters Configuration:

channel: Specifies the I/O channel (set to 0 for the built-in relay).
ton: Duration (in milliseconds) for the relay to stay on (here, 1 second = 1000 ms).
toff: Delay (in milliseconds) before the relay pulse starts (here, 1 = 0.1s).
blink_num: Number of relay activation pulses (set to 1 for a single pulse).
timeoutHandler Function:
Executes the out_blink method to activate the relay according to the parameters ton, toff, and blink_num.

start Function:
A required initialization function that sets the first timeout after 1 second (1000 ms).

timeout Function:
After the timeout expires, it calls timeoutHandler and sets a new timeout for the next relay operation.

![image](https://github.com/user-attachments/assets/68b1e35c-d31b-4ba6-b17d-137318e7f4a6)

![WhatsAppVideo2025-01-03at12 27 03-ezgif com-optimize](https://github.com/user-attachments/assets/60d1bfb3-9f3a-4c07-bd30-37eddccd23c9)

2. input_output_control.lua

This code demonstrates how to control an output channel (e.g., a relay) on a Daxi controller based on the state of an input channel. It uses the in_get function to check the input state and activates the output pulse conditionally.

Code Explanation
Parameters Configuration:

in_channel: Specifies the input channel to monitor (set to 0).
out_channel: Specifies the output channel to control (set to 0).
ton: Duration for the output pulse, measured in 10-millisecond units. Here, ton = 10 means 100 milliseconds.
toff: Delay before the output pulse starts, measured in 10-millisecond units. Here, toff = 0 means no delay.
timeoutHandler Function:

Checks the state of the input channel using dev.in_get(in_channel).
If the input is active (true), it triggers a single pulse on the output channel using dev.out_single(out_channel, ton, toff).
start Function:

A mandatory initialization function that sets the first timeout to 1 second (1000 ms).
timeout Function:

Calls timeoutHandler to check the input state and control the output.
Sets the next timeout to 100 milliseconds (100 ms) for continuous input monitoring.

![image](https://github.com/user-attachments/assets/e09b1af0-6482-40c9-b9bb-fbfcbe04351e)

![WhatsAppVideo2025-01-03at12 26 41-ezgif com-optimize](https://github.com/user-attachments/assets/53c3a7ce-a4b6-4695-804e-ed948f18875e)


3. output_sequence.lua

This example demonstrates how to control channels sequentially, turning them On one by one from channel 1 to 8 and then turning them Off in reverse order (from channel 8 to 1).

Code Explanation
Output Channels:

out_channels: Defines the list of channels to control. In this example, channels 0 to 7 correspond to physical channels 1 to 8.
Sequence Logic:

Channels are turned On sequentially during the first phase.
Once all channels are On, they are turned Off sequentially in reverse order.
The sequence loops indefinitely.
Key Variables:

current_step: Tracks the current channel being updated.
is_turning_off: Boolean flag indicating whether the system is in the "turning Off" phase.
updateOutput Function:

Turns the current channel On using dev.out_default(channel, 1) during the "turning On" phase.
Turns the current channel Off using dev.out_off(channel) during the "turning Off" phase.
Timeout Functions:

start: Initializes the program with a 1-second delay.
timeout: Executes the timeoutHandler function every 500 milliseconds, which advances the sequence.

![image](https://github.com/user-attachments/assets/dd4dfeaa-70b5-4f4b-b316-e6bb3c9edefe)


![WhatsAppVideo2025-01-03at12 11 48-ezgif com-optimize (2)](https://github.com/user-attachments/assets/0b3ad6da-df27-4372-86d9-c8281bc919d0)

