-- Parameters for sequential control
out_channels = { 0, 1, 2, 3, 4, 5, 6, 7 } -- Output channels (1 to 8)
current_step = 1 -- Current step in the sequence
is_turning_off = false -- Flag to track whether we are turning channels off

function updateOutput()
	local channel = out_channels[current_step]

	if not is_turning_off then
		-- Turn the current channel On
		dev.out_default(channel, 1)
	else
		-- Turn the current channel Off
		dev.out_off(channel)
	end
end

function timeoutHandler()
	updateOutput() -- Perform the current step action

	if not is_turning_off then
		-- Move to the next channel in "turning on" phase
		current_step = current_step + 1
		if current_step > #out_channels then
			-- Start turning channels off
			current_step = #out_channels
			is_turning_off = true
		end
	else
		-- Move to the previous channel in "turning off" phase
		current_step = current_step - 1
		if current_step < 1 then
			-- Restart the sequence
			current_step = 1
			is_turning_off = false
		end
	end
end

-- Initial setup function
function start()
	dev.set_timeout(1000) -- Initial timeout (1 second)
end

-- Repeated timeout function
function timeout()
	timeoutHandler() -- Handle the current step of the sequence
	dev.set_timeout(500) -- Set the next timeout (500 milliseconds)
end
