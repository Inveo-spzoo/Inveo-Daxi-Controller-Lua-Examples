in_channel = 0 -- Input channel
out_channel = 0 -- Output channel
ton = 10 -- Time of pulse (100 milliseconds)
toff = 0 -- Delay before the pulse

function timeoutHandler()
	-- Check input state and activate output pulse if input is active
	if dev.in_get(in_channel) == 1 then
		dev.out_single(out_channel, ton, toff)
	end
end

-- Initial function - required for setup
function start()
	dev.set_timeout(1000) -- Initial timeout (1 second)
end

-- Function to handle repeated checks and output control
function timeout()
	timeoutHandler() -- Check input and handle output
	dev.set_timeout(10) -- Set the next timeout (100 milliseconds)
end
