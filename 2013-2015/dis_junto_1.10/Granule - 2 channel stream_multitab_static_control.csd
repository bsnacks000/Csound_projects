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
giSource1  ftgen 0, 0, 0, 1, "speak1420909863245.wav",0,0,0 ; 


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
ivoice = 8
iratio = 1
imode = 1
ithd = 0

ifn1 = giSource1
ifn2 = giSource1

ipshift = 3

igskip = 0
igskip_os = 2
ilength1 = (nsamp(ifn1)/sr)
ilength2 = (nsamp(ifn2)/sr)



kgsize linseg 	1.25,	p3/4, 0.5,	p3/4,  3,	p3/4, 7,	p3/4, 9
kgap linseg 	0.6,	p3/4, 0.6,	p3/4,  1,	p3/4, 2,	p3/4, 2.5       

igap_os = 70
igsize_os = 70


iatt = 100
idec = 0

iseed = .1
ipitch1 = .5
ipitch2 = .6
ipitch3 = .7
ipitch4 = 1

ifnenv1 = giWin_Gauss
ifnenv2 = giWin_Gauss

aSig1 granule iamp, ivoice, iratio, imode, ithd, ifn1, ipshift, igskip, igskip_os, ilength1, kgap, igap_os, kgsize, igsize_os, iatt, idec , iseed , ipitch1 , ipitch2 , ipitch3 , ipitch4 , ifnenv1


aSig2 granule iamp, ivoice, iratio, imode, ithd, ifn2, ipshift, igskip, igskip_os, ilength2, kgap, igap_os, kgsize, igsize_os, iatt, idec , iseed * .927364 , ipitch1 , ipitch2 , ipitch3 , ipitch4 , ifnenv2


aEnv adsr .01, 0, 1, .01 

outs (aSig1) * aEnv, (aSig2) * aEnv
endin



</CsInstruments>
<CsScore>
f 0 1
s
i1 0 20


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
  <value>0.00010000</value>
  <resolution>0.00010000</resolution>
  <minimum>0.00010000</minimum>
  <maximum>2.50000000</maximum>
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
  <maximum>2.50000000</maximum>
  <value>0.00010000</value>
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
  <value>0.00010000</value>
  <resolution>0.00001000</resolution>
  <minimum>0.00010000</minimum>
  <maximum>9.00000000</maximum>
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
  <maximum>9.00000000</maximum>
  <value>0.00010000</value>
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
  <value>0.00010000</value>
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
  <maximum>1.00000000</maximum>
  <value>0.00010000</value>
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
  <maximum>1.00000000</maximum>
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
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>klink</objectName>
  <x>313</x>
  <y>30</y>
  <width>30</width>
  <height>30</height>
  <uuid>{7fb2d092-9f5f-4875-b58a-e92a7eea3c4d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <selected>true</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>311</x>
  <y>10</y>
  <width>80</width>
  <height>25</height>
  <uuid>{4e8099ea-9055-42c3-8811-d66c43bd6f30}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Sync to master</label>
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
WindowBounds: 1390 72 528 698
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioText {23, 325} {279, 289} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {56576, 65280, 65280} nobackground noborder 
ioText {25, 25} {279, 289} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {52992, 65280, 55040} nobackground noborder 
ioText {45, 97} {105, 45} scroll 0.000100 0.000100 "kgap" left "Arial" 25 {0, 0, 0} {65280, 65280, 65280} background noborder 0.00010000
ioKnob {146, 23} {162, 143} 2.500000 0.000100 0.010000 0.000100 kgap
ioText {41, 223} {105, 45} scroll 0.000100 0.000010 "kgsize" left "Arial" 25 {0, 0, 0} {65280, 65280, 65280} background noborder 0.09009900
ioKnob {151, 165} {154, 149} 9.000000 0.000100 0.010000 0.000100 kgsize
ioText {45, 73} {80, 24} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder gap size
ioText {42, 191} {80, 24} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder grain size
ioText {30, 34} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder Sig 1 
ioText {48, 400} {105, 45} scroll 0.000100 0.000100 "kgap2" left "Arial" 25 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {166, 339} {126, 119} 1.000000 0.000100 0.010000 0.000100 kgap2
ioText {44, 526} {105, 45} scroll 0.000100 0.000010 "kgsize2" left "Arial" 25 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {170, 482} {118, 122} 1.000000 0.000100 0.010000 0.000100 kgsize2
ioText {50, 368} {80, 24} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder gap size
ioText {47, 486} {80, 24} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder grain size
ioText {31, 330} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder Sig 2 
ioCheckbox {313, 30} {30, 30} on klink
ioText {311, 10} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder Sync to master
</MacGUI>
