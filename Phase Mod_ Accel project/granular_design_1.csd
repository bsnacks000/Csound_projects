<CsoundSynthesizer>
<CsOptions>
--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps =64
nchnls = 1
0dbfs = 20000

giSine ftgen 0, 0, 8192, 10, 1, 1 , 0, 1 ,1, 1,0, 1, 0 

giWin ftgen 0,0,4096, 20, 6, 1

instr 1

kGrain_rate invalue "Grain_rate"
kGrain_dur  invalue "Grain_dur"
kGrain_freq invalue "Grain_freq"
kGrain_amp randomi 500, 10000, 15 

kTrigger metro kGrain_rate

konset = 0

schedkwhen kTrigger, 0, 0, 2, konset, kGrain_dur, kGrain_freq, kGrain_amp

endin


instr 2

idur = p3
kcps = p4
kamp = p5 

aEnv_osc poscil kamp, 1/idur, giWin

aSig poscil aEnv_osc, kcps, giSine 

aLFO poscil 1, .5, giSine

out aSig  

endin

</CsInstruments>
<CsScore>

i1 0 300

</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1294</x>
 <y>72</y>
 <width>375</width>
 <height>641</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBKnob">
  <objectName>Grain_rate</objectName>
  <x>9</x>
  <y>133</y>
  <width>157</width>
  <height>156</height>
  <uuid>{b6be6b8c-c421-4591-9097-fe3fcb270e34}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>100.00000000</maximum>
  <value>6.94000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>Grain_dur</objectName>
  <x>8</x>
  <y>294</y>
  <width>108</width>
  <height>117</height>
  <uuid>{28ef2822-059d-4a83-9fa1-bd5cb7f131ee}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00100000</minimum>
  <maximum>0.10000000</maximum>
  <value>0.01486000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>Grain_freq</objectName>
  <x>121</x>
  <y>294</y>
  <width>109</width>
  <height>114</height>
  <uuid>{1510834a-0323-4629-8bc8-1fe85fae2476}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>100.00000000</minimum>
  <maximum>800.00000000</maximum>
  <value>212.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScope">
  <objectName/>
  <x>25</x>
  <y>491</y>
  <width>350</width>
  <height>150</height>
  <uuid>{e8f946ea-4457-464b-a42a-5228733dc835}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <value>-255.00000000</value>
  <type>scope</type>
  <zoomx>2.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <mode>0.00000000</mode>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>Grain_dur</objectName>
  <x>30</x>
  <y>420</y>
  <width>80</width>
  <height>25</height>
  <uuid>{613fd6dc-3551-491a-8ed6-ee19dd90ee03}</uuid>
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
  <value>0.01486000</value>
  <resolution>0.00010000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act="continuous"/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>Grain_freq</objectName>
  <x>135</x>
  <y>419</y>
  <width>80</width>
  <height>25</height>
  <uuid>{9bb41746-366a-4463-9871-d1bbb75a9d58}</uuid>
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
  <value>212.00000000</value>
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
WindowBounds: 1294 72 624 698
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioKnob {9, 133} {157, 156} 100.000000 1.000000 0.010000 6.940000 Grain_rate
ioKnob {8, 294} {108, 117} 0.100000 0.001000 0.010000 0.014860 Grain_dur
ioKnob {121, 294} {109, 114} 800.000000 100.000000 0.010000 212.000000 Grain_freq
ioGraph {25, 491} {350, 150} scope 2.000000 -255 
ioText {30, 420} {80, 25} scroll 0.014860 0.000100 "Grain_dur" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 0.00500000
ioText {135, 419} {80, 25} scroll 212.000000 0.001000 "Grain_freq" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 0.00000000
</MacGUI>
