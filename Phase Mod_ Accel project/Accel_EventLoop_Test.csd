<CsoundSynthesizer>
<CsOptions>
;--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps =10
nchnls = 2
0dbfs = 20000

giSine ftgen 0, 0, 8192, 10, 1

giSine_Grain_1 ftgen 2, 0, 8192, 10,  1, 0, 1, .5, 0, 1, 1
giSine_Grain_2 ftgen 3, 0, 8192, 10,  .3,.5,0,1,1,1,.5
giSine_Grain_3 ftgen 4, 0, 8192, 10,  0,1,.5, 0, 1



giWin_Gauss	ftgen 5, 0, 8192, 20, 6, 1
giWin_Hanning	ftgen 6,0,8192, 20,2
giWin_Exp2     ftgen 7,0,8192, 5,   .00001, 3000,1,2192,1, 3000, .00001
giWin_Exp     ftgen 8,0,8192, 5,   .00001, 4096, 1, 4096, .00001


giSource1  ftgen 9, 0, 0, 1, "PM_timbre.wav",0,0,0
giSource2  ftgen 10, 0, 0, 1, "4_low_chant.wav",0,0,0
giSource3  ftgen 11, 0, 0, 1, "low_quiet.wav",0,0,0 
giSource4  ftgen 12, 0, 0, 1, "C1-1.wav",0,0,0



seed 543

gaReverb_send_L init 0
gaReverb_send_R init 0


instr 1 ; EVENT TRIGGER

; temporary state variables... to be set with python indexing
; inst 2 phase mod
iCarrier_Freq_min = 20
iCarrier_Freq_max = 40
iIndex_rate_min = .1 
iIndex_rate_max = .7
iFeed_rate_min = .1
iFeed_rate_max = .7

;inst 3 grain
icps_min = 100
icps_max = 400
ifmd_max = 10
igdur_min = .005
igdur_max = .05
idens_min = .5
idens_max = 15

;inst 4 granule
iamp_min = 900
iamp_max = 1700
ivoice_max = 15
igap_min = .005
igap_max = .1
igap_os = 50
igsize_min = .005
igsize_max = .125
igsize_os = 25



Event:

istrt = 0
idur = 15   ; total event duration in seconds
icount = 1	
inumb_events = 1
	
	istate_rand random 0, 11				;; temporary state generator to be replaced by python indexing
	istate_numb = int(istate_rand)

if (istate_numb <= 4) then	
	timout istrt, idur, pm_pool_events
		reinit Event

		pm_pool_events:
    		ievent_start random 0, idur * .99
    		ievent_dur random 30, 60
    										;p3, p4, p5, p6, p7 ,p8, p9
    		event_i "i", 2, ievent_start, ievent_dur, iCarrier_Freq_min, iCarrier_Freq_max, iIndex_rate_min, 		iIndex_rate_max, iFeed_rate_min, iFeed_rate_max
    		
    		loop_le icount, 1, inumb_events,pm_pool_events
    
elseif (istate_numb <=7) then    
    timout istrt, idur, grain_pool_events
    	reinit Event
    	
    	grain_pool_events:
        	ievent_start random 0, idur * .99
        	ievent_dur random 20, 50
											;p3, p4, p5, p6, p7 ,p8, p9
			event_i "i", 3, ievent_start, ievent_dur, icps_min, icps_max, ifmd_max, igdur_min, igdur_max, idens_min, idens_max
			loop_le icount, 1, inumb_events, grain_pool_events

else
	timout istrt, idur, granule_pool_events
    	reinit Event
    	
    	granule_pool_events:
        	ievent_start random 0, idur * .99
        	ievent_dur random 20, 50
    									;p3, p4, p5, p6, p7 ,p8, p9
			event_i "i", 4, ievent_start, ievent_dur,iamp_min,iamp_max, ivoice_max, igap_min, igap_max, 									igap_os, igsize_min, igsize_max, igsize_os  
    		loop_le icount, 1, inumb_events,granule_pool_events


