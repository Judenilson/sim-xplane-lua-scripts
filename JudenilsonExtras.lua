-- Created by Judenilson Araujo - www.judenilson.com.br
-- Show wind, barometer, and FPS in screen

dataref("winHeight", "sim/graphics/view/window_height", "readonly")
dataref("winWidth", "sim/graphics/view/window_width", "readonly")
dataref("baro", "sim/weather/barometer_sealevel_inhg", "readonly")
dataref("windDir", "sim/cockpit2/gauges/indicators/wind_heading_deg_mag", "readonly")
dataref("windSpeed", "sim/cockpit2/gauges/indicators/wind_speed_kts", "readonly")
dataref("magVariation", "sim/flightmodel/position/magnetic_variation", "readonly")
dataref("seconds","sim/cockpit2/clock_timer/local_time_seconds", "readonly")
dataref("fps","sim/time/framerate_period", "readonly")

lastSecond = 0
showFps = 0
colorFps = "green"
barometer = 0
wind = 0

function calculoFPS(x)
	return (1/x)-((1/x)%1)
end

function roundTwoDecimals(x) --Rounding to two decimal places for barometer.
	local A = (x)-((x)%1)
	local B = (baro%1)*100
	local C = ((B)-((B)%1))/100
	return A+C
end

function roundExclude(x) -- Rounding excluding decimals.
	return (x)-((x)%1)
end

function windFormat(x) -- The wind degree for choosing the runway in use is rounded and displayed every 10 degrees.
	local number = (x/10)-((x/10)%1)
	local rest = (x/10)%1
	if rest >= 0.5 then -- If the wind is greater than or equal to 5 degrees, round up.
		number = number+1
	end
	number = number*10
	if (number >= 10) and (number < 100) then
		return "0"..tostring(number)
	elseif number < 10 then
		return "00"..tostring(number)
	else
		return number
	end
end

function extras()
	if seconds ~= lastSecond then
		showFps = calculoFPS(fps)
		if (showFps <= 30) and (showFps > 20)  then
			colorFps = "yellow"
		elseif (showFps <=20) then
			colorFps = "red"
		else 
			colorFps = "green"
		end

		if windDir >= magVariation then
			wind = windDir-magVariation
		else
			restMag = magVariation-windDir
			wind = 360-restMag
		end

		barometer = roundTwoDecimals(baro)
		lastSecond = seconds
	end	
	if windSpeed < 1 then
		draw_string(winWidth-200, winHeight-15, "WIND CALM | " ..barometer.. " in.Hg" , "white")
	else
		draw_string(winWidth-200, winHeight-15, windFormat(wind).. "° " ..roundExclude(windSpeed).. "kts | " ..barometer.. " in.Hg" , "white")
	end	
	draw_string(winWidth-20, winHeight-15, showFps, colorFps)	
end

do_every_draw("extras()")