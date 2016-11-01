<CsoundSynthesizer>
<CsOptions>
;--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps =24
nchnls = 2
0dbfs = 20000
;; source samples
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


giSource80 ftgen 80, 0, 0, 1, "D1-2.wav", 0, 0, 0
giSource81 ftgen 81, 0, 0, 1, "D2-1.wav", 0, 0, 0

;; all windows
giWin_Hanning     	ftgen 82,0,8192, 20,2 
giWin_Bartlett    	ftgen 83,0,8192, 20,3
giWin_Blackman4     ftgen 84,0,8192, 20,5 
giWin_Gauss      	ftgen 85,0,8192, 20,6
giWin_EXP1      	ftgen 86,0,128, 5,   1, 128, .00001
giWin_EXP2      	ftgen 87,0,128, 5,   .00001, 128, 1
giWin_EXP3      	ftgen 88,0,128, 5,   1, 28, .00001, 100, .00001
giWin_EXP4      	ftgen 89,0,128, 5,   .00001, 100, .00001, 28, 1


instr 1
iamp = 7000
ivoice = 15
iratio random .5, 1.5
imode = 0
ithd = 0
ifn = giSource81
ipshift = 4

igskip = 0
igskip_os = 0.005
ilength = (nsamp(giSource81)/sr)


kgap invalue "kgap"            ; can be modified at control rate
igap_os = 100
kgsize invalue "kgsize"          ; can be modified at control rate
igsize_os = 100

kgap2 invalue "kgap2"
kgsize2 invalue "kgsize2"

iatt = 100
idec = 0

iseed = 1
ipitch1 random 0,1
ipitch2 random .5,1.5
ipitch3 random .8, 1.7
ipitch4 random 1,2

ifnenv = giWin_EXP1


aSig1 granule iamp, ivoice, iratio, imode, ithd, ifn, ipshift, igskip, igskip_os, ilength, kgap, igap_os, kgsize, igsize_os, iatt, idec , iseed , ipitch1 , ipitch2 , ipitch3 , ipitch4 , ifnenv


aSig2 granule iamp, ivoice, iratio, imode, ithd, ifn, ipshift, igskip, igskip_os, ilength, kgap, igap_os, kgsize, igsize_os, iatt, idec , iseed * .927364 , ipitch1 , ipitch2 , ipitch3 , ipitch4 , ifnenv


aEnv adsr .01, 0, 1, .01 

outs aSig1 * aEnv, aSig2 * aEnv
endin



</CsInstruments>
<CsScore>
f 0 1
s
i1 0 1500