endif	

endin

instr 2 ; stoch phase mod

aCarrier init 0 ; initialize Carrier 

; i rate t-mask variables sent from Inst 1

ievent_dur = p3
iCarrier_Freq_min = p4
iCarrier_Freq_max = p5
iIndex_rate_min = p6
iIndex_rate_max = p7
iFeed_rate_min = p8
iFeed_rate_max = p9



iCarrier_Freq random iCarrier_Freq_min, iCarrier_Freq_max
iMod_Freq random (iCarrier_Freq), (iCarrier_Freq + 50)

iMod_Factor = iMod_Freq/iCarrier_Freq

iIndex_rate random iIndex_rate_min, iIndex_rate_max
aIndex randomi 0, 15, iIndex_rate,3 
aIndex = aIndex/ 6.28   ; divide by 2pi

ievent_attack random 1, ievent_dur * .3
ievent_release random  1, ievent_dur * .3
ievent_decay random .5, 1.5
ievent_sus = ievent_dur -(ievent_attack + ievent_release + ievent_decay)

aEnv expseg 0.001, ievent_attack, 0.8, ievent_decay, 0.65, ievent_sus, 0.65, ievent_release, 0.001   

aMod_osc poscil aIndex * aEnv, iMod_Freq * iMod_Factor, giSine
aPhase phasor iCarrier_Freq

iFeed_rate random iFeed_rate_min, iFeed_rate_max
aFeed_amount randomi 0, .175, iFeed_rate,3

aCarrier tablei aPhase + aMod_osc +(aCarrier * aFeed_amount), giSine , 1 , 0, 1


iSig_rate random .5, 1.5					; amplify, filter, pan and send to out and reverb
aSig_amp randomi 300, 900, iSig_rate,3
aLP_filt butterlp aCarrier, sr * 0.5 ; LPF helps reduce noise
kStereo_rate random 0,2
kStereo_drift randomi 0,1,kStereo_rate,1 
aOut_L, aOut_R pan2 aLP_filt, kStereo_drift , 1
aSig_Out_L = aOut_L * aEnv * aSig_amp
aSig_Out_R = aOut_R * aEnv * aSig_amp

outs aSig_Out_L , aSig_Out_R

iRvb_send random 0.8,1
gaReverb_send_L = gaReverb_send_L + (aSig_Out_L * iRvb_send)
gaReverb_send_R = gaReverb_send_R + (aSig_Out_R * iRvb_send)

endin

instr 3 ; synch grain

ievent_dur = p3
kcps_min = p4
kcps_max = p5
kfmd_max = p6
igdur_min = p7
igdur_max = p8
kdens_min = p9
kdens_max = p10

icps_rate random .05, .5 
kcps randomh kcps_min, kcps_max, icps_rate ,3 ,0

ifmd_rate random .1, .5
kfmd randomi 0, kfmd_max, ifmd_rate ,3 ,0

idens_rate random .05, .2
kdens randomi kdens_min, kdens_max, idens_rate, 3, 0

igdur random igdur_min, igdur_max

ifn random 2, 5
iwfn random 5, 8


aSig grain3 kcps, 0, kfmd, 0, igdur, kdens, 10000, int(ifn), iwfn, 0, 0 

ievent_attack random 1, ievent_dur * .3   ; generate event envelope
ievent_release random  1, ievent_dur * .3
ievent_decay random .5, 1.5
ievent_sus = ievent_dur -(ievent_attack + ievent_release + ievent_decay)

aEnv expseg 0.001, ievent_attack, 0.8, ievent_decay, 0.65, ievent_sus, 0.65, ievent_release, 0.001

iSig_rate random .5, 1.5					; amplify
aSig_amp randomi 1800, 2500, iSig_rate,3

kStereo_rate random 0,2      ; pan, out and send
kStereo_drift randomi 0,1,kStereo_rate,1 

