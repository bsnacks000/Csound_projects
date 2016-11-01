<CsoundSynthesizer>
<CsOptions>
--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 128
nchnls = 2
0dbfs = 20000

seed 0

gaLFO1 init 0
gaLFO2 init 0
gaLFO3 init 0
gaLFO4 init 0
gaLFO5 init 0
gaLFO6 init 0
gaLFO7 init 0

girise init 0
gidec init 0

gkjitter init 0

;standard waveforms

giWave1  ftgen 1, 0, 8192, 10, 1					; basic sine
giWave2  ftgen 2, 0, 8192, 10, 1, 0.50, 0.33, 0.2, .166,.143 ; basic saw
giWave3  ftgen 3, 0, 8192, 10, 1,0,.111,0,.4,0,.0204,0,.0123456,0,.00826, 0 ; basic triangle
giWave4  ftgen 4, 0, 8192, 10, 1,0,.111,0,.4,.333,.0204,0,.0123456,.222,.00826 ; complex triangle (arch)
giWave5  ftgen 5, 0, 8192, 9,   1,1,90,   ; basic cosine 
giWave6  ftgen 6, 0, 8192, 10,  1, 0 , .5, .2, 1, 1, 0, .6, 1	 	; complex sine
giWave7  ftgen 7, 0, 8192, 10,  .2, .3, .5, 0, 0, 1, .2, .3, .8, 1    ; complex sine


; bit reduced to 16
giWave8  ftgen 8, 0, 16, 10, 1
giWave9 ftgen 9, 0, 16, 10, 1, 0.36, 0.33, 0.61, 1 
giWave10 ftgen 10, 0, 16, 10, 1,0,.111,0,.4,.333,.0204,0,.0123456,.222,.00826

; Cosine pulse waves

giWave11 ftgen 11, 0, 8192, 11,   5, 1, 1     ; safe for high freq
giWave12 ftgen 12, 0, 8192, 11,   10, 1, .9   ; safe for high freq
giWave13 ftgen 13, 0, 8192, 11,   15, 9, .75    ; low freq only - crazy aliasing
giWave14 ftgen 14, 0, 8192, 11,   25, 9, .95   ; low freq only - crazy aliasing
giWave15 ftgen 15, 0, 8192, 11,   50, 1, 1    ; low freq only - crazy aliasing

;Function envelopes

giWave16 ftgen 16, 0, 128, 7, 	1,128,0 ; hard SAW 
giWave17 ftgen 17, 0, 32, 7, 		1,32,0 ; soft SAW
giWave18 ftgen 18, 0, 128, 7, 	0,128,1 ; hard SAW up
giWave19 ftgen 19, 0, 32, 7, 		0,32,1 ; soft SAW up
giWave20 ftgen 20, 0, 128, 7, 	0,64,1,64,0; TRIANGLE
giWave21 ftgen 21, 0, 32, 7,       1,16,0,16,0; Square
giWave22 ftgen 22, 0, 32, 7,       1,3,0,29,0; pulse

instr 1; ultra randomized looping instrument 
icount = 1

idur = p3
ivoices = p4

iband_min = p5
iband_max = p6


iloop_type = p7   ; p8 = iFO type which is nested in the loops
icontrol_type = p9

if iloop_type == 1 then     ;Loop Block 1 -- multi voice LFO
	

	event_loop1:
    		ibandwidth1 random iband_min, iband_max  ;p5
    		ibandwidth2 random iband_min, iband_max  ;p6
    		ibandwidth3 random iband_min, iband_max  ;p7
    		ibandwidth4 random iband_min, iband_max  ;p8
    		ibandwidth5 random iband_min, iband_max  ;p9
    
    		ifn_rand random 1, 12; p10
    		ifn_rand_int = int(ifn_rand)
    	
    		iamp random 700, 1000 ; p4
     
    		iLFO_select random 0 ,8   ; changing min to 0 allows drone
    		iLFO_rand_int = int(iLFO_select) ; p11
    
    		event_i "i", 20, 0, idur, iamp, ibandwidth1, ibandwidth2, ibandwidth3, ibandwidth4, ibandwidth5, ifn_rand_int, iLFO_rand_int
    		loop_le icount, 1, ivoices, event_loop1