</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1436</x>
 <y>72</y>
 <width>482</width>
 <height>698</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>23</x>
  <y>325</y>
  <width>279</width>
  <height>289</height>
  <uuid>{e0b6ac9c-5dcb-4ec0-9c33-76c1c10f8f53}</uuid>
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
   <r>221</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>25</x>
  <y>25</y>
  <width>279</width>
  <height>289</height>
  <uuid>{9c1aa9be-9303-427b-b912-2932488f1f0e}</uuid>
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
   <r>207</r>
   <g>255</g>
   <b>215</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kgap</objectName>
  <x>45</x>
  <y>97</y>
  <width>105</width>
  <height>45</height>
  <uuid>{50c1bf18-55b6-4187-9f8a-123d6058e147}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>25</fontsize>
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
  <value>0.08901100</value>
  <resolution>0.00010000</resolution>
  <minimum>0.00010000</minimum>
  <maximum>2.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kgap</objectName>
  <x>146</x>
  <y>23</y>
  <width>162</width>
  <height>143</height>
  <uuid>{cd2b3b5e-5d2d-40fd-837d-b648fa4adcae}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00010000</minimum>
  <maximum>0.10000000</maximum>
  <value>0.08901100</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kgsize</objectName>
  <x>41</x>
  <y>223</y>
  <width>105</width>
  <height>45</height>
  <uuid>{f8b44049-8014-4f9f-a253-03a74ec303ea}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>25</fontsize>
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
  <value>0.09306900</value>
  <resolution>0.00001000</resolution>
  <minimum>0.00010000</minimum>
  <maximum>2.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kgsize</objectName>
  <x>151</x>
  <y>165</y>
  <width>154</width>
  <height>149</height>
  <uuid>{2a6be30e-0ae1-4605-badc-cf5a2e906296}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00010000</minimum>
  <maximum>0.30000000</maximum>
  <value>0.09306900</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>45</x>
  <y>73</y>
  <width>80</width>
  <height>24</height>
  <uuid>{a3769d45-2c61-4b43-b0a6-f61744e1b253}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>gap size</label>
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
  <x>42</x>
  <y>191</y>
  <width>80</width>
  <height>24</height>
  <uuid>{742cd3e4-3672-44ea-8d89-3f7212371a61}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>grain size</label>
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
  <x>30</x>
  <y>34</y>
  <width>80</width>
  <height>25</height>
  <uuid>{dd3c4efe-35d6-4512-9484-3150f9884ab6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Sig 1 </label>
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
  <objectName>kgap2</objectName>
  <x>48</x>
  <y>400</y>
  <width>105</width>
  <height>45</height>
  <uuid>{fb8878a4-90bf-404f-a635-ff21fe09a0fe}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>25</fontsize>
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
  <value>0.02009900</value>
  <resolution>0.00010000</resolution>
  <minimum>0.00010000</minimum>
  <maximum>2.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kgap2</objectName>
  <x>166</x>
  <y>339</y>
  <width>126</width>
  <height>119</height>
  <uuid>{ef642cb3-af89-4c22-9fcf-24a4838b43a0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00010000</minimum>
  <maximum>2.00000000</maximum>
  <value>0.02009900</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kgsize2</objectName>
  <x>44</x>
  <y>526</y>
  <width>105</width>
  <height>45</height>
  <uuid>{9c299ea4-a076-4534-b0cd-c72436e4039a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>25</fontsize>
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
  <value>0.00010000</value>
  <resolution>0.00001000</resolution>
  <minimum>0.00010000</minimum>
  <maximum>2.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kgsize2</objectName>
  <x>170</x>
  <y>482</y>
  <width>118</width>
  <height>122</height>
  <uuid>{705be34d-491d-45df-8f3f-62bbf7b5d6f7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00010000</minimum>
  <maximum>2.00000000</maximum>
  <value>0.00010000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>50</x>
  <y>368</y>
  <width>80</width>
  <height>24</height>
  <uuid>{ae32c0ba-3fd6-4748-9d0a-7313f4b0328e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>gap size</label>
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
  <x>47</x>
  <y>486</y>
  <width>80</width>
  <height>24</height>
  <uuid>{efd49274-5990-48d6-a5ba-1343e7874522}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>grain size</label>
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
  <x>31</x>
  <y>330</y>
  <width>80</width>
  <height>25</height>
  <uuid>{fc0564cc-e57c-41d1-88dd-a99d3fc6cd06}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Sig 2 </label>
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
WindowBounds: 1436 72 482 698
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioText {23, 325} {279, 289} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {56576, 65280, 65280} nobackground noborder 
ioText {25, 25} {279, 289} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {52992, 65280, 55040} nobackground noborder 
ioText {45, 97} {105, 45} scroll 0.089011 0.000100 "kgap" left "Arial" 25 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {146, 23} {162, 143} 0.100000 0.000100 0.010000 0.089011 kgap
ioText {41, 223} {105, 45} scroll 0.093069 0.000010 "kgsize" left "Arial" 25 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {151, 165} {154, 149} 0.300000 0.000100 0.010000 0.093069 kgsize
ioText {45, 73} {80, 24} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder gap size
ioText {42, 191} {80, 24} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder grain size
ioText {30, 34} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder Sig 1 
ioText {48, 400} {105, 45} scroll 0.020099 0.000100 "kgap2" left "Arial" 25 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {166, 339} {126, 119} 2.000000 0.000100 0.010000 0.020099 kgap2
ioText {44, 526} {105, 45} scroll 0.000100 0.000010 "kgsize2" left "Arial" 25 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {170, 482} {118, 122} 2.000000 0.000100 0.010000 0.000100 kgsize2
ioText {50, 368} {80, 24} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder gap size
ioText {47, 486} {80, 24} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder grain size
ioText {31, 330} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder Sig 2 
</MacGUI>
