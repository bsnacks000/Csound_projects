<CsoundSynthesizer>
<CsOptions>
--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps =10
nchnls = 2
0dbfs = 20000

giSource1 ftgen 0, 0, 0, 1, "DrumBassB2.wav", 0, 0, 0
giSource2 ftgen 0, 0, 0, 1, "DrumBassCoda1.wav", 0, 0, 0
giSource3 ftgen 0, 0, 0, 1, "DrumBassCoda2.wav", 0, 0, 0
giSource4 ftgen 0, 0, 0, 1, "DrumBassA.wav", 0, 0, 0
giSource5 ftgen 0, 0, 0, 1, "BassOnlyA.wav", 0, 0, 0
giSource6 ftgen 0, 0, 0, 1, "BassAcut.wav", 0, 0, 0


instr 1

iamp = 15000
;kcps invalue "kcps"
ifn = giSource3

aSig loscil iamp, 1.1, ifn, 1, 1 
	aEnv adsr .01,0,1,.1

	outs aSig *aEnv, aSig * aEnv
endin

instr 2 ;; random sample and hold

iamp = 40000
kcps randh .15, 5,.5,0,1
ifn = giSource2

aSig loscil iamp, kcps, ifn, 1,1
	aEnv adsr .01,0,1,.1

	outs aSig *aEnv, aSig * aEnv
endin






</CsInstruments>
<CsScore>

f 0 1
s

i1 0 60

</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1182</x>
 <y>72</y>
 <width>543</width>
 <height>682</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kcps</objectName>
  <x>26</x>
  <y>57</y>
  <width>186</width>
  <height>230</height>
  <uuid>{916914c0-0e11-439c-aa1f-b3b03883078b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>25.00000000</maximum>
  <value>0.81800000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kcps</objectName>
  <x>133</x>
  <y>387</y>
  <width>80</width>
  <height>25</height>
  <uuid>{758b386d-2918-4ac1-ab9a-0f5bc1230505}</uuid>
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
  <value>0.81800000</value>
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
WindowBounds: 1182 72 543 682
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioKnob {26, 57} {186, 230} 25.000000 0.000000 0.010000 0.818000 kcps
ioText {133, 387} {80, 25} scroll 0.818000 0.001000 "kcps" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
</MacGUI>
