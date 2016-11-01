<CsoundSynthesizer>
<CsOptions>
--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps =128
nchnls = 1
0dbfs = 20000

;- duration histogram - 8th notes 3 sec - .25

;gk_dur_3 invalue "dur_3"
;gk_dur_275 invalue "dur_275"
;gk_dur_25 invalue "dur_25"
;gk_dur_225 invalue "dur_225"
;gk_dur_2 invalue "dur_2"
;gk_dur_175 invalue "dur_175"
;gk_dur_15 invalue "dur_15"
;gk_dur_125 invalue "dur_125"
;gk_dur_1 invalue "dur_1"
;gk_dur_075 invalue "dur_075"
;gk_dur_05 invalue "dur_05"
;gk_dur_025 invalue "dur_025"


gi_dur_HIST_8th ftgen 1, 0, -20, -41,	3,0,  	2.75,0,  	2.5,0,	  	2.25,0, 	2,0,	1.75,0,		1.5,0,		1.25,0,		1,.4,	.75,.6,	  .5,0,	.25,0

gi_dur_HIST_16th  ftgen 2, 0, -20, -41, 	1,0,   1.875,0,   1.75,0,  1.625,0, 		1.5,0,  		1.375,0	,	1.25,0,		1.125,0	,	1,0	,	.875,0,		.75,0,		.625,0,		.5,0,		.375,0,		.25,0,		.125,		 



instr 1		;-- global histogram (always on)

	gk_dur_1 duserrnd gi_dur_HIST_8th
	gk_dur_3 duserrnd gi_dur_HIST_8th
endin

instr 2		;-- global histogram (always on)

	gk_dur_2 duserrnd gi_dur_HIST_16th
	gk_dur_4 duserrnd gi_dur_HIST_16th
endin



instr 101 	; moscil midi output - lower voice
	
	ichn = 1
	kvel = 60
	kdur = gk_dur_1
	
	
	kmin invalue "kmin_1"
	kmax invalue "kmax_1"
	kcps invalue "kcps_1"
	
	knum randomh kmin, kmax, kcps ,3

	moscil ichn, int(knum), kvel, kdur, 0

endin

instr 102 	; moscil midi output - upper voice
	
	ichn = 1
	kvel = 60
	kdur = gk_dur_1
	
	
	kmin invalue "kmin_2"
	kmax invalue "kmax_2"
	kcps invalue "kcps_2"
	
	knum randomh kmin, kmax, kcps ,3

	moscil ichn, int(knum), kvel, kdur, 0

endin


</CsInstruments>
<CsScore>

i1 0 180
i2 0 180

i101 0 180
i102 0 180


