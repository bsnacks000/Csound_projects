<CsoundSynthesizer>
<CsOptions>
;--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps =128
nchnls = 2
0dbfs = 20000
seed 0


;initialize global variables here
gaGranL_send init 0
gaGranR_send init 0
gaOSC_send init 0

;initilize python + Global python variables outside of instr loop

pyinit
pyruni {{

previous_state = 'A'
current_state = 'A'
	  }}

;---ALL F TABLES-----------------------------
;--------------------------------------------

; source files for granule 1- 19
giSource1 ftgen 1, 0, 0, 1, "A2-1.wav", 0, 0, 0
giSource2 ftgen 2, 0, 0, 1, "B1-1.wav", 0, 0, 0
giSource3 ftgen 3, 0, 0, 1, "B1-2.wav", 0, 0, 0
giSource4 ftgen 4, 0, 0, 1, "B2-2.wav", 0, 0, 0
giSource5 ftgen 5, 0, 0, 1, "C1-1.wav", 0, 0, 0
giSource6 ftgen 6, 0, 0, 1, "C1-2.wav", 0, 0, 0
giSource7 ftgen 7, 0, 0, 1, "C2-1.wav", 0, 0, 0
giSource8 ftgen 8, 0, 0, 1, "C2-2.wav", 0, 0, 0
giSource9 ftgen 9, 0, 0, 1, "D1-1.wav", 0, 0, 0
giSource10 ftgen 10, 0, 0, 1, "E1-1.wav", 0, 0, 0
giSource11 ftgen 11, 0, 0, 1, "E1-2.wav", 0, 0, 0
giSource12 ftgen 12, 0, 0, 1, "F1-1.wav", 0, 0, 0
giSource13 ftgen 13, 0, 0, 1, "G1-1.wav", 0, 0, 0
giSource14 ftgen 14, 0, 0, 1, "G2-1.wav", 0, 0, 0
giSource15 ftgen 15, 0, 0, 1, "G2-2.wav", 0, 0, 0
giSource16 ftgen 16, 0, 0, 1, "H1-2.wav", 0, 0, 0
giSource17 ftgen 17, 0, 0, 1, "I1-2.wav", 0, 0, 0
giSource18 ftgen 18, 0, 0, 1, "J1-2.wav", 0, 0, 0
giSource19 ftgen 19, 0, 0, 1, "M1-2.wav", 0, 0, 0