elseif iloop_type == 2 then      ; loop Block 2 -- single LFO over cell
	iLFO = p8    ; p11 in instr 20
	
	event_loop2:
    		ibandwidth1 random iband_min, iband_max  ;p5
    		ibandwidth2 random iband_min, iband_max  ;p6
    		ibandwidth3 random iband_min, iband_max  ;p7
    		ibandwidth4 random iband_min, iband_max  ;p8
    		ibandwidth5 random iband_min, iband_max  ;p9
    
    		ifn_rand random 1, 12; p10
    		ifn_rand_int = int(ifn_rand)
    			
    		iamp random 700, 1000 ; p4
    
    		event_i "i", 20, 0, idur, iamp, ibandwidth1, ibandwidth2, ibandwidth3, ibandwidth4, ibandwidth5, ifn_rand_int, iLFO
    		loop_le icount, 1, ivoices, event_loop2


elseif iloop_type == 3 then    ; loop Block 3 - points to inst 21 -random freq shifting hold
	iLFO = p8   ; p9
	  
	event_loop3:
    		irand_rate random .05, 2.5

		ifn_rand random 1, 8
    		ifn_rand_int = int(ifn_rand) ; p8
    			
    		iamp random 700, 1000 ; p4
    		
 		event_i "i", 21, 0, idur, iamp,iband_min, iband_max, irand_rate, ifn_rand_int, iLFO, icontrol_type, 
    		loop_le icount, 1, ivoices, event_loop3

elseif iloop_type == 4 then    ; loop Block 3 - points to inst 21 -random freq shifting hold
	   ; p9
	  
	event_loop4:
    		irand_rate random .05, 2.5
		icontrol random 1, 3
		icontrol = int(icontrol)
		
		ifn_rand random 1, 8
    		ifn_rand_int = int(ifn_rand) ; p8
    			
    		iamp random 700, 1000 ; p4
    		
    		iLFO_select random 0 ,8   ; changing min to 0 allows drone
    		iLFO_rand_int = int(iLFO_select) ; p11
    
    		event_i "i", 21, 0, idur, iamp,iband_min, iband_max, irand_rate, ifn_rand_int, iLFO_rand_int, icontrol
    		loop_le icount, 1, ivoices, event_loop4


endif
    	
endin


instr 20; OSC bank1 single oscil with 5 part line seg ( setting 1 & 2)



kcps linseg p5, p3/4, p6, p3/4, p7, p3/4, p8, p3/4, p9

aOSC1 poscil p4, kcps + gkjitter, p10
	aEnv adsr .01, 0, 1, .1
aMix = aOSC1 *aEnv

	if p11 == 1 then
		aMix = aMix * gaLFO1
	elseif p11 == 2 then
		aMix = aMix * gaLFO2
	elseif p11 == 3 then
		aMix = aMix * gaLFO3
	elseif p11 == 4 then
		aMix = aMix * gaLFO4
	
	
	elseif p11 == 5 then
		aMix = aMix * gaLFO5
	elseif p11 == 6 then
		aMix = aMix * gaLFO6
	elseif p11 == 7 then
		aMix = aMix * gaLFO7
	
	
	elseif p11 == 8 then
	     aMix = aMix * (gaLFO1 + gaLFO2 + gaLFO3 + gaLFO4)
	elseif p11 == 9 then
	     aMix = aMix * (gaLFO1 * gaLFO2)
	elseif p11 == 10 then
	     aMix = aMix * (gaLFO3 * gaLFO4)
	
	elseif p11 == 11 then
	     aMix = aMix * (gaLFO1 * gaLFO5)     
	elseif p11 == 12 then
	     aMix = aMix * (gaLFO2 * gaLFO6)
	elseif p11 == 13 then
	     aMix = aMix * (gaLFO3 * gaLFO7)          
	
	endif
	

aMix_block dcblock2 aMix
	
outs aMix_block , aMix_block  

endin