</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1515</x>
 <y>72</y>
 <width>209</width>
 <height>609</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>kmax_1</objectName>
  <x>67</x>
  <y>108</y>
  <width>41</width>
  <height>26</height>
  <uuid>{5703fb50-e2d1-4fbc-8040-a665b5f387ec}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>19</fontsize>
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
  <resolution>1.00000000</resolution>
  <minimum>-1e+12</minimum>
  <maximum>1e+12</maximum>
  <randomizable group="0">false</randomizable>
  <value>73</value>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>kmax_2</objectName>
  <x>67</x>
  <y>262</y>
  <width>41</width>
  <height>26</height>
  <uuid>{35cc514c-ded1-4a25-aa20-907d9c233a86}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>19</fontsize>
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
  <resolution>1.00000000</resolution>
  <minimum>-1e+12</minimum>
  <maximum>1e+12</maximum>
  <randomizable group="0">false</randomizable>
  <value>87</value>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>kmin_2</objectName>
  <x>67</x>
  <y>232</y>
  <width>41</width>
  <height>26</height>
  <uuid>{76d87d98-d998-4163-ac7e-1c2e4e982f72}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>19</fontsize>
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
  <resolution>1.00000000</resolution>
  <minimum>-1e+12</minimum>
  <maximum>1e+12</maximum>
  <randomizable group="0">false</randomizable>
  <value>84</value>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>20</x>
  <y>43</y>
  <width>80</width>
  <height>25</height>
  <uuid>{f10beb12-fdba-469d-9299-f845bbbf2a88}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>VOICE 1 min max</label>
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
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>kmin_1</objectName>
  <x>67</x>
  <y>75</y>
  <width>41</width>
  <height>26</height>
  <uuid>{92fc48fa-ccc7-40e5-8461-464fc15a9224}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>19</fontsize>
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
  <resolution>1.00000000</resolution>
  <minimum>-1e+12</minimum>
  <maximum>1e+12</maximum>
  <randomizable group="0">false</randomizable>
  <value>70</value>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>18</x>
  <y>195</y>
  <width>80</width>
  <height>25</height>
  <uuid>{a97039c2-6501-4fe5-ade3-f139deb50500}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>VOICE 2 min max</label>
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
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>kcps_1</objectName>
  <x>66</x>
  <y>143</y>
  <width>54</width>
  <height>26</height>
  <uuid>{68d946da-28e4-4008-a2a1-13d123c9b3f2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>19</fontsize>
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
  <resolution>0.50000000</resolution>
  <minimum>-1e+12</minimum>
  <maximum>1e+12</maximum>
  <randomizable group="0">false</randomizable>
  <value>3</value>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>kcps_2</objectName>
  <x>67</x>
  <y>296</y>
  <width>52</width>
  <height>26</height>
  <uuid>{7521a54f-161c-4ee6-865b-4745bada494a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>19</fontsize>
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
  <resolution>0.50000000</resolution>
  <minimum>-1e+12</minimum>
  <maximum>1e+12</maximum>
  <randomizable group="0">false</randomizable>
  <value>2</value>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>19</x>
  <y>75</y>
  <width>34</width>
  <height>23</height>
  <uuid>{f49bffad-bb11-4e5c-873a-06d072b8ac13}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>min</label>
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
  <x>18</x>
  <y>234</y>
  <width>34</width>
  <height>23</height>
  <uuid>{94ac4358-64bf-4c0c-9b14-596067074494}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>min</label>
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
  <x>19</x>
  <y>108</y>
  <width>34</width>
  <height>23</height>
  <uuid>{3fe8c125-75bd-45bd-869e-fbb736cfb798}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>max</label>
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
  <x>19</x>
  <y>262</y>
  <width>34</width>
  <height>23</height>
  <uuid>{f57713e6-9f45-48f4-b597-206903e51f3b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>max</label>
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
  <x>19</x>
  <y>143</y>
  <width>34</width>
  <height>23</height>
  <uuid>{b73e29f5-32a7-43bf-aea5-fc4dea26dafb}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>cps</label>
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
  <x>19</x>
  <y>294</y>
  <width>34</width>
  <height>23</height>
  <uuid>{a090f172-a7a3-4d15-a9d0-c04631bdb3a8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>cps</label>
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
WindowBounds: 1515 72 209 609
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioText {103, 208} {41, 26} editnum 73.000000 1.000000 "kmax_1" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 73.000000
ioText {256, 206} {41, 26} editnum 87.000000 1.000000 "kmax_2" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 87.000000
ioText {256, 173} {41, 26} editnum 84.000000 1.000000 "kmin_2" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 84.000000
ioText {95, 124} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder VOICE 1 min max
ioText {102, 171} {41, 26} editnum 70.000000 1.000000 "kmin_1" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 70.000000
ioText {243, 126} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder VOICE 2 min max
ioText {102, 243} {41, 26} editnum 3.000000 0.500000 "kcps_1" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 3.000000
ioText {258, 243} {41, 26} editnum 2.000000 0.500000 "kcps_2" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 2.000000
ioText {42, 185} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder min
ioText {55, 175} {34, 23} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder min
ioText {55, 208} {34, 23} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder max
ioText {55, 208} {34, 23} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder max
ioText {55, 243} {34, 23} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder cps
ioText {55, 243} {34, 23} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder cps
</MacGUI>
