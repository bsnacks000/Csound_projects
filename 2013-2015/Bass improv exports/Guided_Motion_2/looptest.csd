<CsoundSynthesizer>
<CsOptions>
--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps =10
nchnls = 2
0dbfs = 20000

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




instr 1

kamp_osc invalue "kamp_osc"
kcps_osc invalue "kcps_osc"
ifn =  41

aDry1 loscil kamp_osc, kcps_osc, ifn ,1,1
	aEnv adsr .1,0,1,.5

outs aDry1* aEnv , aDry1 * aEnv 

isamp_total = nsamp(ifn)
print isamp_total

endin



</CsInstruments>
<CsScore>
i1 0 30

</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1385</x>
 <y>72</y>
 <width>214</width>
 <height>717</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kamp_osc</objectName>
  <x>22</x>
  <y>158</y>
  <width>115</width>
  <height>109</height>
  <uuid>{128e08a5-7858-49b7-a01b-86b4b947cd6b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>10000.00000000</maximum>
  <value>5300.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kcps_osc</objectName>
  <x>23</x>
  <y>290</y>
  <width>116</width>
  <height>116</height>
  <uuid>{bc217b37-7be7-46f6-b395-4d620c9f7e08}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.50000000</minimum>
  <maximum>5.00000000</maximum>
  <value>1.53500000</value>
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
WindowBounds: 1385 72 214 717
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioKnob {22, 158} {115, 109} 10000.000000 0.000000 0.010000 5300.000000 kamp_osc
ioKnob {23, 290} {116, 116} 5.000000 0.500000 0.010000 1.535000 kcps_osc
</MacGUI>
