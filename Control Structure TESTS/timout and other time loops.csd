<CsoundSynthesizer>
<CsOptions>
--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps =10
nchnls = 2
0dbfs = 20000

seed 0
giSine ftgen 0, 0, 1024, 10, 1
giSine2 ftgen 0, 0, 1024, 10, 1, .5, .3, .2

instr 1; timout using event_i with random values reset on every loop

loop:
istrt = 0 
idur random .3, 1
 	timout istrt, idur, score_event
    	reinit loop
    
score_event:
    ifreq random 100, 500
    ioscdur random .3, 3
    
    event_i "i", 40, 0, ioscdur, 2000, ifreq 
    

endin


instr 2; loop that triggers a pool of events ( loop within a loop) 

; lengthening duration of idur and manipulating osc dur produces sounds from drones to granular clusters

loop:
icount = 1
istrt = 0 
idur random .1, 3
 	timout istrt, idur, pool_events
    	reinit loop

	pool_events:   		
   		prints "event pool"
   			iosc_strt random 0, idur * .9  ; makes sure longer events don't exceed pool boundary
    		iosc_dur random 1, 10
    		iosc_amp random 100,500
    		iosc_freq random 50, 5400
    
    		event_i "i", 40, iosc_strt, iosc_dur, iosc_amp, iosc_freq  	
   		
   			loop_le icount, 1, 10, pool_events

endin


instr 3; timout using event_i with gap width tendency control
; any argument within a loop can be controlled by a k rate variable but must be transformed to irate using i(x)
; in order to control events with k rate variables they need to be controlled in the sounding instrument for each reinit or controlled with a metro krate loop

; this block controls the reinit times (gap space)
ilength1 = 1
ilength2 = .08
ilength3 = .5
ilength4 = .01
ilength5 = .08
ilength6 = .8
kgap expseg ilength1, p3/5, ilength2, p3/5, ilength3, p3/5, ilength4, p3/5, ilength5, p3/5, ilength6
kgap init ilength1 ; need this here to clear variable between runs ;; needed for any krate arg being passed inside the loop to and transformed to irate

                          				  
loop:
istrt = 0 
idur = i(kgap) 		
 	timout istrt, idur, score_event
    	
    	reinit loop
    
score_event:
    	iosc_dur random .02, .08
    	iosc_amp random 500,1000
    	iosc_freq random 25, 300
    	
    
    	event_i "i", 50, 0, iosc_dur, iosc_amp, iosc_freq 
    

endin

instr 4; same as instr 1 but points to instr 50 which uses glissandi

loop:
istrt = 0 
idur random .03, .5
 	timout istrt, idur, score_event
    	reinit loop
    
score_event:
    iosc_amp random 500,2000
    iosc_dur random .3, 3
    
    event_i "i", 50, 0, iosc_dur, iosc_amp
    

endin

instr 5; loop that triggers a pool of events ( loop within a loop) 

loop:
icount = 1
istrt = 0 
idur random 1, 10
 	timout istrt, idur, pool_events
    	reinit loop

	pool_events:   		
   		prints "event pool"
   		iosc_strt random 0, idur * .9  ; makes sure longer events don't exceed pool boundary
    		iosc_dur random .1, 10
    		iosc_amp random 1000,1500
    		ibranch_rand random 1, 100
    		
    		
    		if (ibranch_rand <= 50) then
    			event_i "i", 60, iosc_strt, iosc_dur, iosc_amp  	
   						
		else
			event_i "i", 50, iosc_strt, iosc_dur, iosc_amp 
   				
   		endif
   			loop_le icount, 1, 5, pool_events
   		
endin





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
instr 40; sound

aSig oscil3 p4, p5, giSine  ; p fields for this inst refer to the event_i in inst 1
	aEnv adsr .01, 0, 1, .01 

outs aSig * aEnv , aSig * aEnv
endin


instr 50; sound with random asscending freq glissandi

ilower random 100, 500
iupper random 500, 1000

kFreq line ilower, p3, iupper

aSig oscil3 p4, kFreq, giSine  ; p fields for this inst refer to the event_i in inst 1
	aEnv adsr .001, 0, 1, .001 

outs aSig * aEnv , aSig * aEnv

endin

instr 60; sound with random descending freq glissandi

ilower random 100, 500
iupper random 500, 1000

kFreq line iupper, p3, ilower

aSig oscil3 p4, kFreq, giSine2  ; p fields for this inst refer to the event_i in inst 1
	aEnv adsr .01, 0, 1, .01 

outs aSig * aEnv , aSig * aEnv

endin



</CsInstruments>
<CsScore>
f 0 1
s
i1 0 300 
s
f 0 12  ; blank space in case events are still playing


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
 <bsbObject version="2" type="BSBVSlider">
  <objectName>slider1</objectName>
  <x>5</x>
  <y>5</y>
  <width>20</width>
  <height>100</height>
  <uuid>{902c875c-f5bb-4985-ba76-7b84732d0a30}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
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
ioSlider {5, 5} {20, 100} 0.000000 1.000000 0.000000 slider1
</MacGUI>
