# Daxi HTTP Input Monitoring Script

This Lua script is designed for Daxi devices to monitor multiple input states and send HTTP notifications when an input is activated.

---

### **Code Explanation**

#### **Parameters Configuration**
- **`n_devices`**: Total number of inputs to check (set to `8` for up to 8 input channels).
- **`index`**: The current index of the input being checked, initialized to `0`.

#### **Functions**
- **`timeoutHandler`**: 
  - Loops through the inputs to check their states.
  - Logs the current index and value of each input.
  - Sends an HTTP notification if an input is activated (state = 1).
  - Resets the index to start checking from the beginning after all inputs have been checked.

- **`start`**: 
  - A mandatory initialization function that sets the initial timeout interval to 1000 ms (1 second).

- **`timeout`**: 
  - Called when the timeout expires.
  - Invokes the `timeoutHandler` to monitor input states and sets a new timeout for subsequent rounds of checking.

---

![image](https://github.com/user-attachments/assets/0be33638-f986-44b1-8275-1911d7809a28)

![image](https://github.com/user-attachments/assets/f814cfc7-ea47-4333-b0db-24fb5a3b3a7a)

![image](https://github.com/user-attachments/assets/d14bb79b-a710-4c36-827b-23dbdfb161b8)

![image](https://github.com/user-attachments/assets/071e30d3-a1ba-40bb-af0a-6c7c35b78bdb)

## Check the effect in out app Discoverer:

![image](https://github.com/user-attachments/assets/9275b7fc-32c1-46d2-a2a0-4681e4bb9999)