; LOUD loscil waveforms 20 - 51
giSource20 ftgen 20, 0, 0, 1, "Loud_choppy_distort_2sec.wav", 0, 0, 0
giSource21 ftgen 21, 0, 0, 1, "Loud_choppy_distort_msec.wav", 0, 0, 0
giSource22 ftgen 22, 0, 0, 1, "Loud_choppy_hits_19sec.wav", 0, 0, 0
giSource23 ftgen 23, 0, 0, 1, "Loud_distort_hit_10sec.wav", 0, 0, 0
giSource24 ftgen 24, 0, 0, 1, "Loud_distort_multihits_1sec.wav", 0, 0, 0
giSource25 ftgen 25, 0, 0, 1, "Loud_distort_shred_4sec.wav", 0, 0, 0
giSource26 ftgen 26, 0, 0, 1, "Loud_distort_shred_8sec.wav", 0, 0, 0
giSource27 ftgen 27, 0, 0, 1, "Loud_high_distort_hits_9sec.wav", 0, 0, 0
giSource28 ftgen 28, 0, 0, 1, "Loud_high_melodic_hit_9sec.wav", 0, 0, 0
giSource29 ftgen 29, 0, 0, 1, "Loud_high_melodic_hit_10sec.wav", 0, 0, 0
giSource30 ftgen 30, 0, 0, 1, "Loud_high_melodic_hit_12sec.wav", 0, 0, 0
giSource31 ftgen 31, 0, 0, 1, "Loud_hitriff_fuzzdrone_34sec.wav", 0, 0, 0
giSource32 ftgen 32, 0, 0, 1, "Loud_laser_drone_1sec.wav", 0, 0, 0
giSource33 ftgen 33, 0, 0, 1, "Loud_laser_drone_16sec.wav", 0, 0, 0
giSource34 ftgen 34, 0, 0, 1, "Loud_laser_drone_pitchshift_11sec.wav", 0, 0, 0
giSource35 ftgen 35, 0, 0, 1, "Loud_laser_drone_pitchshift_18sec.wav", 0, 0, 0
giSource36 ftgen 36, 0, 0, 1, "Loud_scratchy_noise_2sec.wav", 0, 0, 0
giSource37 ftgen 37, 0, 0, 1, "Loud_scratchy_noise_5sec.wav", 0, 0, 0
giSource38 ftgen 38, 0, 0, 1, "Loud_scratchy_noise_12sec.wav", 0, 0, 0
giSource39 ftgen 39, 0, 0, 1, "Loud_spazzshift_drone_5sec.wav", 0, 0, 0
giSource40 ftgen 40, 0, 0, 1, "Loud_spazzshift_drone_6sec.wav", 0, 0, 0
giSource41 ftgen 41, 0, 0, 1, "Loud_spazzshift_drone_7sec.wav", 0, 0, 0
giSource42 ftgen 42, 0, 0, 1, "Loud_spazzshift_drone_10sec.wav", 0, 0, 0
giSource43 ftgen 43, 0, 0, 1, "Loud_spazzshift_drone_13sec.wav", 0, 0, 0
giSource44 ftgen 44, 0, 0, 1, "Loud_spazzshift_drone_15sec.wav", 0, 0, 0
giSource45 ftgen 45, 0, 0, 1, "Loud_spazzshift_drone_16sec.wav", 0, 0, 0
giSource46 ftgen 46, 0, 0, 1, "Loud_spazzshift_drone_17sec.wav", 0, 0, 0
giSource47 ftgen 47, 0, 0, 1, "Loud_spazzshift_drone_36sec.wav", 0, 0, 0
giSource48 ftgen 48, 0, 0, 1, "Loud_tremolo_hits_16sec.wav", 0, 0, 0
giSource49 ftgen 49, 0, 0, 1, "Loud_tremolo_pitchshift_4sec.wav", 0, 0, 0
giSource50 ftgen 50, 0, 0, 1, "Loud_tremolo_pitchshift_6sec.wav", 0, 0, 0
giSource51 ftgen 51, 0, 0, 1, "Loud_tremolo_pitchshift_8sec.wav", 0, 0, 0

; MEDIUM loscil waveforms 52- 70


giSource52 ftgen 52, 0, 0, 1, "Medium_distort_hit_13sec.wav", 0, 0, 0
giSource53 ftgen 53, 0, 0, 1, "Medium_engine_drone_2sec.wav", 0, 0, 0
giSource54 ftgen 54, 0, 0, 1, "Medium_engine_drone_19sec.wav", 0, 0, 0
giSource55 ftgen 55, 0, 0, 1, "Medium_engine_drone_stringrumble_11sec.wav", 0, 0, 0
giSource56 ftgen 56, 0, 0, 1, "Medium_jetengine_distort_hit_15sec.wav", 0, 0, 0
giSource57 ftgen 57, 0, 0, 1, "Medium_jetengine_distort_hit_17sec.wav", 0, 0, 0
giSource58 ftgen 58, 0, 0, 1, "Medium_laser_drone_pitchsweep_14sec.wav", 0, 0, 0
giSource59 ftgen 59, 0, 0, 1, "Medium_laser_drone_pitchsweep_15sec.wav", 0, 0, 0
giSource60 ftgen 60, 0, 0, 1, "Medium_laser_drone_pitchsweep_16sec.wav", 0, 0, 0
giSource61 ftgen 61, 0, 0, 1, "Medium_spazzmod_rumble_drone_5sec.wav", 0, 0, 0
giSource62 ftgen 62, 0, 0, 1, "Medium_spazzmod_rumble_drone_9sec.wav", 0, 0, 0
giSource63 ftgen 63, 0, 0, 1, "Medium_spazzmod_rumble_drone_13sec.wav", 0, 0, 0
giSource64 ftgen 64, 0, 0, 1, "Medium_spazzmod_rumble_drone_17sec.wav", 0, 0, 0
giSource65 ftgen 65, 0, 0, 1, "Medium_tremolo_drone_1sec.wav", 0, 0, 0
giSource66 ftgen 66, 0, 0, 1, "Medium_tremolo_drone_4sec.wav", 0, 0, 0
giSource67 ftgen 67, 0, 0, 1, "Medium_tremolo_drone_5sec.wav", 0, 0, 0
giSource68 ftgen 68, 0, 0, 1, "Medium_tremolo_drone_18sec.wav", 0, 0, 0
giSource69 ftgen 69, 0, 0, 1, "Medium_tremolo_drone_600msec.wav", 0, 0, 0
giSource70 ftgen 70, 0, 0, 1, "Medium_tremolo_drone_750msec.wav", 0, 0, 0

