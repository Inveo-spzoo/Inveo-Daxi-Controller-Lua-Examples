channel = 0 -- output channel
ton = 10 -- Time of pulse (100 milliseconds)
toff = 0 -- delay before the pulse
blink_num = 1 -- number of blinks

function timeoutHandler()
	--blink function call
	dev.out_blink(channel, ton, toff, blink_num)
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
