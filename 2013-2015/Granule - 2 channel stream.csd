<CsoundSynthesizer>
<CsOptions>
--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps =24
nchnls = 2
0dbfs = 20000
;; source samples
giSource1  ftgen 0, 0, 0, 1, "PM_timbre.wav",0,0,0 ; 


;; all windows
;giWin_Hamming	ftgen 0,0,8192, 20,1	
;giWin_Hanning     ftgen 0,0,8192, 20,2 
;giWin_Bartlett     ftgen 0,0,8192, 20,3
;giWin_Blackman3     ftgen 0,0,8192, 20,4 
;giWin_Blackman4     ftgen 0,0,8192, 20,5 
;giWin_Gauss      ftgen 0,0,8192, 20,6
;giWin_Kaiser      ftgen 0,0,8192, 20,7
;giWin_Rectangle  ftgen 0,0,8192, 20,8
;giWin_Sync    ftgen 0,0,8192, 20,9


giWin_Gauss	ftgen 5, 0, 8192, 20, 6, 1
giWin_Gauss2	ftgen 6, 0, 8192, 20, 6, .5
giWin_Blackman3     ftgen 7,0,8192, 20, 4
giWin_Exp1     ftgen 8,0,8192, 5,   .00001, 200,1, 8000, .00001
giWin_Exp2     ftgen 9,0,8192, 5,   .00001, 8000,1, 200, .00001
giWin_Exp3     ftgen 10,0,8192, 5,   .00001, 4096, 1, 4096, .00001



instr 1
iamp = 3000
ivoice = 128
iratio = 1
imode = 1
ithd = 0
ifn = giSource1
ipshift = 4

igskip = 0
igskip_os = 10
ilength = (nsamp(giSource1)/sr)


kgap invalue "kgap"            ; can be modified at control rate
igap_os = 80
kgsize invalue "kgsize"          ; can be modified at control rate
igsize_os = 60

kgap2 invalue "kgap2"
kgsize2 invalue "kgsize2"

iatt = 100
idec = 0

iseed = 1
ipitch1 = 0.5
ipitch2 = .75
ipitch3 = 1.0
ipitch4 = 1.25

ifnenv = giWin_Gauss


aSig1 granule iamp, ivoice, iratio, imode, ithd, ifn, ipshift, igskip, igskip_os, ilength, kgap, igap_os, kgsize, igsize_os, iatt, idec , iseed , ipitch1 , ipitch2 , ipitch3 , ipitch4 , ifnenv


aSig2 granule iamp, ivoice, iratio, imode, ithd, ifn, ipshift, igskip, igskip_os, ilength, kgap, igap_os, kgsize, igsize_os, iatt, idec , iseed * .927364 , ipitch1 , ipitch2 , ipitch3 , ipitch4 , ifnenv


aEnv adsr .01, 0, 1, .01 

outs aSig1 * aEnv, aSig2 * aEnv
endin



</CsInstruments>
<CsScore>
f 0 1
s
i1 0 1800


</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1410</x>
 <y>72</y>
 <width>508</width>
 <height>626</height>
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
  <value>0.08008400</value>
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
  <maximum>0.50000000</maximum>
  <value>0.08008400</value>
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
  <value>0.00061000</value>
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
  <maximum>0.50000000</maximum>
  <value>0.00061000</value>
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
  <value>0.14009300</value>
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
  <value>0.14009300</value>
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
  <value>0.20009000</value>
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
  <value>0.20009000</value>
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
WindowBounds: 1410 72 508 626
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioText {23, 325} {279, 289} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {56576, 65280, 65280} nobackground noborder 
ioText {25, 25} {279, 289} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {52992, 65280, 55040} nobackground noborder 
ioText {45, 97} {105, 45} scroll 0.080084 0.000100 "kgap" left "Arial" 25 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {146, 23} {162, 143} 0.500000 0.000100 0.010000 0.080084 kgap
ioText {41, 223} {105, 45} scroll 0.000610 0.000010 "kgsize" left "Arial" 25 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {151, 165} {154, 149} 0.500000 0.000100 0.010000 0.000610 kgsize
ioText {45, 73} {80, 24} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder gap size
ioText {42, 191} {80, 24} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder grain size
ioText {30, 34} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder Sig 1 
ioText {48, 400} {105, 45} scroll 0.140093 0.000100 "kgap2" left "Arial" 25 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {166, 339} {126, 119} 2.000000 0.000100 0.010000 0.140093 kgap2
ioText {44, 526} {105, 45} scroll 0.200090 0.000010 "kgsize2" left "Arial" 25 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {170, 482} {118, 122} 2.000000 0.000100 0.010000 0.200090 kgsize2
ioText {50, 368} {80, 24} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder gap size
ioText {47, 486} {80, 24} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder grain size
ioText {31, 330} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder Sig 2 
</MacGUI>