; QUIET waveforms for loscil 71 - 79
giSource71 ftgen 71, 0, 0, 1, "Quiet_air_3sec.wav", 0, 0, 0
giSource72 ftgen 72, 0, 0, 1, "Quiet_air_6sec.wav", 0, 0, 0
giSource73 ftgen 73, 0, 0, 1, "Quiet_air_9sec.wav", 0, 0, 0
giSource74 ftgen 74, 0, 0, 1, "Quiet_air_pulses_32sec.wav", 0, 0, 0
giSource75 ftgen 75, 0, 0, 1, "Quiet_air_rumble_6sec.wav", 0, 0, 0
giSource76 ftgen 76, 0, 0, 1, "Quiet_air_rumble_7sec.wav", 0, 0, 0
giSource77 ftgen 77, 0, 0, 1, "Quiet_air_stringrumble_22sec.wav", 0, 0, 0
giSource78 ftgen 78, 0, 0, 1, "Quiet_spazzmod_drone_6sec.wav", 0, 0, 0
giSource79 ftgen 79, 0, 0, 1, "Quiet_spazzmod_drone_14.wav", 0, 0, 0

;extra ftables for granule

giSource80 ftgen 80, 0, 0, 1, "D1-2.wav", 0, 0, 0
giSource81 ftgen 81, 0, 0, 1, "D2-1.wav", 0, 0, 0


; grain envelope functions
	
giWin_Hanning     	ftgen 82,0,8192, 20,2 
giWin_Bartlett    	ftgen 83,0,8192, 20,3
giWin_Blackman4     ftgen 84,0,8192, 20,5 
giWin_Gauss      	ftgen 85,0,8192, 20,6
giWin_EXP1      	ftgen 86,0,128, 5,   1, 128, .00001
giWin_EXP2      	ftgen 87,0,128, 5,   .00001, 128, 1
giWin_EXP3      	ftgen 88,0,128, 5,   1, 28, .00001, 100, .00001
giWin_EXP4      	ftgen 89,0,128, 5,   .00001, 100, .00001, 28, 1

;-----------------------------------------------------------
;-----------------------------------------------------------


instr 1 ; looping python instrument using weighted random distribution between three states