aOut_L, aOut_R pan2 aSig, kStereo_drift , 1
aSig_Out_L = aOut_L * aEnv * aSig_amp
aSig_Out_R = aOut_R * aEnv * aSig_amp

outs aSig_Out_L, aSig_Out_R

iRvb_send random 0.25, 0.4
gaReverb_send_L = gaReverb_send_L + (aSig_Out_L * iRvb_send)
gaReverb_send_R = gaReverb_send_R + (aSig_Out_R * iRvb_send)

endin


instr 4 ; granule 

ievent_dur = p3
iamp_min = p4
iamp_max = p5
ivoice_max = p6
kgap_min = p7
kgap_max = p8
igap_os = p9
kgsize_min = p10
kgsize_max = p11
igsize_os = p12



iamp random iamp_min, iamp_max   ;;
ivoice random 4, ivoice_max ;;

igap_rate random 0.1, .5
kgap randomi kgap_min, kgap_max, igap_rate,3,0 ;;           

igsize_rate random 0.1, .5
kgsize randomi kgsize_min, kgsize_max, igsize_rate,3,0 ;;         


igskip = 0
igskip_os = 10
iratio = 1
imode = 1
ithd = 0
ifn random 9, 12    ; source tables - converted to int inside granule
ifn = int(ifn)

if (ifn == 9) then
	ilength = (nsamp(giSource1)/sr)
elseif (ifn == 10) then
	ilength = (nsamp(giSource2)/sr)
elseif (ifn == 11) then
	ilength = (nsamp(giSource3)/sr)
elseif (ifn == 12) then
	ilength = (nsamp(giSource4)/sr)
endif
	
ipshift = 4
iatt = 100
idec = 0
iseed = 0

ipitch1 = .75  ; possibly 
ipitch2 = .9
ipitch3 = 1
ipitch4 = 1.1

ifnenv random 5, 9


aSig_Out_L granule iamp, ivoice, iratio, imode, ithd, ifn, ipshift, igskip, igskip_os, ilength, kgap, igap_os, kgsize, igsize_os, iatt, idec , iseed , ipitch1 , ipitch2 , ipitch3 , ipitch4 , ifnenv


aSig_Out_R granule iamp, ivoice, iratio, imode, ithd, ifn, ipshift, igskip, igskip_os, ilength, kgap, igap_os, kgsize, igsize_os, iatt, idec , iseed * .927364 , ipitch1 , ipitch2 , ipitch3 , ipitch4 , ifnenv


ievent_attack random 1, ievent_dur * .3   ; generate event envelope
ievent_release random  1, ievent_dur * .3
ievent_decay random .5, 1.5
ievent_sus = ievent_dur -(ievent_attack + ievent_release + ievent_decay)

aEnv expseg 0.001, ievent_attack, 0.8, ievent_decay, 0.65, ievent_sus, 0.65, ievent_release, 0.001

outs aSig_Out_L * aEnv, aSig_Out_R * aEnv

iRvb_send random 0.15, 0.2
gaReverb_send_L = gaReverb_send_L + (aSig_Out_L * iRvb_send)
gaReverb_send_R = gaReverb_send_R + (aSig_Out_R * iRvb_send)


endin

;;;;;;;;;;;;;;;;;;;;;;;;;;
instr 100 ; reverb and out 

aVerb_L, aVerb_R freeverb gaReverb_send_L, gaReverb_send_R, 1, .4
	outs aVerb_L, aVerb_R
	clear gaReverb_send_L, gaReverb_send_R

endin


</CsInstruments>
<CsScore>

f 0 1
s
i1 0 500 
i100 0 520
;i3 0 10   200 500   10   .05  .01   10 20
;i3 0 10   300 700   30   .05  .01   10 20
;i3 0 10   400 500   90   .05  .01   10 20
;i3 0 10   200 500   10   .05  .01   10 20
;i4 0 10  1000 2000   10  .01 .1  50  .001 .05  30    

s
f 0 5 

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
