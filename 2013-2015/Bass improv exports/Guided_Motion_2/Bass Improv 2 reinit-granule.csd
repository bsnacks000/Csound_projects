<CsoundSynthesizer>
<CsOptions>
--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 48
nchnls = 2
0dbfs = 20000

seed 0

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

;giSource80 ftgen 80, 0, 0, 1, "D1-2.wav", 0, 0, 0
;giSource81 ftgen 81, 0, 0, 1, "D2-1.wav", 0, 0, 0


; grain envelope functions
	
giWin_Hanning     	ftgen 80,0,8192, 20,2 
giWin_Bartlett    	ftgen 81,0,8192, 20,3
giWin_Blackman4     ftgen 82,0,8192, 20,5 
giWin_Gauss      	ftgen 83,0,8192, 20,6




instr 1 ; looping controls     uniform distributions

;constants

imode = 0
ithd = 0
iatt = 100
idec = 0
iseed = .5
igskip = 0

; chaos setting for guass circuit;  0 - 100
; controls offset gap and grain size offset randomness
isetting = 20



; looping variables
loop:
istrt = 0
idur random .5, 15             ; controls reinit duration
	timout istrt, idur, note_event 	
	reinit loop
	
	note_event:
	
	iratio random .5, 1.5
	
	
	ivoice_rand random 4, 15
	ivoice = int(ivoice_rand)
	
	ifn_rand random 1, 20
	ifn = int(ivoice_rand)
	
	ipshift_rand random 1,5
	ipshift = int(ipshift_rand)
	
	ilength = (nsamp(ifn)/sr)
	
	
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
	
	
	; need to write an if block to control voice sizes less than 4 and overlap durations
	ipitch1 random 0,1
	ipitch2 random 0,2
	ipitch3 random 0,3
	ipitch4 random 0,4
	
	ifnenv_rand random 20, 24
	ifnenv = int(ifnenv_rand)
	
	idelay = 0
	ieventdur_rand random 1, idur			; creates overlap	       	
	
	ieventdur = idur + ieventdur_rand
		
	print ieventdur, ilength
	
	event_i "i", 100, idelay, ieventdur, 	ivoice, iratio, imode, ithd, ifn, ipshift, igskip,  igskip_os, ilength, igap_os, igsize_os, iatt, idec , ipitch1 , ipitch2 , ipitch3 , ipitch4 , ifnenv

endin


instr 2

kamp_osc invalue "kamp_osc"
kcps_osc invalue "kcps_osc"
ifn =  65

aDry1 loscil kamp_osc, kcps_osc, ifn ,1,1
	aEnv adsr .1,0,1,.3

outs aDry1* aEnv , aDry1 * aEnv 

isamp_total = nsamp(ifn)
print isamp_total

endin




instr 100 ; L + R granule audio output
kamp invalue "kamp"
kgap invalue "kgap"
kgsize invalue "kgsize"


aSigL granule kamp, p4, p5, p6, p7, p8, p9, p10,  p11, p12, kgap, p13, kgsize, p14, p15, p16  , 2.5344554654, p17, p18, p19, p20, p21

aSigR granule kamp, p4, p5, p6, p7, p8, p9, p10,  p11, p12, kgap, p13, kgsize, p14, p15, p16  , 19.9378236 , p17, p18, p19, p20, p21

aEnv adsr .2, 0, 1, .5

outs aSigL * aEnv, aSigR * aEnv
endin



</CsInstruments>
<CsScore>
f 0 1
s
i1 0 120
i2 0 120