loop:
pyruni {{

import random

weight_dict = {'AA':[0,.5,.5], 'AB':[.5,.3,.2], 'AC':[0,1,0],
                'BA':[.4,0,6], 'BB':[0,.5,.5], 'BC':[1,0,0],
                'CA':[.3,.4,.3], 'CB':[0,0,1], 'CC':[.8,.2,0]
                }
loscil_dict = {'loud_3':[20,21,24, 32, 36],
    'loud_12':[23,25,26,27,28,29,30,34,37,38,39,40,41,42,49,50,51],
    'loud_20':[22,33,25,43,44,45,46,48],
    'loud_>20':[31,47],
    'medium_3':[53,65,69,70],
    'medium_12':[55,61,62,66,67],
    'medium_20':[52,54,56,57,58,59,60,63,68,64],
    'quiet_3':[71],
    'quiet_12':[72,73,75,76,77],
    'quiet_20':[79],
    'quiet_>20':[74,77]
    }

grain_dict = {'loud_high': [7, 9, 11, 80],
    'loud_highmid': [12, 81],
    'loud_lowmid': [6],
    'loud_low':[2, 19],
    'medium_high':[10, 14, 15],
    'medium_lowmid':[8,13],
    'medium_low': [1,4],
    'quiet_highmid': [17],
    'quiet_lowmid': [5, 16, 18],
    'quiet_low': [3]
    }

def waveform_selector(state):
    state = str(state)

    state_A_loscil = loscil_dict['loud_12']
    state_A_granule = grain_dict['loud_high']
    state_B_loscil = loscil_dict['quiet_3']
    state_B_granule = grain_dict['quiet_lowmid']
    state_C_loscil = loscil_dict['medium_20']
    state_C_granule = grain_dict['loud_high']

    if state == 'A':
        loscil_output = random.choice(state_A_loscil)
        granule_output = random.choice(state_A_granule)
    elif state == 'B':
        loscil_output = random.choice(state_B_loscil)
        granule_output = random.choice(state_B_granule)
    else:
        loscil_output = random.choice(state_C_loscil)
        granule_output = random.choice(state_C_granule)

    return loscil_output, granule_output



def csound_convert(x):
    if current_state == 'A':
        return 0.0
    elif current_state == 'B':
        return 1.0
    else:
        return 2.0

def weighted_choice (weights):
        totals = []
        running_total = 0

        for w in weights:
            running_total += w
            totals.append(running_total)

        rnd = random.random() * running_total
        for i, total in enumerate(totals):
            if rnd < total:
                return i
                
                
lookup = str(previous_state) + str(current_state)                
csound_state = csound_convert(current_state)
eval_state = weighted_choice (weight_dict[lookup])

if eval_state == 0:
    eval_state = 'A'
elif eval_state == 1:
    eval_state = 'B'
else:
    eval_state = 'C'

waveforms = waveform_selector(current_state)
loscil_output, granule_output = waveforms # unpacks tuple & convert to floats
loscil_output = float(loscil_output)
granule_output = float(granule_output)

previous_state = current_state # resets global python variables for next reinit
current_state = eval_state
				
}}


	istate pyevali "csound_state"             ; this loop controls initialization of instrument and supplies state variables
	iloscil_ifn pyevali "loscil_output"
	igranule_ifn pyevali "granule_output"
	
	
	istrt = 0
	
	if istate == 1 then		      ;duration of loscil/granule pair reinitialization determined by state
		idur random 1, 5 
	elseif istate == 2 then
		idur random 5, 20 
	else
		idur random 3, 8 
	endif
	
	timout istrt, idur, loop_event
	reinit loop
		loop_event:
			if istate == 1 then
				ichaos_rand = 1   ;state specific parameter list
				imin_grain_dur = .1 
				imax_grain_dur = 3
				imin_gsize = .001
				imax_gsize = 1
				igdeviation = 1
				iloscil_pitch random .7, 8
				iloscil_ampdev = 200
				iloscil_attack_strength = 1
				iloscil_decay_strength = 1
				ivoice_rand_max = 10
				
				event_i "i", 2, 0, idur,    iloscil_ifn, igranule_ifn, int(ichaos_rand), imin_grain_dur, imax_grain_dur, imin_gsize,  imax_gsize, 			                      							igdeviation, iloscil_pitch, iloscil_ampdev, iloscil_attack_strength, iloscil_decay_strength, ivoice_rand_max		
			elseif istate == 2 then		
			     ichaos_rand = 1
			     imin_grain_dur = .3
				imax_grain_dur = 5
				imin_gsize = .01
				imax_gsize = 1
				igdeviation = 5
				iloscil_pitch random .8, 1
				iloscil_ampdev = 600
				iloscil_attack_strength = .1
				iloscil_decay_strength = .1
				ivoice_rand_max = 10	
				
				event_i "i", 2, 0, idur,    iloscil_ifn, igranule_ifn, int(ichaos_rand), imin_grain_dur, imax_grain_dur, imin_gsize, imax_gsize, 			                      							igdeviation, iloscil_pitch, iloscil_ampdev, iloscil_attack_strength, iloscil_decay_strength, ivoice_rand_max 	
			else
				ichaos_rand = 1
				imin_grain_dur = .8
				imax_grain_dur = 10
				imin_gsize = .005
				imax_gsize = 1
				igdeviation = 10
				iloscil_pitch random 1, 1.2
				iloscil_ampdev = 1000
				iloscil_attack_strength = .01
				iloscil_decay_strength = .01
				ivoice_rand_max = 10
				
				event_i "i", 2, 0, idur,    iloscil_ifn, igranule_ifn, int(ichaos_rand), imin_grain_dur, imax_grain_dur, imin_gsize, imax_gsize, 			                      							igdeviation, iloscil_pitch, iloscil_ampdev, iloscil_attack_strength, iloscil_decay_strength, ivoice_rand_max		
			endif
endin



instr 2 ; Csound looping instrument - includes event scheduling for loscil and granule

;loscil & granule parameters set on each call to instr 2 for duration idur specified by state in instr 1
;NOTE: experiment with imin/ imax_graindur as a possible state variable

ievent_dur = p3
iloscil_ifn = p4
ifn_granule = p5
isetting = p6
imin_graindur_event = p7
imax_graindur_event = p8
imin_gsize = p9
imax_gsize = p10
igdeviation = p11
iloscil_pitch = p12
iloscil_ampdev = p13
iloscil_attack_strength = p14
iloscil_decay_strength = p15
ivoice_rand_max = p16

