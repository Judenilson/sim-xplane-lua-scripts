-- Created by Judenilson Araujo - www.judenilson.com.br
-- Change the Carenado SR22 fuel tank automatic

dataref("selectedTank", "sim/cockpit/engine/fuel_tank_selector", "writable")
dataref("minutes","sim/cockpit2/clock_timer/local_time_minutes", "readonly")

lastMinutes = 0
start = false

function changeFuelTank()
	if start == true then
		if minutes ~= lastMinutes then
			if (minutes%5 == 0) then
				if (selectedTank == 3) then
					command_once("Carenado/FuelSelected/FuelSelDn")
				elseif (selectedTank == 1) then
					command_once("Carenado/FuelSelected/FuelSelUp")
				end							
			end
			lastMinutes = minutes
		end	
		draw_string(winWidth-40, 5, "AutoT", "yellow")
	end
end

function startingOFF()
	start = false
end
function startingON()
	start = true
end

do_every_draw("changeFuelTank()")

add_macro("Auto Change Fuel Tank", "startingON()", "startingOFF()", "deactivate")