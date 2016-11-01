<CsoundSynthesizer>
<CsOptions>
;--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 10
nchnls = 2
0dbfs = 1


giSample1 ftgen 0, 0, 0, 1, "1_high_res_highfreq.wav",0,0,0
giSample2 ftgen 0, 0, 0, 1, "2_low_res_midfreqpulse2.wav",0,0,0

giWin_Hanning     	ftgen 0,0,8192, 20,2 
giWin_Bartlett    	ftgen 0,0,8192, 20,3
giWin_Blackman4     ftgen 0,0,8192, 20,5 
giWin_Gauss      	ftgen 0,0,8192, 20,6, 1
giWin_EXP1      	ftgen 0,0,128, 5,   1, 128, .00001
giWin_EXP2      	ftgen 0,0,128, 5,   .00001, 128, 1

instr 1


Sfile_name = "1_high_res_highfreq.wav" 
kpitch = 1
iskiptime random 0, 10
iwrap = 1


aSig diskin2 Sfile_name, kpitch, iskiptime, iwrap

outs aSig * 5, aSig * 5

endin


instr 2
;S_filename = "1_high_res_highfreq.wav"
kamp  = 1
kfreq invalue "kfreq"
kpitch invalue "kpitch"
kgrsize invalue "kgrsize" 
kprate invalue "kprate"

ifn1 = giSample2
ifn2 = giWin_Gauss
iolaps = 1000


aSig syncgrain kamp, kfreq, kpitch, kgrsize, kprate, ifn1, ifn2, iolaps
;aSig diskgrain S_filename, kamp, kfreq, kpitch, kgrsize, kprate,  ifn, iolaps 
outs aSig, aSig 
endin


</CsInstruments>
<CsScore>

i2 0 500

</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1085</x>
 <y>72</y>
 <width>482</width>
 <height>717</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kamp</objectName>
  <x>33</x>
  <y>106</y>
  <width>105</width>
  <height>106</height>
  <uuid>{9ebd302d-4655-46cf-bbe3-8c82416e37e7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>2.00000000</maximum>
  <value>1.05000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kfreq</objectName>
  <x>34</x>
  <y>213</y>
  <width>105</width>
  <height>106</height>
  <uuid>{d6193204-3ece-4089-8ce6-f51aaa239cd7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>100.00000000</maximum>
  <value>22.78000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>140</x>
  <y>183</y>
  <width>80</width>
  <height>25</height>
  <uuid>{5cb1baa1-9b05-40d8-9ff0-846238cb6aac}</uuid>
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
  <x>140</x>
  <y>287</y>
  <width>80</width>
  <height>25</height>
  <uuid>{8d0a62f0-b30f-4c4c-89a5-bfc74e8cc467}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>kfreq</label>
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
  <objectName>kgrsize</objectName>
  <x>3</x>
  <y>365</y>
  <width>83</width>
  <height>30</height>
  <uuid>{5bdf0017-3db6-426a-aed7-bed1859637b4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>13</fontsize>
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
  <value>0.52240000</value>
  <resolution>0.00010000</resolution>
  <minimum>0.00010000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>33</x>
  <y>342</y>
  <width>80</width>
  <height>25</height>
  <uuid>{6d9b9735-0cd3-4b0b-912c-c1ae7a1a8fa4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>kgrsize</label>
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
  <objectName>kprate</objectName>
  <x>35</x>
  <y>421</y>
  <width>83</width>
  <height>36</height>
  <uuid>{ccd2d8f3-f19a-44bc-83f0-75c6b5414162}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>13</fontsize>
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
  <resolution>1.00000000</resolution>
  <minimum>-50.00000000</minimum>
  <maximum>50.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>35</x>
  <y>395</y>
  <width>80</width>
  <height>25</height>
  <uuid>{a69cecbb-8445-4798-8dcd-f0a192c47036}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>kprate</label>
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
  <objectName>kpitch</objectName>
  <x>100</x>
  <y>377</y>
  <width>80</width>
  <height>25</height>
  <uuid>{1ec0db1c-4719-462d-b638-c40e4dc5a48f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>13</fontsize>
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
  <minimum>-10.00000000</minimum>
  <maximum>10.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>116</x>
  <y>346</y>
  <width>80</width>
  <height>25</height>
  <uuid>{f87f7b66-8035-43eb-8c7d-c02284c53f75}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>kpitch</label>
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
WindowBounds: 1085 72 482 717
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioKnob {33, 106} {105, 106} 2.000000 1.000000 0.010000 1.050000 kamp
ioKnob {34, 213} {105, 106} 100.000000 1.000000 0.010000 22.780000 kfreq
ioText {140, 183} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder kamp
ioText {140, 287} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder kfreq
ioText {3, 365} {83, 30} scroll 0.522400 0.000100 "kgrsize" left "Arial" 13 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {33, 342} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder kgrsize
ioText {35, 421} {83, 36} scroll 1.000000 1.000000 "kprate" left "Arial" 13 {0, 0, 0} {65280, 65280, 65280} background noborder 10.00000000
ioText {35, 395} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder kprate
ioText {100, 377} {80, 25} scroll 1.000000 0.001000 "kpitch" left "Arial" 13 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {116, 346} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder kpitch
</MacGUI>