;loscil envelope data

iattack_loscil random .01, (ievent_dur * iloscil_attack_strength)
idecay_loscil random .01, (ievent_dur - iattack_loscil) * iloscil_decay_strength

event_i "i", 10, 0, ievent_dur, iattack_loscil, idecay_loscil, iloscil_ifn, iloscil_pitch, iloscil_ampdev  
print ievent_dur

; other granule constants

imode = 0
ithd = 0
iatt = 100
idec = 0
iseed = .5
igskip = 0

loop:                           ; granule event loop, repeats
istrt = 0
igrain_dur random imin_graindur_event, imax_graindur_event                              
             
	timout istrt, igrain_dur, note_event 	
	reinit loop
	
	note_event:                    
	
	iratio random .5, 1.5
	
	
	ivoice_rand random 1, ivoice_rand_max
	ivoice = int(ivoice_rand)
	
		if ivoice == 1 then
			ipshift = 1
		elseif ivoice == 2 then
			ipshift = 2
		elseif ivoice == 3 then
			ipshift = 3
		else
		     ipshift_rand random 1,5
			ipshift = int(ipshift_rand)
		endif
	
	ilength = (nsamp(ifn_granule)/sr)
	
	ifnenv_rand random 82, 90
	ifnenv = int(ifnenv_rand)
	
	igskip_os random 0, 0.005
	
		if (isetting < 50) then
			irange = isetting * .5
		else
			irange = (100 - isetting) * .5
		endif

		igauss gauss irange
		ichaos_setting = igauss + isetting
	
	
	igap_os = ichaos_setting
	igsize_os = ichaos_setting
	
	print ipshift
		
	ipitch1 random 0,1
	ipitch2 random .5,1.5
	ipitch3 random .8, 1.7
	ipitch4 random 1,2
	
	
	ieventdur_rand random 1, igrain_dur			; creates overlap	       	
	ieventdur = igrain_dur + ieventdur_rand
	print ieventdur, ilength
	
	iattack_granule random .01, igrain_dur  ; creates event AD envelope
	idecay_granule random .01, (igrain_dur - iattack_granule)
	
	event_i "i", 11, 0, ieventdur, 	ivoice, iratio, imode, ithd, ifn_granule, ipshift, igskip,  igskip_os, ilength, igap_os, igsize_os, iatt, idec , ipitch1 , ipitch2 , ipitch3 , ipitch4 , ifnenv,  iattack_granule, idecay_granule, imin_gsize, imax_gsize, igdeviation 

endin


instr 10  ; global loscil

iloscil_ampdev = p8

kjitter jitter iloscil_ampdev, 3, 10
  
kamp_osc = 5000 + kjitter
ioscil_pitch = p7 

iattack = p4 
idecay = p5  
ifn = p6

aOSC loscil kamp_osc, ioscil_pitch, ifn , 1, 1
	aEnv adsr iattack, 0, 1, idecay  

outs aOSC * aEnv, aOSC * aEnv
;gaOSC_send = aOSC * aEnv

endin


instr 11 ; global granule


kjitter jitter 500, 1, 15

kamp = 5000 + kjitter

kdeviation randomi 0, 15, p26

kgap randomi p24, p25, kdeviation 
kgsize randomi p24, p25, kdeviation

iattack = p22 
idecay = p23 

aGranL granule kamp, p4, p5, p6, p7, p8, p9, p10,  p11, p12, kgap, p13, kgsize, p14, p15, p16  , 2.5344554654, p17, p18, p19, p20, p21
aGranR granule kamp, p4, p5, p6, p7, p8, p9, p10,  p11, p12, kgap, p13, kgsize, p14, p15, p16  , 19.9378236 , p17, p18, p19, p20, p21

	aEnv adsr iattack, 0, 1, idecay


;gaGranL_send = aGranL * aEnv
;gaGranR_send = aGranR * aEnv	 

outs aGranL * aEnv, aGranR * aEnv

endin



</CsInstruments>
<CsScore>

f 0 1
s
i1 0 240

f 0 10

</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1301</x>
 <y>72</y>
 <width>266</width>
 <height>717</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
<MacOptions>
Version: 3
Render: Real
Ask: Yes
Functions: ioObject
Listing: Window
WindowBounds: 1301 72 266 717
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
</MacGUI>
