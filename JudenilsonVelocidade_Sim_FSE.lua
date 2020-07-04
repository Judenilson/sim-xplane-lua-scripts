-- Created by Judenilson Araujo --

dataref("xp_velsim","sim/time/ground_speed","writable")

function velo_sim()
    if xp_velsim == 1 then
        set("sim/time/ground_speed",4)
    else
        set("sim/time/ground_speed",1)
    end
end

create_command(
    "FlyWithLua/Velocidade_Sim", 
    "Alterna a velocidade do solo 1x/4x", 
    "velo_sim()", 
    "", 
    ""
)
