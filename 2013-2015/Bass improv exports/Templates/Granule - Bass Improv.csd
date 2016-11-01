<CsoundSynthesizer>
<CsOptions>
--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps =10
nchnls = 2
0dbfs = 20000

;giSource1 ftgen 0, 0, 8388608, 1, "low_quiet.wav", 0, 0, 0
;giSource2 ftgen 0, 0, 2097152, 1, "midrange_noise.wav", 0, 0, 0
;giSource3 ftgen 0, 0, 4194304, 1, "high_harmonics.wav", 0, 0, 0
;giSource4 ftgen 0, 0, 4194304, 1, "industrial.wav", 0, 0, 0
giSource5 ftgen 0, 0, 8388608, 1, "industrial_pizzdrums.wav", 0, 0, 0
giSource6 ftgen 0, 0, 8388608, 1, "loudarco_highdrone.wav", 0, 0, 0
giSource7 ftgen 0, 0, 8388608, 1, "midrange_noise_low_arco.wav", 0, 0, 0
giSource8 ftgen 0, 0, 8388608, 1, "midrange_quiet_ponticello.wav", 0, 0, 0
giSource9 ftgen 0, 0, 8388608, 1, "whitenoise_brushes.wav", 0, 0, 0



;; all windows
giWin_Hamming	ftgen 0,0,8192, 20,1	
giWin_Hanning     ftgen 0,0,8192, 20,2 
giWin_Bartlett     ftgen 0,0,8192, 20,3
giWin_Blackman3     ftgen 0,0,8192, 20,4 
giWin_Blackman4     ftgen 0,0,8192, 20,5 
giWin_Gauss      ftgen 0,0,8192, 20,6
giWin_Kaiser      ftgen 0,0,8192, 20,7
giWin_Rectangle  ftgen 0,0,8192, 20,8
giWin_Sync    ftgen 0,0,8192, 20,9


instr 1
iamp = ampdb(80)
ivoice = 17
iratio = .2
imode = 1
ithd = 0
ifn = giSource7
ipshift = 3

igskip = 0
igskip_os = 1
ilength = (nsamp(giSource7)/sr)


kgap invalue "kgap"            ; can be modified at control rate
igap_os = 35
kgsize invalue "kgsize"          ; can be modified at control rate
igsize_os = 10

kgap2 invalue "kgap2"
kgsize2 invalue "kgsize2"

iatt = 100
idec = 0

iseed = 0
ipitch1 = 1
ipitch2 = 1.3
ipitch3 = 2.4
ipitch4 = 3.5

ifnenv = giWin_Blackman3


aSig1 granule iamp, ivoice, iratio, imode, ithd, ifn, ipshift, igskip, igskip_os, ilength, kgap, igap_os, kgsize, igsize_os, iatt, idec , iseed , ipitch1 , ipitch2 , ipitch3 , ipitch4 , ifnenv

aSig2 granule iamp, ivoice, iratio, imode, ithd, ifn, ipshift, igskip, igskip_os, ilength, kgap, igap_os, kgsize, igsize_os, iatt, idec , iseed + 1.56375424 , ipitch1 , ipitch2 , ipitch3 , ipitch4 , ifnenv



aEnv adsr .01, 0, 1, .01 

outs aSig1 * aEnv, aSig2 * aEnv
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
 <x>1255</x>
 <y>72</y>
 <width>518</width>
 <height>682</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kgap</objectName>
  <x>9</x>
  <y>10</y>
  <width>329</width>
  <height>254</height>
  <uuid>{358608f3-bcdc-46ca-ade1-0f2fb15cf4f9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00010000</minimum>
  <maximum>2.00000000</maximum>
  <value>0.00240000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kgsize</objectName>
  <x>12</x>
  <y>269</y>
  <width>327</width>
  <height>274</height>
  <uuid>{6da0c722-f503-455e-8860-0e3762dfe72a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00010000</minimum>
  <maximum>2.00000000</maximum>
  <value>0.05931700</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>344</x>
  <y>237</y>
  <width>80</width>
  <height>25</height>
  <uuid>{c6d862ea-6514-4af1-9b32-63a72bcc8504}</uuid>
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
  <x>348</x>
  <y>495</y>
  <width>80</width>
  <height>25</height>
  <uuid>{b432779c-4f8d-462a-b9de-21ab225b58f1}</uuid>
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
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kgap</objectName>
  <x>343</x>
  <y>180</y>
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
  <value>0.00240000</value>
  <resolution>0.00010000</resolution>
  <minimum>0.00010000</minimum>
  <maximum>2.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kgsize</objectName>
  <x>341</x>
  <y>446</y>
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
  <value>0.05931700</value>
  <resolution>0.00001000</resolution>
  <minimum>0.00010000</minimum>
  <maximum>2.00000000</maximum>
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
WindowBounds: 1255 72 518 682
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioKnob {9, 10} {329, 254} 2.000000 0.000100 0.010000 0.002400 kgap
ioKnob {12, 269} {327, 274} 2.000000 0.000100 0.010000 0.059317 kgsize
ioText {218, 149} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder gap size
ioText {226, 373} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder grain size
ioText {343, 180} {105, 45} scroll 0.002400 0.000100 "kgap" left "Arial" 25 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {341, 446} {105, 45} scroll 0.059317 0.000010 "kgsize" left "Arial" 25 {0, 0, 0} {65280, 65280, 65280} background noborder 1.56002200
</MacGUI>
