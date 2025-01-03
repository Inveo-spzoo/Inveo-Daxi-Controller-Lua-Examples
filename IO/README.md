
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