instr 21 ; random hold ( setting 3 & 4)


if p10 == 1 then
	kcps randomh p5, p6, p7 + gkjitter  , 3 
elseif p10 == 2 then
     kcps randomi p5, p6, p7 *.5 + gkjitter , 3
endif

aOSC1 poscil p4, kcps + gkjitter, p8
	aEnv adsr .01, 0, 1, .1
aMix = aOSC1 *aEnv

	if p9 == 1 then
		aMix = aMix * gaLFO1
	elseif p9 == 2 then
		aMix = aMix * gaLFO2
	elseif p9 == 3 then
		aMix = aMix * gaLFO3
	elseif p9 == 4 then
		aMix = aMix * gaLFO4
	
	
	elseif p9 == 5 then
		aMix = aMix * gaLFO5
	elseif p9 == 6 then
		aMix = aMix * gaLFO6
	elseif p9 == 7 then
		aMix = aMix * gaLFO7
	
	
	elseif p9 == 8 then
	     aMix = aMix * (gaLFO1 + gaLFO2 + gaLFO3 + gaLFO4)
	elseif p9 == 9 then
	     aMix = aMix * (gaLFO1 * gaLFO2)
	elseif p9 == 10 then
	     aMix = aMix * (gaLFO3 * gaLFO4)
	
	elseif p9 == 11 then
	     aMix = aMix * (gaLFO1 * gaLFO5)     
	elseif p9 == 12 then
	     aMix = aMix * (gaLFO2 * gaLFO6)
	elseif p9 == 13 then
	     aMix = aMix * (gaLFO3 * gaLFO7)          
	
	endif
	

aMix_block dcblock2 aMix
	
outs aMix_block , aMix_block 


endin


;;;;MANUAL LFO BANK;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

instr 101; gaLFO 1 

kfreq_lfo1 invalue "kfreq_lfo1"
kamp_lfo1 invalue "kamp_lfo1"
kfn invalue "kfn_lfo1"

gaLFO1 oscilikt kamp_lfo1, kfreq_lfo1, kfn 
endin

instr 102; gaLFO 2 -- mid speed - waveform 1-7

kfreq_lfo2 invalue "kfreq_lfo2"
kamp_lfo2 invalue "kamp_lfo2"
kfn_lfo2 invalue "kfn_lfo2"

gaLFO2 oscilikt kamp_lfo2, kfreq_lfo2, kfn_lfo2 
endin

instr 103; gaLFO 3 -- high speed - waveform 1-7
kfreq_lfo3 invalue "kfreq_lfo3"
kamp_lfo3 invalue "kamp_lfo3"
kfn_lfo3 invalue "kfn_lfo3"

gaLFO3 oscilikt kamp_lfo3, kfreq_lfo3, kfn_lfo3
endin

instr 104; gaLFO 3 -- high speed - waveform 1-7
kfreq_lfo4 invalue "kfreq_lfo4"
kamp_lfo4 invalue "kamp_lfo4"
kfn_lfo4 invalue "kfn_lfo4"

gaLFO4 oscilikt kamp_lfo4, kfreq_lfo4, kfn_lfo4
endin


;;;;;;;;;;;;;;;;;;;STOCHASTIC LFO BANK;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

instr 105  ;LFO5 gauss bounce 

kfreq_lfo5 invalue "kfreq_lfo5"
kamp_lfo5 invalue "kamp_lfo5"
kfn_lfo5 invalue "kfn_lfo5"


krange_rate_lfo5 invalue "krange_rate_lfo5"
kgauss_amp_lfo5  invalue "kgauss_amp_lfo5"
kgauss_rate_lfo5 invalue "kgauss_rate_lfo5"

krange_gauss randomi kfreq_lfo5 * .1, kfreq_lfo5 * 3.5, krange_rate_lfo5 
kgauss gaussi krange_gauss, kgauss_amp_lfo5, kgauss_rate_lfo5

gaLFO5 oscilikt kamp_lfo5, kfreq_lfo5 + kgauss, kfn_lfo5 

endin

instr 106   ; random hold

