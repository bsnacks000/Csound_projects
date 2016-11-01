<CsoundSynthesizer>
<CsOptions>
--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps =10
nchnls = 2
0dbfs = 20000

giSource1 ftgen 0, 0, 0, 1, "speak1420909863245.wav", 0, 0, 0

instr 1

iamp = 5000
kcps invalue "kcps"
ifn = giSource1

aSig loscil iamp, kcps, ifn, 1, 1 
	aEnv adsr .01,0,1,.1

	outs aSig *aEnv, aSig * aEnv
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
 <x>1390</x>
 <y>72</y>
 <width>528</width>
 <height>698</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kcps</objectName>
  <x>27</x>
  <y>57</y>
  <width>186</width>
  <height>230</height>
  <uuid>{916914c0-0e11-439c-aa1f-b3b03883078b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>25.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kcps</objectName>
  <x>86</x>
  <y>293</y>
  <width>80</width>
  <height>25</height>
  <uuid>{a2f78694-77f2-4d50-b1b5-2c3aa1da218d}</uuid>
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
  <value>1.00000000</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act="continuous"/>
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
WindowBounds: 1390 72 528 698
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioKnob {27, 57} {186, 230} 25.000000 0.000000 0.010000 1.000000 kcps
ioText {86, 293} {80, 25} scroll 1.000000 0.001000 "kcps" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 0.00000000
</MacGUI>
