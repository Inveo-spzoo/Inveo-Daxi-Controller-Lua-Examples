# 1. **`blink.lua` Example: Basic Blink with Built-In Relay**

This example demonstrates how to control the built-in relay on a Daxi controller by performing a simple blink operation. The code uses the `out_blink` function to toggle the relay with customizable timing.

### **Code Explanation**

#### **Parameters Configuration**
- `channel`: Specifies the I/O channel (set to `0` for the built-in relay).
- `ton`: Duration (in milliseconds) for the relay to stay on.  
  - Example: `ton = 10` means 100 milliseconds (10 × 10ms).
- `toff`: Delay (in milliseconds) before the relay pulse starts.  
  - Example: `toff = 1` means 0.1 seconds (1 × 10ms).
- `blink_num`: Number of relay activation pulses.  
  - Example: `blink_num = 1` for a single pulse.

#### **Functions**
- **`timeoutHandler`**: Executes the `out_blink` method to activate the relay according to the parameters `ton`, `toff`, and `blink_num`.
- **`start`**: A required initialization function that sets the first timeout after 1 second (1000 ms).
- **`timeout`**: After the timeout expires, it calls `timeoutHandler` and sets a new timeout for the next relay operation.

---

![image](https://github.com/user-attachments/assets/68b1e35c-d31b-4ba6-b17d-137318e7f4a6)

![WhatsAppVideo2025-01-03at12 27 03-ezgif com-optimize](https://github.com/user-attachments/assets/60d1bfb3-9f3a-4c07-bd30-37eddccd23c9)


## 2. **`input_output_control.lua` Example: Conditional Input-Output Control**

This example demonstrates how to control an output channel (e.g., a relay) based on the state of an input channel. It uses the `in_get` function to check the input state and activates the output pulse conditionally.

### **Code Explanation**

#### **Parameters Configuration**
- `in_channel`: Specifies the input channel to monitor (set to `0`).
- `out_channel`: Specifies the output channel to control (set to `0`).
- `ton`: Duration for the output pulse, measured in 10-millisecond units.  
  - Example: `ton = 10` means 100 milliseconds.
- `toff`: Delay before the output pulse starts, measured in 10-millisecond units.  
  - Example: `toff = 0` means no delay.

#### **Functions**
- **`timeoutHandler`**:  
  - Checks the state of the input channel using `dev.in_get(in_channel)`.  
  - If the input is active (`true`), triggers a single pulse on the output channel using `dev.out_single(out_channel, ton, toff)`.
- **`start`**: A mandatory initialization function that sets the first timeout to 1 second (1000 ms).
- **`timeout`**:  
  - Calls `timeoutHandler` to check the input state and control the output.  
  - Sets the next timeout to 100 milliseconds (100 ms) for continuous input monitoring.

---

![image](https://github.com/user-attachments/assets/e09b1af0-6482-40c9-b9bb-fbfcbe04351e)


![WhatsAppVideo2025-01-03at12 54 52-ezgif com-optimize](https://github.com/user-attachments/assets/bc87e437-5ada-4b10-98cc-bdfc87eea493)

## 3. **`output_sequence.lua` Example: Sequential Channel Activation**

This example demonstrates how to control channels sequentially, turning them **On** one by one from channel 1 to 8 and then turning them **Off** in reverse order (from channel 8 to 1).

### **Code Explanation**

#### **Output Channels**
- `out_channels`: Defines the list of channels to control.  
  - Example: Channels `0` to `7` correspond to physical channels 1 to 8.

#### **Sequence Logic**
- Channels are turned **On** sequentially during the first phase.  
- Once all channels are **On**, they are turned **Off** sequentially in reverse order.  
- The sequence loops indefinitely.

#### **Key Variables**
- `current_step`: Tracks the current channel being updated.
- `is_turning_off`: Boolean flag indicating whether the system is in the "turning Off" phase.

#### **Functions**
- **`updateOutput`**:  
  - Turns the current channel **On** using `dev.out_default(channel, 1)` during the "turning On" phase.  
  - Turns the current channel **Off** using `dev.out_off(channel)` during the "turning Off" phase.
- **`start`**: Initializes the program with a 1-second delay.
- **`timeout`**: Executes the `timeoutHandler` function every 500 milliseconds, advancing the sequence.

---

### Example Sequence Flow

With a timeout of 500 milliseconds:  
1. **Phase 1 (Turning On)**  
   - **Time 0.5s**: Channel 1 is turned **On**.  
   - **Time 1.0s**: Channel 2 is turned **On**.  
   - **...**  
   - **Time 4.0s**: Channel 8 is turned **On**.  

2. **Phase 2 (Turning Off)**  
   - **Time 4.5s**: Channel 8 is turned **Off**.  
   - **Time 5.0s**: Channel 7 is turned **Off**.  
   - **...**  
   - **Time 8.0s**: Channel 1 is turned **Off**.  

The sequence then restarts.  

---

### Use Cases
These examples are ideal for:
- Testing and demonstrating the Daxi controller’s capabilities.
- Real-world applications like relay control, sequential lighting, or event-based output control.

![image](https://github.com/user-attachments/assets/dd4dfeaa-70b5-4f4b-b316-e6bb3c9edefe)


![WhatsAppVideo2025-01-03at12 11 48-ezgif com-optimize (2)](https://github.com/user-attachments/assets/0b3ad6da-df27-4372-86d9-c8281bc919d0)