kfreq_lfo6 invalue "kfreq_lfo6"
kamp_lfo6 invalue "kamp_lfo6"
kfn_lfo6 invalue "kfn_lfo6"

krandom_rate invalue "krandom_rate"

krandom randomi  kfreq_lfo6 * .1, kfreq_lfo6 * 3.5, krandom_rate

gaLFO6 oscilikt kamp_lfo6, kfreq_lfo6 + krandom, kfn_lfo6  

endin

instr 107  ;LFO5 gauss bounce 

kfreq_lfo7 invalue "kfreq_lfo7"
kamp_lfo7 invalue "kamp_lfo7"
kfn_lfo7 invalue "kfn_lfo7"


krange_rate_lfo7 invalue "krange_rate_lfo7"
kgauss_amp_lfo7  invalue "kgauss_amp_lfo7"
kgauss_rate_lfo7 invalue "kgauss_rate_lfo7"

krange_gauss randomi kfreq_lfo7 * .1, kfreq_lfo7 * 3.5, krange_rate_lfo7 
kgauss gaussi krange_gauss, kgauss_amp_lfo7, kgauss_rate_lfo7

gaLFO7 oscilikt kamp_lfo7, kfreq_lfo7 + kgauss, kfn_lfo7 

endin

instr 108 ; global jitter rate

kamp_jit invalue "kamp_jit"
kcpsMax invalue "kcpsMax"
gkjitter jitter kamp_jit, .1, kcpsMax

endin

</CsInstruments>
<CsScore>
f 0 1
s

i101 0 300
i102 0 300
i103 0 300
i104 0 300
i105 0 300
i106 0 300
i107 0 300
i108 0 300

		; setting 1 & 4 uses 1pfield, 2 uses 2 pfields. 3  uses 3 

