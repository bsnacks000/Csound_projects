<CsoundSynthesizer>
<CsOptions>
;--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 128
nchnls = 2
0dbfs = 20000

giSource1 ftgen 0, 0, 0, 1, "dog_mono_15sec.wav", 0, 0, 0
giSource2 ftgen 0, 0, 0, 1, "espasmo_mono_15sec.wav", 0, 0, 0
giSource3 ftgen 0, 0, 0, 1, "qif_mono_10sec.wav", 0, 0, 0

giWin_Gauss ftgen 0, 0, 8192, 20, 6


instr 1

;-------------manual----------;
kamp invalue "kamp"
ktimewarp invalue "ktimewarp"
kresample invalue "kresample"

idur = p3

kcps invalue "kcps"

;-----------automated---------
;ktimewarp randomi 0, 10, kcps 
;kresample randomi 0.2, 1.2, kcps

ifn1 = giSource3
ibeg = 0
iwsize = 410
irandw = iwsize * .05
ioverlap = 100
ifn2 = giWin_Gauss
itimemode = 0

kamp = ampdbfs(kamp)

aSig, aComp sndwarp kamp, ktimewarp, kresample, ifn1, ibeg, iwsize, irandw, ioverlap, ifn2, itimemode


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
 <x>1408</x>
 <y>72</y>
 <width>481</width>
 <height>457</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>kamp</objectName>
  <x>20</x>
  <y>128</y>
  <width>36</width>
  <height>179</height>
  <uuid>{c2f3c328-8eae-4bc6-993c-4b90a0165991}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>-70.00000000</minimum>
  <maximum>0.00000000</maximum>
  <value>-12.12290503</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>ktimewarp</objectName>
  <x>105</x>
  <y>51</y>
  <width>179</width>
  <height>165</height>
  <uuid>{ecf5b18b-0931-4abd-9297-cf990a2bbeaa}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.01000000</minimum>
  <maximum>15.00000000</maximum>
  <value>13.65090000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kresample</objectName>
  <x>106</x>
  <y>261</y>
  <width>179</width>
  <height>165</height>
  <uuid>{92caccb0-254c-4284-addc-398b288910e0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.01000000</minimum>
  <maximum>3.00000000</maximum>
  <value>0.63790000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>15</x>
  <y>88</y>
  <width>71</width>
  <height>29</height>
  <uuid>{7671070d-4414-4026-82b6-a65591727aa5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Amp (db) </label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
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
  <x>105</x>
  <y>20</y>
  <width>71</width>
  <height>29</height>
  <uuid>{425d9506-0f51-4677-9c11-12ad33744e92}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>timewarp  </label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
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
  <x>104</x>
  <y>230</y>
  <width>71</width>
  <height>29</height>
  <uuid>{aecff43d-98ba-466e-b105-647b05776415}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>resample</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
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
  <objectName>kamp</objectName>
  <x>12</x>
  <y>318</y>
  <width>80</width>
  <height>25</height>
  <uuid>{4aa391d2-5010-411a-b6b1-c09be182bd60}</uuid>
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
  <value>-12.12290503</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act="continuous"/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>ktimewarp</objectName>
  <x>212</x>
  <y>217</y>
  <width>80</width>
  <height>25</height>
  <uuid>{607b8591-51cb-494a-8e3e-09e53dc7e3b7}</uuid>
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
  <value>13.65090000</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act="continuous"/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kresample</objectName>
  <x>213</x>
  <y>432</y>
  <width>80</width>
  <height>25</height>
  <uuid>{22ea250d-9b9b-46aa-9630-e2668c695d28}</uuid>
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
  <value>0.63790000</value>
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
  <objectName>kcps</objectName>
  <x>300</x>
  <y>148</y>
  <width>181</width>
  <height>162</height>
  <uuid>{cac9e35f-9c98-4da1-ad82-98c62c2e428b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.50000000</maximum>
  <value>0.60000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>349</x>
  <y>120</y>
  <width>106</width>
  <height>25</height>
  <uuid>{ec57e1ae-7c50-4a2d-8dc4-6033e8f3a4dd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>RANDOMi KCPS</label>
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
<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioSlider {20, 128} {36, 179} -70.000000 0.000000 -12.122905 kamp
ioKnob {105, 51} {179, 165} 15.000000 0.010000 0.010000 13.650900 ktimewarp
ioKnob {106, 261} {179, 165} 3.000000 0.010000 0.010000 0.637900 kresample
ioText {21, 95} {53, 21} label 0.000000 0.00100 "" left "Arial" 14 {0, 0, 0} {61440, 61440, 61440} nobackground noborder Amp (db) 
ioText {105, 20} {71, 29} label 0.000000 0.00100 "" left "Arial" 14 {0, 0, 0} {61440, 61440, 61440} nobackground noborder timewarp  
ioText {106, 228} {71, 29} label 0.000000 0.00100 "" left "Arial" 14 {0, 0, 0} {61440, 61440, 61440} nobackground noborder resample
ioText {12, 318} {80, 25} scroll -12.122905 0.001000 "kamp" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 0.00000000
ioText {212, 217} {80, 25} scroll 13.650900 0.001000 "ktimewarp" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 0.00000000
ioText {213, 432} {80, 25} scroll 0.637900 0.001000 "kresample" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 0.00000000
ioKnob {300, 148} {181, 162} 1.500000 0.000000 0.010000 0.600000 kcps
ioText {372, 98} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder RANDOMi KCPS
</MacGUI>
