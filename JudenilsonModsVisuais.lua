set("sim/private/controls/fbo/shadow_cam_size", 4096)
set("sim/private/controls/shadow/csm_split_exterior", 2.0)
set("sim/private/controls/shadow/csm_split_interior", 4.0)
set("sim/private/controls/shadow/cockpit_near_adjust", 2)
set("sim/private/controls/shadow/cockpit_near_proxy", 1.5)
set("sim/private/controls/skyc/max_shadow_angle", 1)
set("sim/private/controls/skyc/min_shadow_angle", -89)
set("sim/private/controls/shadow/last_3d_pass", 1.0)
set("sim/private/controls/clouds/cloud_shadow_lighten_ratio", 1.045)
set("sim/private/controls/clouds/shadow_size", 1024)
set("sim/private/controls/clouds/ambient_gain", 0.9)
set("sim/private/controls/clouds/diffuse_gain", 0.9)
set("sim/private/controls/atmo/inscatter_gain_mie", 1.0)
set("sim/private/controls/atmo/inscatter_gain_raleigh", 0.2) --0.5
set("sim/private/controls/atmo/atmo_scale_raleigh", 25.0) --15.0 
set("sim/private/controls/atmo/scatter_raleigh_b", 55.0)
set("sim/private/controls/atmo/scatter_raleigh_g", 15.0)
set("sim/private/controls/atmo/scatter_raleigh_r", 5.0)
set("sim/private/controls/hdr/sky_gain", 2.5) --1.7
set("sim/private/controls/caps/use_multilayer_fog", 1.0)
set("sim/private/controls/caps/use_reflective_water", 1.0)
set("sim/private/controls/clouds/first_res_3d", 5.0)
set("sim/private/controls/fog/fog_be_gone", 0.5) --0.4

local start_time = os.clock()
local do_once = false

function water_fix()
    if os.clock() > start_time+5 and do_once == false then
			set("sim/private/controls/water/fft_amp1", 1)
			set("sim/private/controls/water/fft_amp2", 0.8)
			set("sim/private/controls/water/fft_amp3", 2)
			set("sim/private/controls/water/fft_amp4", 20)
			set("sim/private/controls/water/fft_scale1", 100)
			set("sim/private/controls/water/fft_scale2", 42)
			set("sim/private/controls/water/fft_scale3", 10)
			set("sim/private/controls/water/fft_scale4", 5)
			set("sim/private/controls/water/noise_speed", 18)
			set("sim/private/controls/water/noise_bias_gen_x", 2)
			set("sim/private/controls/water/noise_bias_gen_y", 1)
        do_once=true
    end
end
do_often("water_fix()")