i1 0 300 3  30   100   2 1 5
i1 0 300 3  150  160   2 3 1   
i1 0 300 3  1100 1110  5 2 3

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
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>7</x>
  <y>583</y>
  <width>147</width>
  <height>109</height>
  <uuid>{216da2aa-abba-4ee1-871c-51d842e04b16}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>jitter control</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>13</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>131</g>
   <b>195</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>189</x>
  <y>1</y>
  <width>206</width>
  <height>608</height>
  <uuid>{6fd109b1-1312-48af-a98d-27bb84a2502f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>131</r>
   <g>255</g>
   <b>135</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>2</x>
  <y>4</y>
  <width>177</width>
  <height>550</height>
  <uuid>{a0f79e6a-40c6-4aef-8539-ad87c12e9e56}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>182</r>
   <g>240</g>
   <b>234</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kfreq_lfo1</objectName>
  <x>7</x>
  <y>39</y>
  <width>93</width>
  <height>96</height>
  <uuid>{81abb761-434f-4228-9c8c-d5896212ac4b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.10000000</minimum>
  <maximum>20.00000000</maximum>
  <value>8.25900000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>kfn_lfo1</objectName>
  <x>102</x>
  <y>29</y>
  <width>54</width>
  <height>25</height>
  <uuid>{1329a50e-3b6e-4f7a-a84d-8435a6d70f21}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>5</minimum>
  <maximum>22</maximum>
  <randomizable group="0">false</randomizable>
  <value>16</value>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kamp_lfo1</objectName>
  <x>103</x>
  <y>57</y>
  <width>58</width>
  <height>57</height>
  <uuid>{a62b295c-0687-47ea-bd88-837e6b2a6933}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>5.00000000</maximum>
  <value>2.15000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>9</x>
  <y>9</y>
  <width>80</width>
  <height>25</height>
  <uuid>{beac03cc-feb7-4925-8edb-c98823233214}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>LFO 1</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kfreq_lfo2</objectName>
  <x>8</x>
  <y>172</y>
  <width>93</width>
  <height>96</height>
  <uuid>{901aafe7-6b48-404f-8ccd-24e8d199ba6f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.10000000</minimum>
  <maximum>20.00000000</maximum>
  <value>3.08500000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>kfn_lfo2</objectName>
  <x>101</x>
  <y>153</y>
  <width>54</width>
  <height>25</height>
  <uuid>{95b81888-77a9-4175-af10-4de72bbb456b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>5</minimum>
  <maximum>22</maximum>
  <randomizable group="0">false</randomizable>
  <value>5</value>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kamp_lfo2</objectName>
  <x>104</x>
  <y>184</y>
  <width>58</width>
  <height>57</height>
  <uuid>{2465caac-a3af-47cc-a504-37f8527cac8e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>5.00000000</maximum>
  <value>0.70000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>8</x>
  <y>142</y>
  <width>80</width>
  <height>25</height>
  <uuid>{8a1e041e-4b0a-4309-9a4e-5752afe51ced}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>LFO 2</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kfreq_lfo3</objectName>
  <x>9</x>
  <y>300</y>
  <width>93</width>
  <height>96</height>
  <uuid>{be5414ca-36c7-4344-983d-6b77e6ebea83}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.10000000</minimum>
  <maximum>20.00000000</maximum>
  <value>4.67700000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>kfn_lfo3</objectName>
  <x>103</x>
  <y>282</y>
  <width>54</width>
  <height>25</height>
  <uuid>{bfe8a04f-69df-4d6d-b143-cbc770cb891e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>5</minimum>
  <maximum>22</maximum>
  <randomizable group="0">false</randomizable>
  <value>10</value>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kamp_lfo3</objectName>
  <x>104</x>
  <y>310</y>
  <width>58</width>
  <height>57</height>
  <uuid>{4f6c309d-f9be-460c-b9f9-01b0e2616b48}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>5.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>9</x>
  <y>273</y>
  <width>80</width>
  <height>25</height>
  <uuid>{1daa857f-35d7-4626-a001-c698b6939524}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>LFO 3</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kfreq_lfo4</objectName>
  <x>10</x>
  <y>429</y>
  <width>93</width>
  <height>96</height>
  <uuid>{0fb3ce3a-316d-4f28-abf2-17d837f907d5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.10000000</minimum>
  <maximum>20.00000000</maximum>
  <value>10.44600000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>kfn_lfo4</objectName>
  <x>106</x>
  <y>414</y>
  <width>54</width>
  <height>25</height>
  <uuid>{25d29bad-46d2-4bbd-9263-5a328f621644}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>5</minimum>
  <maximum>22</maximum>
  <randomizable group="0">false</randomizable>
  <value>22</value>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kamp_lfo4</objectName>
  <x>105</x>
  <y>441</y>
  <width>58</width>
  <height>57</height>
  <uuid>{d5186aa6-8bac-4956-a939-d266855aec09}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>5.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>12</x>
  <y>399</y>
  <width>80</width>
  <height>25</height>
  <uuid>{18be5943-5254-414b-98d3-d898b6dd3ddf}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>LFO 4</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kfreq_lfo5</objectName>
  <x>200</x>
  <y>35</y>
  <width>93</width>
  <height>96</height>
  <uuid>{49c9976a-849e-466f-820b-2b44bd14ec89}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.10000000</minimum>
  <maximum>20.00000000</maximum>
  <value>15.82100000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kamp_lfo5</objectName>
  <x>298</x>
  <y>47</y>
  <width>54</width>
  <height>51</height>
  <uuid>{eb6bc6df-e54d-403c-bc79-e9a0bf5d3d13}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>5.00000000</maximum>
  <value>0.60000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>kfn_lfo5</objectName>
  <x>296</x>
  <y>19</y>
  <width>54</width>
  <height>25</height>
  <uuid>{4f1c37cb-f1f7-4d35-8633-02c6b78fbf95}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>5</minimum>
  <maximum>22</maximum>
  <randomizable group="0">false</randomizable>
  <value>22</value>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>krange_rate_lfo5</objectName>
  <x>199</x>
  <y>131</y>
  <width>61</width>
  <height>64</height>
  <uuid>{976e8b15-cf46-4f82-8a90-3471ba82c0cc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.10000000</minimum>
  <maximum>10.00000000</maximum>
  <value>0.29800000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kgauss_amp_lfo5</objectName>
  <x>262</x>
  <y>131</y>
  <width>61</width>
  <height>64</height>
  <uuid>{11b991b8-2052-431b-962f-029e98e822a0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>10.00000000</maximum>
  <value>5.23000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kgauss_rate_lfo5</objectName>
  <x>325</x>
  <y>131</y>
  <width>61</width>
  <height>64</height>
  <uuid>{1779b18d-062f-408d-bad6-f80ae58241dc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.10000000</minimum>
  <maximum>20.00000000</maximum>
  <value>0.29900000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>200</x>
  <y>6</y>
  <width>80</width>
  <height>25</height>
  <uuid>{976fa5a6-f8a6-4bb1-bae6-401a7d989b2c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>LFO 5</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>199</x>
  <y>201</y>
  <width>80</width>
  <height>25</height>
  <uuid>{886b1c26-0b99-496d-854a-10a72e97f86f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>LFO 6</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kfreq_lfo6</objectName>
  <x>196</x>
  <y>235</y>
  <width>93</width>
  <height>96</height>
  <uuid>{905b53b0-f575-4b45-8f35-8d9bc4bfe5f3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.10000000</minimum>
  <maximum>20.00000000</maximum>
  <value>13.43300000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kamp_lfo6</objectName>
  <x>294</x>
  <y>241</y>
  <width>52</width>
  <height>49</height>
  <uuid>{673d82f3-d65e-4b1b-8445-4c80bfc9834f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>5.00000000</maximum>
  <value>1.95000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>kfn_lfo6</objectName>
  <x>294</x>
  <y>209</y>
  <width>54</width>
  <height>25</height>
  <uuid>{e6e6d04a-e45c-4c1f-bfcd-32ac1715d8bc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>5</minimum>
  <maximum>22</maximum>
  <randomizable group="0">false</randomizable>
  <value>21</value>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>krandom_rate</objectName>
  <x>292</x>
  <y>322</y>
  <width>65</width>
  <height>66</height>
  <uuid>{6ed95ca0-167b-4d08-a80c-1739e01716b6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.10000000</minimum>
  <maximum>10.00000000</maximum>
  <value>7.22800000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kfreq_lfo7</objectName>
  <x>199</x>
  <y>418</y>
  <width>93</width>
  <height>96</height>
  <uuid>{7d83d79d-8183-403e-b712-e4626333a372}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.10000000</minimum>
  <maximum>20.00000000</maximum>
  <value>2.28900000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kamp_lfo7</objectName>
  <x>294</x>
  <y>462</y>
  <width>54</width>
  <height>51</height>
  <uuid>{a816b6e2-02e5-4ee5-8ba5-50d71fd24d45}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>5.00000000</maximum>
  <value>1.45000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>kfn_lfo7</objectName>
  <x>294</x>
  <y>406</y>
  <width>54</width>
  <height>25</height>
  <uuid>{6001ef7e-b02f-4483-8ca1-370ea2fed102}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>5</minimum>
  <maximum>22</maximum>
  <randomizable group="0">false</randomizable>
  <value>18</value>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>krange_rate_lfo7</objectName>
  <x>201</x>
  <y>519</y>
  <width>61</width>
  <height>64</height>
  <uuid>{b96fd7c0-570a-408a-947b-1613be583849}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.10000000</minimum>
  <maximum>10.00000000</maximum>
  <value>7.72300000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kgauss_amp_lfo7</objectName>
  <x>264</x>
  <y>519</y>
  <width>61</width>
  <height>64</height>
  <uuid>{0f7467b4-b5bf-4f7b-bf73-db281101e87b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>10.00000000</maximum>
  <value>4.24000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kgauss_rate_lfo7</objectName>
  <x>326</x>
  <y>519</y>
  <width>61</width>
  <height>64</height>
  <uuid>{c2104a58-711f-4e1f-8d87-09b4663996a6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.10000000</minimum>
  <maximum>20.00000000</maximum>
  <value>8.25900000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>198</x>
  <y>383</y>
  <width>80</width>
  <height>25</height>
  <uuid>{f97dde2d-0049-4a2e-8fc8-aa10d645f5fa}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>LFO 7</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kfreq_lfo1</objectName>
  <x>104</x>
  <y>117</y>
  <width>40</width>
  <height>20</height>
  <uuid>{43285233-4f91-4c02-8836-1d3288d634be}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>8.25900000</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kfreq_lfo2</objectName>
  <x>105</x>
  <y>248</y>
  <width>40</width>
  <height>20</height>
  <uuid>{7c47bec4-0dc6-49e5-a24f-e215a1ffb7af}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>3.08500000</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kfreq_lfo3</objectName>
  <x>106</x>
  <y>372</y>
  <width>40</width>
  <height>20</height>
  <uuid>{98d99b28-730d-4266-a147-ea7afca48a48}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>4.67700000</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kfreq_lfo4</objectName>
  <x>107</x>
  <y>503</y>
  <width>40</width>
  <height>20</height>
  <uuid>{0c6de06f-2b7c-47da-9b72-a792421d7f56}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>10.44600000</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kfreq_lfo5</objectName>
  <x>299</x>
  <y>101</y>
  <width>40</width>
  <height>20</height>
  <uuid>{aaab435d-7e27-43e6-ae98-57afccfeb4a0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>15.82100000</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kfreq_lfo6</objectName>
  <x>295</x>
  <y>297</y>
  <width>40</width>
  <height>20</height>
  <uuid>{b8046d24-d9ec-4268-8efb-96f547edd57b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>13.43300000</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kfreq_lfo7</objectName>
  <x>295</x>
  <y>438</y>
  <width>40</width>
  <height>20</height>
  <uuid>{ffef352a-3e08-4021-bfea-245163261124}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>2.28900000</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kamp_jit</objectName>
  <x>11</x>
  <y>611</y>
  <width>64</width>
  <height>60</height>
  <uuid>{2c7814f3-8a42-4677-a2ff-0d3722b14017}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>10.00000000</maximum>
  <value>2.35000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kcpsMax</objectName>
  <x>78</x>
  <y>611</y>
  <width>64</width>
  <height>60</height>
  <uuid>{bf146041-8b2d-45f5-a9e8-0052e78dfaef}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>30.00000000</maximum>
  <value>24.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
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
ioText {7, 583} {147, 109} label 0.000000 0.00100 "" left "Arial" 13 {0, 0, 0} {65280, 33536, 49920} nobackground noborder jitter control
ioText {189, 1} {206, 608} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {33536, 65280, 34560} nobackground noborder 
ioText {2, 4} {177, 550} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {46592, 61440, 59904} nobackground noborder 
ioKnob {7, 39} {93, 96} 20.000000 0.100000 0.010000 8.259000 kfreq_lfo1
ioText {102, 29} {54, 25} editnum 16.000000 1.000000 "kfn_lfo1" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 16.000000
ioKnob {103, 57} {58, 57} 5.000000 0.000000 0.010000 2.150000 kamp_lfo1
ioText {9, 9} {80, 25} label 0.000000 0.00100 "" left "Arial" 15 {0, 0, 0} {61440, 61440, 61440} nobackground noborder LFO 1
ioKnob {8, 172} {93, 96} 20.000000 0.100000 0.010000 3.085000 kfreq_lfo2
ioText {101, 153} {54, 25} editnum 5.000000 1.000000 "kfn_lfo2" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 5.000000
ioKnob {104, 184} {58, 57} 5.000000 0.000000 0.010000 0.700000 kamp_lfo2
ioText {8, 142} {80, 25} label 0.000000 0.00100 "" left "Arial" 15 {0, 0, 0} {61440, 61440, 61440} nobackground noborder LFO 2
ioKnob {9, 300} {93, 96} 20.000000 0.100000 0.010000 4.677000 kfreq_lfo3
ioText {103, 282} {54, 25} editnum 10.000000 1.000000 "kfn_lfo3" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 10.000000
ioKnob {104, 310} {58, 57} 5.000000 0.000000 0.010000 0.000000 kamp_lfo3
ioText {9, 273} {80, 25} label 0.000000 0.00100 "" left "Arial" 15 {0, 0, 0} {61440, 61440, 61440} nobackground noborder LFO 3
ioKnob {10, 429} {93, 96} 20.000000 0.100000 0.010000 10.446000 kfreq_lfo4
ioText {106, 414} {54, 25} editnum 22.000000 1.000000 "kfn_lfo4" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 22.000000
ioKnob {105, 441} {58, 57} 5.000000 0.000000 0.010000 0.000000 kamp_lfo4
ioText {12, 399} {80, 25} label 0.000000 0.00100 "" left "Arial" 15 {0, 0, 0} {61440, 61440, 61440} nobackground noborder LFO 4
ioKnob {200, 35} {93, 96} 20.000000 0.100000 0.010000 15.821000 kfreq_lfo5
ioKnob {298, 47} {54, 51} 5.000000 0.000000 0.010000 0.600000 kamp_lfo5
ioText {296, 19} {54, 25} editnum 22.000000 1.000000 "kfn_lfo5" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 22.000000
ioKnob {199, 131} {61, 64} 10.000000 0.100000 0.010000 0.298000 krange_rate_lfo5
ioKnob {262, 131} {61, 64} 10.000000 1.000000 0.010000 5.230000 kgauss_amp_lfo5
ioKnob {325, 131} {61, 64} 20.000000 0.100000 0.010000 0.299000 kgauss_rate_lfo5
ioText {200, 6} {80, 25} label 0.000000 0.00100 "" left "Arial" 15 {0, 0, 0} {61440, 61440, 61440} nobackground noborder LFO 5
ioText {199, 201} {80, 25} label 0.000000 0.00100 "" left "Arial" 15 {0, 0, 0} {61440, 61440, 61440} nobackground noborder LFO 6
ioKnob {196, 235} {93, 96} 20.000000 0.100000 0.010000 13.433000 kfreq_lfo6
ioKnob {294, 241} {52, 49} 5.000000 0.000000 0.010000 1.950000 kamp_lfo6
ioText {294, 209} {54, 25} editnum 21.000000 1.000000 "kfn_lfo6" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 21.000000
ioKnob {292, 322} {65, 66} 10.000000 0.100000 0.010000 7.228000 krandom_rate
ioKnob {199, 418} {93, 96} 20.000000 0.100000 0.010000 2.289000 kfreq_lfo7
ioKnob {294, 462} {54, 51} 5.000000 0.000000 0.010000 1.450000 kamp_lfo7
ioText {294, 406} {54, 25} editnum 18.000000 1.000000 "kfn_lfo7" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 18.000000
ioKnob {201, 519} {61, 64} 10.000000 0.100000 0.010000 7.723000 krange_rate_lfo7
ioKnob {264, 519} {61, 64} 10.000000 1.000000 0.010000 4.240000 kgauss_amp_lfo7
ioKnob {326, 519} {61, 64} 20.000000 0.100000 0.010000 8.259000 kgauss_rate_lfo7
ioText {198, 383} {80, 25} label 0.000000 0.00100 "" left "Arial" 15 {0, 0, 0} {61440, 61440, 61440} nobackground noborder LFO 7
ioText {104, 117} {40, 20} scroll 8.259000 0.001000 "kfreq_lfo1" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {105, 248} {40, 20} scroll 3.085000 0.001000 "kfreq_lfo2" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {106, 372} {40, 20} scroll 4.677000 0.001000 "kfreq_lfo3" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {107, 503} {40, 20} scroll 10.446000 0.001000 "kfreq_lfo4" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {299, 101} {40, 20} scroll 15.821000 0.001000 "kfreq_lfo5" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {295, 297} {40, 20} scroll 13.433000 0.001000 "kfreq_lfo6" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {295, 438} {40, 20} scroll 2.289000 0.001000 "kfreq_lfo7" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {11, 611} {64, 60} 10.000000 1.000000 0.010000 2.350000 kamp_jit
ioKnob {78, 611} {64, 60} 30.000000 0.000000 0.010000 24.000000 kcpsMax
</MacGUI>
