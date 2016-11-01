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



;initilize python + Global python variables outside of instr loop

pyinit
pyruni {{

previous_state = 'I'
current_state = 'I'
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
giWin_Gauss      	ftgen 85,0,8192, 20,6, 1
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

low_1 = [.3,.2,.1,.1,.1,.1,.034,.033,.033]
low_2 = [.2,.2,.2,.1,.1,.1,.034,.033,.033]
low_3 = [.1,.2,.3,.2,.05,.05,.034,.033,.033]

mid_1 = [.05,.1,.15,.2,.1,.1,.15,.1,.05]
mid_2 = [.05,.1,.15,.1,.2,.1,.15,.1,.05]
mid_3 = [.05,.1,.15,.1,.1,.2,.15,.1,.05]

high_1 = [.033,.033,.034,.1,.1,.1,.1,.2,.3]
high_2 = [.033,.033,.034,.1,.1,.1,.2,.2,.2]
high_3 = [.033,.033,.034,.05,.05,.2,.3,.2,.1]


weight_dict = {
	'AA': low_1,
	'AB': low_1,
	'AC': low_1,
	'AD': low_2,
	'AE': low_3,
	'AF': low_3,
	'AG': mid_1,
	'AH': mid_1,
	'AI': mid_1,

	'BA': low_1,
	'BB': low_2,
	'BC': low_2,
	'BD': low_3,
	'BE': low_3,
	'BF': low_3,
	'BG': mid_1,
	'BH': mid_1,
	'BI': mid_1,

	'CA': low_3,
	'CB': low_3,
	'CC': low_3,
	'CD': low_3,
	'CE': mid_1,
	'CF': mid_1,
	'CG': mid_2,
	'CH': mid_2,
	'CI': mid_2,

	'DA': low_3,
	'DB': low_3,
	'DC': mid_1,
	'DD': mid_2,
	'DE': mid_2,
	'DF': mid_2,
	'DG': mid_3,
	'DH': mid_3,
	'DI': mid_3,

	'EA': mid_1,
	'EB': mid_1,
	'EC': mid_1,
	'ED': mid_2,
	'EE': mid_2,
	'EF': mid_2,
	'EG': mid_3,
	'EH': mid_3,
	'EI': mid_3,

	'FA': mid_1,
	'FB': mid_2,
	'FC': mid_2,
	'FD': mid_3,
	'FE': mid_3,
	'FF': mid_3,
	'FG': mid_3,
	'FH': high_1,
	'FI': high_1,

	'GA': mid_2,
	'GB': mid_3,
	'GC': mid_3,
	'GD': high_1,
	'GE': high_1,
	'GF': high_1,
	'GG': high_1,
	'GH': high_2,
	'GI': high_2,

	'HA': mid_3,
	'HB': mid_3,
	'HC': high_1,
	'HD': high_1,
	'HE': high_2,
	'HF': high_2,
	'HG': high_2,
	'HH': high_3,
	'HI': high_3,

	'IA': mid_3,
	'IB': mid_3,
	'IC': high_1,
	'ID': high_1,
	'IE': high_2,
	'IF': high_2,
	'IG': high_3,
	'IH': high_3,
	'II': high_3,

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

grain_dict = {'loud_high': [7, 9, 80, 11],
    'loud_highmid': [81,12],
    'loud_lowmid': [6],
    'loud_low':[2, 19],
    'medium_high':[10, 14, 15],
    'medium_lowmid':[8,13],
    'medium_low': [1,4],
    'quiet_highmid': [17],
    'quiet_lowmid': [5, 16, 18],
    'quiet_low': [3]
    }

#converts current state into float so Csound can read it
def csound_convert(x):
    if current_state == 'A':
        return 0.0
    elif current_state == 'B':
        return 1.0
    elif current_state == 'C':
        return 2.0
    elif current_state == 'D':
        return 3.0
    elif current_state == 'E':
        return 4.0
    elif current_state == 'F':
        return 5.0
    elif current_state == 'G':
        return 6.0
    elif current_state == 'H':
        return 7.0
    else:
        return 8.0

# weighted distribution
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

#selects loscil and grain waveforms randomly from appropriate dict keys
# returns tuple
#example given:
#State A: loscil = loud_12, granule = loud_high, highmid, lowmid, low
#State B: loscil = quiet + medium 12, granule = quiet_lowmid
#State C: loscil = medium_20, granule = loud_high + medium_lowmid

def waveform_selector(state):
    state = str(state)

    state_A_loscil = loscil_dict['quiet_>20']
    state_A_granule = (grain_dict['quiet_low'] + grain_dict['quiet_lowmid']
                    + grain_dict['quiet_highmid'])
    state_B_loscil = (loscil_dict['quiet_>20'] + loscil_dict['quiet_20']
                    + loscil_dict['quiet_12'] + loscil_dict['quiet_3'])
    state_B_granule = (grain_dict['quiet_low'] + grain_dict['quiet_lowmid']
                    + grain_dict['quiet_highmid'])
    state_C_loscil = (loscil_dict['quiet_20']+ loscil_dict['quiet_12']
                    + loscil_dict['medium_20'])
    state_C_granule = (grain_dict['quiet_low']+grain_dict['quiet_lowmid']
                    + grain_dict['medium_low'])
    state_D_loscil = (loscil_dict['quiet_12'] + loscil_dict['medium_3']
                    + loscil_dict['medium_12'])
    state_D_granule = (grain_dict['medium_low']+grain_dict['medium_lowmid'])
    state_E_loscil = (loscil_dict['medium_12']+loscil_dict['medium_20'])
    state_E_granule = (grain_dict['medium_lowmid']+grain_dict['medium_high']
                    +grain_dict['medium_low'])
    state_F_loscil = loscil_dict['medium_20']
    state_F_granule = (grain_dict['medium_lowmid'] + grain_dict['loud_low']
                    + grain_dict['medium_high'])
    state_G_loscil = (loscil_dict['medium_20']+loscil_dict['loud_>20']
                    +loscil_dict['loud_20'])
    state_G_granule = (grain_dict['loud_lowmid']+ grain_dict['loud_low']
                    + grain_dict['medium_high'])
    state_H_loscil = (loscil_dict['loud_20']+loscil_dict['loud_12']
                    +loscil_dict['medium_12'])
    state_H_granule =(grain_dict['loud_high'] + grain_dict['loud_highmid'])
    state_I_loscil = (loscil_dict['loud_3']+loscil_dict['loud_12']
                    +loscil_dict['medium_3']+loscil_dict['medium_12']
                    +loscil_dict['quiet_3']+loscil_dict['quiet_12'])
    state_I_granule = (grain_dict['loud_high']+ grain_dict['loud_highmid']
                    +grain_dict['loud_lowmid']+grain_dict['medium_high']
                    +grain_dict['medium_lowmid'])

    if state == 'A':
        loscil_output = random.choice(state_A_loscil)
        granule_output = random.choice(state_A_granule)
    elif state == 'B':
        loscil_output = random.choice(state_B_loscil)
        granule_output = random.choice(state_B_granule)
    elif state == 'C':
        loscil_output = random.choice(state_C_loscil)
        granule_output = random.choice(state_C_granule)
    elif state == 'D':
        loscil_output = random.choice(state_D_loscil)
        granule_output = random.choice(state_D_granule)
    elif state == 'E':
        loscil_output = random.choice(state_E_loscil)
        granule_output = random.choice(state_E_granule)
    elif state == 'F':
        loscil_output = random.choice(state_F_loscil)
        granule_output = random.choice(state_F_granule)
    elif state == 'G':
        loscil_output = random.choice(state_G_loscil)
        granule_output = random.choice(state_G_granule)
    elif state == 'H':
        loscil_output = random.choice(state_H_loscil)
        granule_output = random.choice(state_H_granule)
    else:
        loscil_output = random.choice(state_I_loscil)
        granule_output = random.choice(state_I_granule)

    return loscil_output, granule_output





# loops through matrix 10 times...
# for Csound reinit remove this for loop

lookup = str(previous_state) + str(current_state)
csound_state = csound_convert(current_state)
eval_state = weighted_choice (weight_dict[lookup])


if eval_state == 0:
    eval_state = 'A'
elif eval_state == 1:
    eval_state = 'B'
elif eval_state == 2:
    eval_state = 'C'
elif eval_state == 3:
    eval_state = 'D'
elif eval_state == 4:
    eval_state = 'E'
elif eval_state == 5:
    eval_state = 'F'
elif eval_state == 6:
    eval_state = 'G'
elif eval_state == 7:
    eval_state = 'H'
else:
    eval_state = 'I'

waveforms = waveform_selector(current_state)
loscil_output, granule_output = waveforms # unpack tuple
loscil_output = float(loscil_output)
granule_output = float(granule_output)



previous_state = current_state
current_state = eval_state
				
}}

; END Python Code


	istate pyevali "csound_state"             ; this loop controls initialization of instrument and supplies state variables
	iloscil_ifn pyevali "loscil_output"
	igranule_ifn pyevali "granule_output"
	
	print istate
	
	istrt = 0
	;duration of loscil/granule pair reinitialization determined by state
	if istate == 0 then		      ;stateA
		idur random .01, 1 		
	elseif istate == 1 then		;stateB
		idur random .01, 1 
	elseif istate == 2 then		;stateC
		idur random .01, 1
	elseif istate == 3 then		;stateD
		idur random .01, 1
	elseif istate == 4 then       ;stateE
		idur random .01, 1
	elseif istate == 5 then       ;stateF
		idur random .01, 1
	elseif istate == 6 then       ;stateG
		idur random .01, 1.3
	elseif istate == 7 then       ;stateH
		idur random .01, 1.5	
	else                          ;stateI
		idur random .01, 2 
	endif
	
	timout istrt, idur, loop_event
	reinit loop
		loop_event:				;state specific parameter list
			if istate == 0 then		;stateA
				ichaos_rand = 0   
				imin_grain_dur = 5 
				imax_grain_dur = 15
				imin_gsize = .001
				imax_gsize = .005
				igdeviation = 0
				iloscil_pitch random .9, 1.2
				iloscil_ampdev = 200
				iloscil_attack_strength = .1
				iloscil_decay_strength = .1
				ivoice_rand_max = 3
				igrain_amp = 5000
				iposition_min = .5 
				iposition_max = .5
				iloscil_onoff = 100
				
				event_i "i", 2, 0, idur,    iloscil_ifn, igranule_ifn, int(ichaos_rand), imin_grain_dur, imax_grain_dur, imin_gsize,  imax_gsize, 			                      							igdeviation, iloscil_pitch, iloscil_ampdev, iloscil_attack_strength, iloscil_decay_strength, ivoice_rand_max, 														igrain_amp, iposition_min, iposition_max, iloscil_onoff		
			elseif istate == 1 then		;stateB
			     ichaos_rand = 10
			     imin_grain_dur = 4
				imax_grain_dur = 8
				imin_gsize = .001
				imax_gsize = .005
				igdeviation = .5
				iloscil_pitch random .9, 1.2
				iloscil_ampdev = 200
				iloscil_attack_strength = .1
				iloscil_decay_strength = .1
				ivoice_rand_max = 3	
				igrain_amp = 5400
				iposition_min = .4 
				iposition_max = .6
				iloscil_onoff = 100
				
				event_i "i", 2, 0, idur,    iloscil_ifn, igranule_ifn, int(ichaos_rand), imin_grain_dur, imax_grain_dur, imin_gsize,  imax_gsize, 			                      							igdeviation, iloscil_pitch, iloscil_ampdev, iloscil_attack_strength, iloscil_decay_strength, ivoice_rand_max, 														igrain_amp, iposition_min, iposition_max, iloscil_onoff 	
			elseif istate == 2 then		;stateC
			     ichaos_rand = 20
			     imin_grain_dur = 3
				imax_grain_dur = 5
				imin_gsize = .001
				imax_gsize = .01
				igdeviation = 1
				iloscil_pitch random .8, 1.25
				iloscil_ampdev = 400
				iloscil_attack_strength = .3
				iloscil_decay_strength = .3
				ivoice_rand_max = 5
				igrain_amp = 5600
				iposition_min = .35 
				iposition_max = .65	
				iloscil_onoff = 100
				
				event_i "i", 2, 0, idur,    iloscil_ifn, igranule_ifn, int(ichaos_rand), imin_grain_dur, imax_grain_dur, imin_gsize,  imax_gsize, 			                      							igdeviation, iloscil_pitch, iloscil_ampdev, iloscil_attack_strength, iloscil_decay_strength, ivoice_rand_max, 														igrain_amp, iposition_min, iposition_max, iloscil_onoff
			elseif istate == 3 then		;stateD
			     ichaos_rand = 30
			     imin_grain_dur = 3
				imax_grain_dur = 9
				imin_gsize = .005
				imax_gsize = .02
				igdeviation = 3
				iloscil_pitch random .7, 1.25
				iloscil_ampdev = 800
				iloscil_attack_strength = .3
				iloscil_decay_strength = .3
				ivoice_rand_max = 7	
				igrain_amp = 5700
				iposition_min = .3 
				iposition_max = .6
				iloscil_onoff = 100
				
				event_i "i", 2, 0, idur,    iloscil_ifn, igranule_ifn, int(ichaos_rand), imin_grain_dur, imax_grain_dur, imin_gsize,  imax_gsize, 			                      							igdeviation, iloscil_pitch, iloscil_ampdev, iloscil_attack_strength, iloscil_decay_strength, ivoice_rand_max, 														igrain_amp, iposition_min, iposition_max, iloscil_onoff 	
			elseif istate == 4 then		;stateE
			     ichaos_rand = 40
			     imin_grain_dur = 2
				imax_grain_dur = 7
				imin_gsize = .001
				imax_gsize = .02
				igdeviation = 3.5
				iloscil_pitch random .7, 1.4
				iloscil_ampdev = 1000
				iloscil_attack_strength = .4
				iloscil_decay_strength = .4
				ivoice_rand_max = 8	
				igrain_amp = 6000
				iposition_min = .25 
				iposition_max = .75
				iloscil_onoff = 100
				
				event_i "i", 2, 0, idur,    iloscil_ifn, igranule_ifn, int(ichaos_rand), imin_grain_dur, imax_grain_dur, imin_gsize,  imax_gsize, 			                      							igdeviation, iloscil_pitch, iloscil_ampdev, iloscil_attack_strength, iloscil_decay_strength, ivoice_rand_max, 														igrain_amp, iposition_min, iposition_max, iloscil_onoff 
			elseif istate == 5 then		;stateF
			     ichaos_rand = 50
			     imin_grain_dur = 1
				imax_grain_dur = 4
				imin_gsize = .001
				imax_gsize = .02
				igdeviation = 5
				iloscil_pitch random .7, 1.4
				iloscil_ampdev = 1200
				iloscil_attack_strength = .5
				iloscil_decay_strength = .5
				ivoice_rand_max = 10
				igrain_amp = 6200
				iposition_min = .25 
				iposition_max = .75
				iloscil_onoff = 100	
				
				event_i "i", 2, 0, idur,    iloscil_ifn, igranule_ifn, int(ichaos_rand), imin_grain_dur, imax_grain_dur, imin_gsize,  imax_gsize, 			                      							igdeviation, iloscil_pitch, iloscil_ampdev, iloscil_attack_strength, iloscil_decay_strength, ivoice_rand_max, 														igrain_amp, iposition_min, iposition_max, iloscil_onoff
			elseif istate == 6 then		;stateG
			     ichaos_rand = 70
			     imin_grain_dur = .5
				imax_grain_dur = 4
				imin_gsize = .0005
				imax_gsize = .04
				igdeviation = 7
				iloscil_pitch random .6, 1.5
				iloscil_ampdev = 1200
				iloscil_attack_strength = .6
				iloscil_decay_strength = .6
				ivoice_rand_max = 12
				igrain_amp = 6400
				iposition_min = .2 
				iposition_max = .7	
				iloscil_onoff = 100
				
				event_i "i", 2, 0, idur,    iloscil_ifn, igranule_ifn, int(ichaos_rand), imin_grain_dur, imax_grain_dur, imin_gsize,  imax_gsize, 			                      							igdeviation, iloscil_pitch, iloscil_ampdev, iloscil_attack_strength, iloscil_decay_strength, ivoice_rand_max, 														igrain_amp, iposition_min, iposition_max, iloscil_onoff
			elseif istate == 7 then		;stateH
			     ichaos_rand = 90
			     imin_grain_dur = .3
				imax_grain_dur = 5
				imin_gsize = .0005
				imax_gsize = .04
				igdeviation = 10
				iloscil_pitch random .6, 1.6
				iloscil_ampdev = 1500
				iloscil_attack_strength = .8
				iloscil_decay_strength = .8
				ivoice_rand_max = 15
				igrain_amp = 6800
				iposition_min = .1 
				iposition_max = .9
				iloscil_onoff = 100	
				
				event_i "i", 2, 0, idur,    iloscil_ifn, igranule_ifn, int(ichaos_rand), imin_grain_dur, imax_grain_dur, imin_gsize,  imax_gsize, 			                      							igdeviation, iloscil_pitch, iloscil_ampdev, iloscil_attack_strength, iloscil_decay_strength, ivoice_rand_max, 														igrain_amp, iposition_min, iposition_max, iloscil_onoff
			else						;stateI
				ichaos_rand = 100
				imin_grain_dur = .2
				imax_grain_dur = 3
				imin_gsize = .0001
				imax_gsize = .05
				igdeviation = 15
				iloscil_pitch random .5, 1.7
				iloscil_ampdev = 2000
				iloscil_attack_strength = 1
				iloscil_decay_strength = 1
				ivoice_rand_max = 20
				igrain_amp = 7000
				iposition_min = 0 
				iposition_max = 1
				iloscil_onoff = 100
				
				event_i "i", 2, 0, idur,    iloscil_ifn, igranule_ifn, int(ichaos_rand), imin_grain_dur, imax_grain_dur, imin_gsize,  imax_gsize, 			                      							igdeviation, iloscil_pitch, iloscil_ampdev, iloscil_attack_strength, iloscil_decay_strength, ivoice_rand_max, 														igrain_amp, iposition_min, iposition_max, iloscil_onoff		
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
igrain_amp = p17
iposition_min = p18
iposition_max = p19
iloscil_onoff = p20

;loscil envelope data

iattack_loscil random .01, (ievent_dur * iloscil_attack_strength)
idecay_loscil random .01, (ievent_dur - iattack_loscil) * iloscil_decay_strength

; loscil on/off switch

	iloscil_off_rand random 0, 100

	if iloscil_off_rand <= iloscil_onoff then
		iloscil_amp = 0
		iloscil_ampdev = 0
	else
		iloscil_amp = 3500
	endif
	

iloscil_dur_rand random ievent_dur * .5, ievent_dur           ; create loscil overlap 
iloscil_dur = ievent_dur + iloscil_dur_rand 

event_i "i", 10, 0, iloscil_dur, iattack_loscil, idecay_loscil, iloscil_ifn, iloscil_pitch, iloscil_ampdev, iloscil_amp  


; other granule constants

imode = 1
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
	
	iratio random .7, 1.4
	
	
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
	
	ifnenv_rand random 82, 88
	ifnenv = int(ifnenv_rand)
	
	igskip_os = 0
	
		if (isetting < 50) then
			irange = isetting * .5
		else
			irange = (100 - isetting) * .5
		endif

		igauss gauss irange
		ichaos_setting = igauss + isetting
	
	
	igap_os = ichaos_setting
	igsize_os = ichaos_setting
	
	
		
	ipitch1 random 0,1
	ipitch2 random .5,1.5
	ipitch3 random .8, 1.7
	ipitch4 random 1,2
	
	
	ieventdur_rand random igrain_dur *.5, igrain_dur			; creates overlap	       	
	ieventdur = igrain_dur + ieventdur_rand
	
	
	iattack_granule random .05, igrain_dur  ; creates event AD envelope
	idecay_granule random .05, (igrain_dur - iattack_granule)
	
	event_i "i", 11, 0, ieventdur, 	ivoice, iratio, imode, ithd, ifn_granule, ipshift, igskip,  igskip_os, ilength, igap_os, igsize_os, iatt, idec , ipitch1 , ipitch2 , ipitch3 , ipitch4 , ifnenv,  iattack_granule, idecay_granule, imin_gsize, imax_gsize, igdeviation, igrain_amp, iposition_min, iposition_max 

endin


instr 10  ; global loscil
iloscil_amp = p9
iloscil_ampdev = p8

kjitter jitter iloscil_ampdev, 5, 15
  
kamp_osc = iloscil_amp + kjitter
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


kjitter jitter 700, 1, 5

igrain_amp = p27
kamp = igrain_amp + kjitter


kgap randomi .0001, .1, p26 ;kdeviation 
kgsize randomi p24, p25, p26 ;kdeviation

iattack = p22 
idecay = p23 

aSig granule kamp, p4, p5, p6, p7, p8, p9, p10,  p11, p12, kgap, p13, kgsize, p14, p15, p16  , 2.5344554654, p17, p18, p19, p20, p21

	aEnv adsr iattack, 0, 1, idecay
 

iposition random p28,p29
	if iposition <= .5 then
	kjit_pan jitter iposition * .75, .5, p26
	else
	kjit_pan jitter (1 - iposition) * .75, .5, p26
	endif

kpan = kjit_pan + iposition

aPanL, aPanR pan2 aSig, kpan ,1


outs aPanL * aEnv, aPanR * aEnv

endin



</CsInstruments>
<CsScore>

f 0 1
s
i1 0 180       

f 0 30

</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>72</x>
 <y>179</y>
 <width>400</width>
 <height>200</height>
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
WindowBounds: 72 179 400 200
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
</MacGUI>
