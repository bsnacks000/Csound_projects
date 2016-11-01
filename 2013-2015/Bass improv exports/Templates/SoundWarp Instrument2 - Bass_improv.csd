<CsoundSynthesizer>
<CsOptions>
--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps =10
nchnls = 1  ; mono output
0dbfs = 20000


giSource1 ftgen 0, 0, 8388608, 1, "low_quiet.wav", 0, 0, 0
giSource2 ftgen 0, 0, 2097152, 1, "midrange_noise.wav", 0, 0, 0
giSource3 ftgen 0, 0, 4194304, 1, "high_harmonics.wav", 0, 0, 0
giSource4 ftgen 0, 0, 4194304, 1, "industrial.wav", 0, 0, 0
giSource5 ftgen 0, 0, 8388608, 1, "industrial_pizzdrums.wav", 0, 0, 0
giSource6 ftgen 0, 0, 8388608, 1, "loudarco_highdrone.wav", 0, 0, 0
giSource7 ftgen 0, 0, 8388608, 1, "midrange_noise_low_arco.wav", 0, 0, 0
giSource8 ftgen 0, 0, 8388608, 1, "midrange_quiet_ponticello.wav", 0, 0, 0
giSource9 ftgen 0, 0, 8388608, 1, "whitenoise_brushes.wav", 0, 0, 0



giWin_Gauss ftgen 0,0,8192, 20,6

instr 1; test instrument with krate amp/time warp/kresample

; notes on Resolution:::::
;; iwsize, irandw, ioverlap function differently at different resolutions:

;; while wsize > 7000 & ioverlap &irandw close to 0: sound is rich/pulsing. increasing ioverlap to around 20 results in rich pulsing tones that get higher as ioverlap is increased. increasing irandw smooths sound and increases artifact noise.    

;; as wsize decreases results are similar to FM synthesis while irand and ioverlap are low. As they increase, sound smooths out and becomes noiser.
;;wsizes below 500 with high overlaps produce smooth but synthetic sounding textures

;; the relationship to the timestretch and resample is also important 

;; higher the window size less you can move resample rate



kamp invalue "kamp"
ktimewarp invalue "ktimewarp"
kresample invalue "kresample"

;kresample linseg 1,p3/3,4,p3/3,1,p3/3,7

ifn1 = giSource4
ibeg = 0
iwsize = 100
irandw = 3
ioverlap = 200
ifn2 = giWin_Gauss
itimemode = 0

aSig, aComp sndwarp kamp, ktimewarp, kresample, ifn1, ibeg, iwsize, irandw, ioverlap, ifn2, itimemode
	aBal balance aSig, aComp
	aEnv adsr 3, 0, 1, 3

out aBal * aEnv
endin




</CsInstruments>
<CsScore>

f 0 1
s

i1 0 120


</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1517</x>
 <y>72</y>
 <width>401</width>
 <height>698</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>display8</objectName>
  <x>5</x>
  <y>50</y>
  <width>313</width>
  <height>604</height>
  <uuid>{897d253d-9498-4c4a-a4b3-39e382b38f42}</uuid>
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
   <r>172</r>
   <g>239</g>
   <b>240</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>ktimewarp</objectName>
  <x>16</x>
  <y>255</y>
  <width>177</width>
  <height>187</height>
  <uuid>{661e5d61-341b-42b1-9792-cc85a5844a19}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.50000000</minimum>
  <maximum>50.00000000</maximum>
  <value>1.49000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>ktimewarp</objectName>
  <x>204</x>
  <y>363</y>
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
  <value>1.49000000</value>
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
  <x>16</x>
  <y>459</y>
  <width>176</width>
  <height>190</height>
  <uuid>{75aead05-83e3-431d-b14c-19d420b8de6a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.01000000</minimum>
  <maximum>3.00000000</maximum>
  <value>0.57810000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kresample</objectName>
  <x>204</x>
  <y>575</y>
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
  <value>0.57810000</value>
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
  <objectName>kamp</objectName>
  <x>20</x>
  <y>67</y>
  <width>166</width>
  <height>173</height>
  <uuid>{242559fe-11ae-4b63-ad25-01e7783a0885}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>20000.00000000</maximum>
  <value>12400.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>202</x>
  <y>120</y>
  <width>80</width>
  <height>25</height>
  <uuid>{8d7a35bd-64c6-42e3-b2de-5a1cf1e597b1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>amplitude</label>
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
  <x>205</x>
  <y>314</y>
  <width>80</width>
  <height>25</height>
  <uuid>{53e32e98-b963-4329-b243-072292482bcd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>time_warp</label>
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
  <x>202</x>
  <y>532</y>
  <width>73</width>
  <height>24</height>
  <uuid>{46e3d042-b077-48ff-a9de-4ea55c85f985}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>kresample</label>
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
WindowBounds: 1517 72 401 698
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioText {5, 50} {313, 604} display 0.000000 0.00100 "display8" left "Arial" 10 {0, 0, 0} {44032, 61184, 61440} nobackground noborder 
ioKnob {16, 255} {177, 187} 50.000000 0.500000 0.010000 1.490000 ktimewarp
ioText {204, 363} {80, 25} scroll 1.490000 0.001000 "ktimewarp" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {16, 459} {176, 190} 3.000000 0.010000 0.010000 0.578100 kresample
ioText {204, 575} {80, 25} scroll 0.578100 0.001000 "kresample" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {20, 67} {166, 173} 20000.000000 0.000000 0.010000 12400.000000 kamp
ioText {202, 120} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder amplitude
ioText {205, 314} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder time_warp
ioText {202, 532} {73, 24} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder kresample
</MacGUI>