f 0 5
</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1546</x>
 <y>72</y>
 <width>210</width>
 <height>682</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kamp</objectName>
  <x>11</x>
  <y>51</y>
  <width>119</width>
  <height>112</height>
  <uuid>{30080da1-7cb6-4d5c-9896-c577a2b60dfe}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>10000.00000000</maximum>
  <value>4100.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kgap</objectName>
  <x>11</x>
  <y>163</y>
  <width>119</width>
  <height>111</height>
  <uuid>{2c65ac9f-b352-475e-8721-0e4722045b3a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00100000</minimum>
  <maximum>0.50000000</maximum>
  <value>0.07547000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kgsize</objectName>
  <x>11</x>
  <y>274</y>
  <width>119</width>
  <height>110</height>
  <uuid>{c583c6f6-713f-4c2f-a144-62f9e4ae25d4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00010000</minimum>
  <maximum>0.50000000</maximum>
  <value>0.03509300</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>129</x>
  <y>136</y>
  <width>80</width>
  <height>25</height>
  <uuid>{f38babef-08db-414f-bef2-22ca6d16d57f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>kamp</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
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
  <x>128</x>
  <y>226</y>
  <width>80</width>
  <height>25</height>
  <uuid>{89a74db0-ec55-4589-8c3a-765a18fdcf35}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>kgap</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
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
  <x>130</x>
  <y>332</y>
  <width>80</width>
  <height>25</height>
  <uuid>{c5950392-3e99-4311-90d3-350ca41ffaf4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>kgsize</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
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
  <objectName>kgap</objectName>
  <x>128</x>
  <y>250</y>
  <width>80</width>
  <height>25</height>
  <uuid>{9a56e1a4-b3e2-4009-927e-8357d2c0d12b}</uuid>
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
  <value>0.07547000</value>
  <resolution>0.00010000</resolution>
  <minimum>0.00100000</minimum>
  <maximum>0.50000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kgsize</objectName>
  <x>130</x>
  <y>358</y>
  <width>80</width>
  <height>25</height>
  <uuid>{437daf53-1db4-4be2-be4e-678d5a4b7ed3}</uuid>
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
  <value>0.03509300</value>
  <resolution>0.00010000</resolution>
  <minimum>0.00010000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kcps_osc</objectName>
  <x>17</x>
  <y>524</y>
  <width>80</width>
  <height>80</height>
  <uuid>{51774b25-3eb9-4660-8c5b-c740d1163926}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.50000000</minimum>
  <maximum>1.50000000</maximum>
  <value>0.87000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kamp_osc</objectName>
  <x>19</x>
  <y>445</y>
  <width>80</width>
  <height>80</height>
  <uuid>{2dd74046-d383-4f3e-98a2-25f42b0e6fde}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>10000.00000000</maximum>
  <value>3300.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>99</x>
  <y>495</y>
  <width>80</width>
  <height>25</height>
  <uuid>{a42b13f2-7dd4-4ec9-a171-dac8fc55b284}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>kamp</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
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
  <x>100</x>
  <y>574</y>
  <width>80</width>
  <height>25</height>
  <uuid>{1037a496-7be7-4405-a5bb-d24ce358c98d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>kcps</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
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
  <objectName>kresample</objectName>
  <x>19</x>
  <y>602</y>
  <width>80</width>
  <height>80</height>
  <uuid>{2c2bf44e-a089-481e-aee2-6959e6e86e0e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>10.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>101</x>
  <y>655</y>
  <width>80</width>
  <height>25</height>
  <uuid>{f1a0296d-5d6c-4665-bac0-05b5e5d17237}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>kresample</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
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
</bsbPanel>
<bsbPresets>
</bsbPresets>
<MacOptions>
Version: 3
Render: Real
Ask: Yes
Functions: ioObject
Listing: Window
WindowBounds: 1546 72 372 698
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioKnob {11, 51} {119, 112} 10000.000000 0.000000 0.010000 4100.000000 kamp
ioKnob {11, 163} {119, 111} 0.500000 0.001000 0.010000 0.075470 kgap
ioKnob {11, 274} {119, 110} 0.500000 0.000100 0.010000 0.035093 kgsize
ioText {129, 136} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder kamp
ioText {128, 226} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder kgap
ioText {130, 332} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder kgsize
ioText {128, 250} {80, 25} scroll 0.075470 0.000100 "kgap" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {130, 358} {80, 25} scroll 0.035093 0.000100 "kgsize" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {17, 524} {80, 80} 1.500000 0.500000 0.010000 0.870000 kcps_osc
ioKnob {19, 445} {80, 80} 10000.000000 0.000000 0.010000 3300.000000 kamp_osc
ioText {99, 495} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder kamp
ioText {100, 574} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder kcps
ioKnob {19, 602} {80, 80} 10.000000 1.000000 0.010000 1.000000 kresample
ioText {101, 655} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder kresample
</MacGUI>
