n_devices = 8 -- set number of inputs to check
index = 0 -- actual index of readed input

function timeoutHandler()
	-- checking state of inputs
	counter = 0
	repeat
		counter = counter + 1
		currentDaxiInputState = dev.in_get(index)
		dev.console("currentIndex " .. index .. " value " .. currentDaxiInputState)

		-- if state of each input is 0 go to next one
		if currentDaxiInputState == 0 then
			index = index + 1
		end

		-- reset index when it's greater than numebr of checking inputs
		if index >= n_devices then
			index = 0
		end

		-- reset counter if it's greather than numebr of inputs to check
		if counter >= n_devices then
			return
		end
	until currentDaxiInputState == 1 -- go out from the loop if there is an input with active state

	-- send data depending to current active input
	to_send = "Activated_input:" .. index 
	len = string.len(to_send)
	dev.http("http://192.168.21.185:876/index", to_send, len, 0, 0)

	-- go to the next input
	index = index + 1
	if index >= n_devices then
		index = 0
	end
end

-- initial function - must be
function start()
	dev.set_timeout(1000) -- initial timeout
end

-- in this function we set timeout of calling timeoutHandler function
function timeout()
	timeoutHandler()
	dev.set_timeout(2000) -- next timeout
end