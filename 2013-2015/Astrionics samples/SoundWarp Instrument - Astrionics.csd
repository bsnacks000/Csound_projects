<CsoundSynthesizer>
<CsOptions>
--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps =10
nchnls = 2  ; mono output
0dbfs = 20000


giSource1 ftgen 0, 0, 1048576, 1, "GuitarSolo1.wav", 0, 0, 0
giSource2 ftgen 0, 0, 2097152, 1, "NoiseGuitarSolo.wav", 0, 0, 0
giSource3 ftgen 0, 0, 0, 1, "Bass Drone Improv 1.wav",0,0,0


giWin_Gauss ftgen 0,0,8192, 20,6

instr 1

iamp = 20000
itimewarp = 3.5
iresample = 1

ifn1 = giSource3
ibeg = 400
iwsize = 4410
irandw = 3
ioverlap = 56
ifn2 = giWin_Gauss
itimemode = 0



aSig, aComp sndwarp iamp, itimewarp, iresample, ifn1, ibeg, iwsize, irandw, ioverlap, ifn2, itimemode

	aBal balance aSig, aComp 
	aEnv adsr .01, 0, 1, .1

outs aBal * aEnv, aBal * aEnv
endin




</CsInstruments>
<CsScore>

f 0 1
s

i1 0 200


</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1400</x>
 <y>72</y>
 <width>518</width>
 <height>698</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBKnob">
  <objectName>ktimewarp</objectName>
  <x>40</x>
  <y>178</y>
  <width>177</width>
  <height>187</height>
  <uuid>{661e5d61-341b-42b1-9792-cc85a5844a19}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>50.00000000</maximum>
  <value>22.07000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>ktimewarp</objectName>
  <x>42</x>
  <y>369</y>
  <width>80</width>
  <height>25</height>
  <uuid>{0ab866e7-865a-40b7-b80f-4d868b3305a4}</uuid>
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
  <value>22.07000000</value>
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
  <objectName>kresample</objectName>
  <x>40</x>
  <y>400</y>
  <width>108</width>
  <height>123</height>
  <uuid>{75aead05-83e3-431d-b14c-19d420b8de6a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.01000000</minimum>
  <maximum>3.00000000</maximum>
  <value>1.95350000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kresample</objectName>
  <x>42</x>
  <y>531</y>
  <width>80</width>
  <height>25</height>
  <uuid>{0c624ae7-728b-4704-b50b-7daf3022b147}</uuid>
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
  <value>1.95350000</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
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
WindowBounds: 1400 72 518 698
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioKnob {40, 178} {177, 187} 50.000000 1.000000 0.010000 22.070000 ktimewarp
ioText {42, 369} {80, 25} scroll 22.070000 0.001000 "ktimewarp" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {40, 400} {108, 123} 3.000000 0.010000 0.010000 1.953500 kresample
ioText {42, 531} {80, 25} scroll 1.953500 0.001000 "kresample" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
</MacGUI>
