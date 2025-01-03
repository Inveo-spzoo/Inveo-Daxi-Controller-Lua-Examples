![image](https://github.com/user-attachments/assets/99194d8e-dc7e-4195-a938-89aa0f0cdae8)

# Lua Function and Library Documentation - Daxi

This README provides documentation for the Daxi Lua functions and libraries.

## Core Functions

### `start()`
- **Description**: Lua function triggered by system.

### `timeout()`
- **Description**: Lua function triggered after a timeout set in `set_timeout()`.

### `void set_timeout(ms)`
- **Description**: Set and run an internal timer to call user-defined `timeout()`.  
- **Parameters**: 
  - `int ms`: Timeout given in milliseconds.

### `void clear_timeout()`
- **Description**: Clear and disable the internal timeout timer.

---

## The `dev` Library

### Output Control

#### `void out_default(channel, fun)`
- **Description**: Control the default output mode (mode gets from config).
- **Parameters**: 
  - `int channel`: Channel index starting from 0.
  - `int fun`: 
    - `0` - Off
    - `1` - On
    - `2` - Invert
- **Example**: Set channel 1 to On.

#### `void out_off(channel)`
- **Description**: Clear output.
- **Parameters**: 
  - `int channel`: Channel index starting from 0.  
  - *Action*: Sets the specified channel to Off.

#### `void out_static(channel)`
- **Description**: Set output in static mode.
- **Parameters**: 
  - `int channel`: Channel index starting from 0.

#### `void out_single(channel, ton, toff)`
- **Description**: Set output in single mode.
- **Parameters**: 
  - `int channel`: Channel index starting from 0.
  - `int ton`: Time of pulse. (1 - 0.1s)
  - `int toff`: Delay before the pulse. (1 - 0.1s)

#### `void out_blink(channel, ton, toff, cnt)`
- **Description**: Set output in blink mode.
- **Parameters**: 
  - `int channel`: Channel index starting from 0.
  - `int ton`: Time of pulse. (1 - 0.1s)
  - `int toff`: Delay before the pulse. (1 - 0.1s)
  - `int cnt`: Number of blinks.

---

### Input and Internal Variables

#### `int out_get(channel)`
- **Description**: Return output state.
- **Parameters**: 
  - `int channel`: Channel index starting from 0.

#### `int in_get(channel)`
- **Description**: Return input state.
- **Parameters**: 
  - `int channel`: Channel index starting from 0.

---

### Internal Variable Management

#### `void virt_set(idx, val)`
- **Description**: Set internal variable value.
- **Parameters**: 
  - `int idx`: Index of variable.
  - `double val`: Value of variable.

#### `double virt_get(idx)`
- **Description**: Get internal variable value.
- **Parameters**: 
  - `int idx`: Index of variable.

---

### Sensor Management

#### `sensor_get(id)`
- **Description**: Get sensor value and status.
- **Parameters**: 
  - `int id`: Sensor ID.
- **Returns**: 
  - `int status`: Sensor state as follows:
    - `0` - SENSOR STATE ERROR
    - `1` - SENSOR STATE OK
    - `2` - SENSOR STATE WARN LOW
    - `3` - SENSOR STATE WARN HIGH
    - `4` - SENSOR STATE ALERT LOW
    - `5` - SENSOR STATE ALERT HIGH
  - `double value`: Sensor value.

---

### Action and Notification

#### `void action(name)`
- **Description**: Run action with given name.
- **Parameters**: 
  - `string name`: Action name to run.

#### `void email(recipient, subject, text)`
- **Description**: Send email.
- **Parameters**: 
  - `string recipient`: Email address of recipient.
  - `string subject`: Subject of email.
  - `string text`: Content of email.

#### `http_send(url, data, data_length, method, content_type)`
- **Description**: Send HTTP request.
- **Parameters**: 
  - `string url`: Address to send, null-address is got from HTTP Client config.
  - `string data`: Data to send.
  - `int data_length`: Length of data.
  - `int method`: 
    - `0` - CLIENT METHOD GET
    - `1` - CLIENT METHOD POST
    - `2` - CLIENT METHOD PUT
    - `3` - CLIENT METHOD DELETE
  - `int content_type`: 
    - `0` - CLIENT CONTENT TYPE PLAIN
    - `1` - CLIENT CONTENT TYPE JSON
    - `2` - CLIENT CONTENT TYPE XML

#### `void mqtt(topic, data, length)`
- **Description**: Publish MQTT message.
- **Parameters**: 
  - `string topic`: MQTT topic.
  - `string data`: Data to send.
  - `int length`: Data length.

---

### Logging and Debugging

#### `void log(message)`
- **Description**: Log message to flash memory.
- **Parameters**: 
  - `string message`: Message to save.

#### `void console(message)`
- **Description**: Print to Lua console (for debugging purposes only).
- **Parameters**: 
  - `string message`: Message to be printed.
