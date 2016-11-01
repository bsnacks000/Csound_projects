<CsoundSynthesizer>
<CsOptions>
;--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 128
nchnls = 2
0dbfs = 20000

gaDrySend init 0
gaDryReturn init 0
gaFiltLowReturn init 0
gaFiltHighReturn init 0



giSource1 ftgen 0, 0, 0, 1, "teck_sample_1.wav", 0, 0, 0
giSource2 ftgen 0, 0, 0, 1, "teck_sample_2.wav", 0, 0, 0
giSource3 ftgen 0, 0, 0, 1, "teck_sample_3.wav", 0, 0, 0
giSource4 ftgen 0, 0, 0, 1, "teck_sample_4.wav", 0, 0, 0
giSource5 ftgen 0, 0, 0, 1, "teck_sample_5.wav", 0, 0, 0
giSource6 ftgen 0, 0, 0, 1, "teck_sample_6.wav", 0, 0, 0
giSource7 ftgen 0, 0, 0, 1, "teck_sample_7.wav", 0, 0, 0
giSource8 ftgen 0, 0, 0, 1, "teck_sample_8.wav", 0, 0, 0


giWin_Gauss1 ftgen 0, 0, 8192, 20, 6, 1 , 1
giWin_Gauss2 ftgen 0, 0, 8192, 20, 6, 1 , 2
giWin_Gauss3 ftgen 0, 0, 8192, 20, 6, 1 , .5
giWin_Gauss4 ftgen 0, 0, 8192, 20, 6, 1 , .25
giWin_Hann ftgen 0, 0, 8192, 20, 2

seed 0


instr 1

;-------------manual----------;
kamp invalue "kamp"
ktimewarp invalue "ktimewarp"
kresample invalue "kresample"

idur = p3

kcps invalue "kcps"
kfreeze invalue "kfreeze"


;-----------automated---------
; second param of ktimewarp should be <= length of sample

if (kfreeze == 1) then
	kcps = 0
endif

;aresample = 1
;aresample gaussi kresample, 1, 1

kresample randomi kresample * 0.75,  kresample * 1.25, kcps

ktimewarp randomi 0, 16, kcps ,3


ifn1 = giSource8
ibeg = 0
iwsize = sr/20
irandw = iwsize * .3
ioverlap = 50
ifn2 = giWin_Hann
itimemode = 1


ihardline_amp = ampdbfs(-7)

aSig, aComp sndwarp ihardline_amp, ktimewarp, kresample, ifn1, ibeg, iwsize, irandw, ioverlap, ifn2, itimemode


aBal balance aSig, aComp 
	aBal buthp aBal, 25
	aEnv adsr .01, 0, 1, .01

aBal = aBal * aEnv

;dispfft aBal * 10, .01, 1024, 1, 0

gaDrySend = aBal * kamp
gaDryReturn = aBal

endin

instr 2

; effect channel for Low Filter / Env Follower

kmoog_amp invalue "kmoog_amp"
kmoog_freq invalue "kmoog_freq"
kmoog_res invalue "kmoog_res"

afiltSig butterbp gaDrySend, 5, 10 
	afiltSig dcblock2 afiltSig
	aEnv follow2 afiltSig, .001, .1

kEnv downsamp aEnv

aSig moogladder gaDrySend * kmoog_amp, kmoog_freq + kEnv, kmoog_res , 1

kthreshold invalue "kthresh_low"		; add compression
icomp1 = 0.5
icomp2 = 0.8
irtime = 0.01
iftime = 0.1

aSig dam aSig, kthreshold, icomp1, icomp2, irtime, iftime	

gaFiltLowReturn = aSig

endin


instr 3
; effect channel for High Filter /Env follower

kmoog_amp invalue "kmoog_amp1"
kmoog_freq invalue "kmoog_freq1"
kmoog_res invalue "kmoog_res1"

afiltSig butterbp gaDrySend, 5, 25 		;gaSend --> BP filter --> DC filter -->Env follower
	afiltSig dcblock2 afiltSig
	aEnv follow2 afiltSig, .001, .75

kEnv_follow downsamp aEnv			; downsample to effect control signal

;printk .001, kEnv

aSig moogladder gaDrySend * kmoog_amp, kmoog_freq + kEnv_follow, kmoog_res , 1		; multiply by Gain and Return 

kthreshold invalue "kthresh_high"		; add compression
icomp1 = 0.3
icomp2 = 0.5
irtime = 0.01
iftime = 0.1

aSig dam aSig, kthreshold, icomp1, icomp2, irtime, iftime

gaFiltHighReturn = aSig

endin


instr 100
; mixer -- multiply by linear value 0 - 1... sum and output to master

gkDry invalue "gkDry"
gkFiltLow invalue "gkFiltLow"
gkFiltHigh invalue "gkFiltHigh"
gkMaster invalue "gkMaster"

aDry = gaDryReturn * gkDry
aLow = gaFiltLowReturn * gkFiltLow
aHigh = gaFiltHighReturn * gkFiltHigh

aMaster = aDry + aLow + aHigh

aSig = aMaster * gkMaster 

outs aSig, aSig

endin


</CsInstruments>
<CsScore>
f 0 1
s
i100 0 500

i1 0 500
i2 0 500
i3 0 500

</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>674</x>
 <y>147</y>
 <width>1240</width>
 <height>875</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>0</x>
  <y>491</y>
  <width>397</width>
  <height>361</height>
  <uuid>{c7aee27f-614b-49a4-8a30-1b1b7b87f5d3}</uuid>
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
   <r>173</r>
   <g>115</g>
   <b>115</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>306</x>
  <y>522</y>
  <width>23</width>
  <height>291</height>
  <uuid>{c1961666-ebf1-43d0-ad8f-729af2730238}</uuid>
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
   <r>240</r>
   <g>162</g>
   <b>123</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>743</x>
  <y>12</y>
  <width>223</width>
  <height>481</height>
  <uuid>{f412a5e9-21e8-4fc3-be8a-0d4fbc930f9c}</uuid>
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
   <r>240</r>
   <g>114</g>
   <b>88</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>4</x>
  <y>12</y>
  <width>536</width>
  <height>451</height>
  <uuid>{5bd49562-8c6b-44f0-ab15-46d629062776}</uuid>
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
   <r>154</r>
   <g>206</g>
   <b>240</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>537</x>
  <y>12</y>
  <width>208</width>
  <height>480</height>
  <uuid>{9a76216b-ccf5-41b3-bfa7-01f845f1a27d}</uuid>
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
   <r>84</r>
   <g>240</g>
   <b>206</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>-4</x>
  <y>359</y>
  <width>546</width>
  <height>132</height>
  <uuid>{eff30048-2d3e-4644-8161-ee976bce6c32}</uuid>
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
   <r>72</r>
   <g>57</g>
   <b>240</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>kamp</objectName>
  <x>16</x>
  <y>89</y>
  <width>42</width>
  <height>235</height>
  <uuid>{c2f3c328-8eae-4bc6-993c-4b90a0165991}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.83404255</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kresample</objectName>
  <x>66</x>
  <y>89</y>
  <width>230</width>
  <height>229</height>
  <uuid>{92caccb0-254c-4284-addc-398b288910e0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.01000000</minimum>
  <maximum>5.00000000</maximum>
  <value>4.05190000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>20</x>
  <y>58</y>
  <width>71</width>
  <height>29</height>
  <uuid>{7671070d-4414-4026-82b6-a65591727aa5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Send</label>
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
  <x>147</x>
  <y>58</y>
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
  <x>7</x>
  <y>328</y>
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
  <value>0.83404255</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kresample</objectName>
  <x>155</x>
  <y>307</y>
  <width>59</width>
  <height>24</height>
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
  <value>4.05190000</value>
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
  <x>296</x>
  <y>89</y>
  <width>237</width>
  <height>226</height>
  <uuid>{cac9e35f-9c98-4da1-ad82-98c62c2e428b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.36000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>369</x>
  <y>66</y>
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
 <bsbObject version="2" type="BSBGraph">
  <objectName/>
  <x>246</x>
  <y>370</y>
  <width>291</width>
  <height>107</height>
  <uuid>{b39f9dd5-9549-4cdd-8fc8-31e664dd5d53}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <value>0</value>
  <objectName2/>
  <zoomx>1.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <modex>lin</modex>
  <modey>lin</modey>
  <all>true</all>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kcps</objectName>
  <x>383</x>
  <y>305</y>
  <width>63</width>
  <height>25</height>
  <uuid>{a68f6482-de02-44eb-8f57-a79010c3177c}</uuid>
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
  <value>0.36000000</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>kfreeze</objectName>
  <x>317</x>
  <y>311</y>
  <width>30</width>
  <height>30</height>
  <uuid>{9bded962-190a-4f78-a5bb-69ebf2a73b19}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>337</x>
  <y>314</y>
  <width>47</width>
  <height>24</height>
  <uuid>{2a98fd2a-744f-404f-8020-9acebffa9375}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>freeze</label>
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
 <bsbObject version="2" type="BSBVSlider">
  <objectName>kmoog_amp</objectName>
  <x>767</x>
  <y>106</y>
  <width>40</width>
  <height>253</height>
  <uuid>{cd57010e-c82e-41f5-8631-6471e9f70616}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>10.00000000</maximum>
  <value>3.95256917</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>kmoog_freq</objectName>
  <x>820</x>
  <y>108</y>
  <width>40</width>
  <height>253</height>
  <uuid>{6dd26ea4-31e8-4ce2-8c70-693335f13b2d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>40.00000000</minimum>
  <maximum>200.00000000</maximum>
  <value>181.66007905</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>kmoog_res</objectName>
  <x>879</x>
  <y>108</y>
  <width>40</width>
  <height>253</height>
  <uuid>{b9b3a197-6e45-422f-904f-243dba2f317a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.75000000</minimum>
  <maximum>0.99999000</maximum>
  <value>0.94564435</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>745</x>
  <y>77</y>
  <width>80</width>
  <height>25</height>
  <uuid>{4c253f21-6057-44de-af98-e0bb89f767e9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Low_Gain</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <x>809</x>
  <y>78</y>
  <width>80</width>
  <height>25</height>
  <uuid>{120ccbc5-7bef-4bc0-a3b9-f1b7c1593af6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>moog_freq</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <x>877</x>
  <y>78</y>
  <width>80</width>
  <height>25</height>
  <uuid>{4d06d5a4-c2ad-4bd6-b3db-524f38a6024c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>moog_res</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <objectName>kmoog_amp</objectName>
  <x>753</x>
  <y>365</y>
  <width>58</width>
  <height>22</height>
  <uuid>{6dbe7350-ea27-425b-8c8c-80292ca31dc0}</uuid>
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
  <value>3.95256917</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kmoog_freq</objectName>
  <x>817</x>
  <y>365</y>
  <width>58</width>
  <height>22</height>
  <uuid>{fd175e73-79a1-4ece-9c7a-08f92917dd5b}</uuid>
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
  <value>181.66007905</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kmoog_res</objectName>
  <x>878</x>
  <y>364</y>
  <width>58</width>
  <height>22</height>
  <uuid>{ee997d5a-5826-4cfd-ad4c-fddc1bc8e206}</uuid>
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
  <value>0.94564435</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>kmoog_amp1</objectName>
  <x>563</x>
  <y>106</y>
  <width>40</width>
  <height>253</height>
  <uuid>{d033f4a7-dc39-47ff-aec5-7e63f3eb52e2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>10.00000000</maximum>
  <value>2.80632411</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>kmoog_freq1</objectName>
  <x>616</x>
  <y>108</y>
  <width>40</width>
  <height>253</height>
  <uuid>{8b7f5fd4-f216-42af-a656-9c4325434402}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>2000.00000000</minimum>
  <maximum>10000.00000000</maximum>
  <value>3359.68379447</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>kmoog_res1</objectName>
  <x>673</x>
  <y>107</y>
  <width>40</width>
  <height>253</height>
  <uuid>{a156c02f-4ff2-48f3-aba1-1f3eeb40f4a1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.50000000</minimum>
  <maximum>0.99990000</maximum>
  <value>0.89912964</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>549</x>
  <y>75</y>
  <width>80</width>
  <height>25</height>
  <uuid>{27fc3585-9fd9-40f2-be94-36e30ec75c04}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>High_Gain</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <x>608</x>
  <y>79</y>
  <width>80</width>
  <height>25</height>
  <uuid>{2630a33c-b2c1-4bc7-b803-6f7b0a3a02bb}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>moog_freq</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <x>665</x>
  <y>78</y>
  <width>80</width>
  <height>25</height>
  <uuid>{1bdf3e82-110e-4d6b-a6c3-a95eb1a55504}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>moog_res</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <objectName>kmoog_amp1</objectName>
  <x>549</x>
  <y>365</y>
  <width>58</width>
  <height>22</height>
  <uuid>{8fbda16b-cffa-4b13-ad51-e13baad01736}</uuid>
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
  <value>2.80632411</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kmoog_freq1</objectName>
  <x>613</x>
  <y>365</y>
  <width>58</width>
  <height>22</height>
  <uuid>{58c54f22-1400-4cb2-9fdd-08634bd51a2e}</uuid>
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
  <value>3359.68379447</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kmoog_res1</objectName>
  <x>674</x>
  <y>364</y>
  <width>58</width>
  <height>22</height>
  <uuid>{579ff0b7-3451-4da7-bd83-7a638c31e34e}</uuid>
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
  <value>0.89912964</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>871</x>
  <y>25</y>
  <width>80</width>
  <height>25</height>
  <uuid>{c0421b93-2a10-4c89-bc0e-357f70b1badf}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>LOW MOOG</label>
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
  <x>654</x>
  <y>23</y>
  <width>80</width>
  <height>25</height>
  <uuid>{4ce003a1-f8cc-4456-bf75-7e917ecac653}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>HIGH MOOG</label>
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
 <bsbObject version="2" type="BSBVSlider">
  <objectName>gkDry</objectName>
  <x>17</x>
  <y>519</y>
  <width>60</width>
  <height>292</height>
  <uuid>{79a5f3a5-65fd-46a9-a9b5-eb0c69055857}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.56164384</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>gkFiltLow</objectName>
  <x>104</x>
  <y>519</y>
  <width>60</width>
  <height>292</height>
  <uuid>{d8db21da-707b-4b9e-bed3-761539459938}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.85616438</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>gkFiltHigh</objectName>
  <x>196</x>
  <y>520</y>
  <width>60</width>
  <height>292</height>
  <uuid>{a0f95ffd-c680-4313-9d0e-a4719bd73cc6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.46575342</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>gkMaster</objectName>
  <x>273</x>
  <y>522</y>
  <width>89</width>
  <height>292</height>
  <uuid>{f35da108-b68a-4c2d-b918-552616b720b2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.39041096</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>gkDry</objectName>
  <x>17</x>
  <y>810</y>
  <width>61</width>
  <height>24</height>
  <uuid>{0a0f81cc-8d87-4d77-b4d7-4f322881dd03}</uuid>
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
  <value>0.56164384</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>gkFiltLow</objectName>
  <x>104</x>
  <y>813</y>
  <width>58</width>
  <height>22</height>
  <uuid>{e517b159-a01e-41c9-b82a-d4b5ca5a944c}</uuid>
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
  <value>0.85616438</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>gkFiltHigh</objectName>
  <x>197</x>
  <y>814</y>
  <width>58</width>
  <height>22</height>
  <uuid>{1eecca7e-818e-4405-9f1c-77b7e4ef3470}</uuid>
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
  <value>0.46575342</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>gkMaster</objectName>
  <x>292</x>
  <y>814</y>
  <width>58</width>
  <height>22</height>
  <uuid>{c424b06a-5530-4651-9cc1-1abe0dd7362c}</uuid>
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
  <value>0.39041096</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>28</x>
  <y>498</y>
  <width>38</width>
  <height>23</height>
  <uuid>{f6293ac4-be00-442a-8a00-10116f30220d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>DRY</label>
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
  <x>108</x>
  <y>497</y>
  <width>60</width>
  <height>22</height>
  <uuid>{fde11d44-6bd1-46c3-82e9-8381627b3f4d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>FILT LOW</label>
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
  <x>198</x>
  <y>497</y>
  <width>60</width>
  <height>22</height>
  <uuid>{06b86360-1188-444d-a3c3-e8ab39518d09}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>FILT HIGH</label>
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
  <x>295</x>
  <y>497</y>
  <width>60</width>
  <height>22</height>
  <uuid>{a6880ec8-5727-47dc-99ad-ec659a9e1481}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>MASTER</label>
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
 <bsbObject version="2" type="BSBKnob">
  <objectName>kthresh_low</objectName>
  <x>803</x>
  <y>389</y>
  <width>80</width>
  <height>80</height>
  <uuid>{f4ddb759-98af-40a3-8d5f-e34f28099e3c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.37000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kthresh_low</objectName>
  <x>816</x>
  <y>469</y>
  <width>58</width>
  <height>22</height>
  <uuid>{4d348bb2-636a-4d5c-9140-658af7f376e8}</uuid>
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
  <value>0.37000000</value>
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
  <objectName>kthresh_high</objectName>
  <x>597</x>
  <y>391</y>
  <width>80</width>
  <height>80</height>
  <uuid>{c2f9ad3a-bf2c-4c51-ba63-f2f94c690e47}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.50000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kthresh_high</objectName>
  <x>610</x>
  <y>471</y>
  <width>58</width>
  <height>22</height>
  <uuid>{50c81515-b29c-42b7-82c7-4d4a587fd1fd}</uuid>
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
  <value>0.50000000</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>355</x>
  <y>652</y>
  <width>44</width>
  <height>27</height>
  <uuid>{c062b208-0079-4553-8ec1-71ba8220fd43}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>&lt;&lt;&lt;</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>20</fontsize>
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
  <x>161</x>
  <y>601</y>
  <width>44</width>
  <height>27</height>
  <uuid>{7c453c19-ca31-4187-8c57-ab94758b9f07}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>&lt;&lt;&lt;</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>20</fontsize>
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
  <x>249</x>
  <y>654</y>
  <width>44</width>
  <height>27</height>
  <uuid>{dd823867-f392-4718-8f3b-f102935af1f8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>&lt;&lt;&lt;</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>20</fontsize>
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
  <x>66</x>
  <y>617</y>
  <width>44</width>
  <height>27</height>
  <uuid>{6a8e25ab-7ca0-4425-bcd7-e9156d52bd1a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>&lt;&lt;&lt;</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>20</fontsize>
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
  <x>921</x>
  <y>119</y>
  <width>44</width>
  <height>27</height>
  <uuid>{d6a1820b-c434-4e13-80e6-f91619f65fcc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>&lt;&lt;&lt;</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>20</fontsize>
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
  <x>844</x>
  <y>282</y>
  <width>44</width>
  <height>27</height>
  <uuid>{def161e0-c732-45ff-99cb-dc61e27fe873}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>&lt;&lt;&lt;</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>20</fontsize>
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
  <x>789</x>
  <y>248</y>
  <width>44</width>
  <height>27</height>
  <uuid>{caf0c006-3084-449e-bbac-c00d63319085}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>&lt;&lt;&lt;</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>20</fontsize>
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
  <x>703</x>
  <y>271</y>
  <width>44</width>
  <height>27</height>
  <uuid>{f576f616-6bc5-49f8-b64d-84d79e5df24a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>&lt;&lt;&lt;</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>20</fontsize>
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
  <x>642</x>
  <y>202</y>
  <width>44</width>
  <height>27</height>
  <uuid>{4b93d4c3-eab1-48d4-83d7-2fb382419bf1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>&lt;&lt;&lt;</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>20</fontsize>
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
  <x>586</x>
  <y>263</y>
  <width>44</width>
  <height>27</height>
  <uuid>{7ef03802-96e7-4acb-b8fb-eda1cb554785}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>&lt;&lt;&lt;</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>20</fontsize>
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
WindowBounds: 674 147 1240 875
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioText {-1, 490} {397, 361} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {44288, 29440, 29440} nobackground noborder 
ioText {296, 520} {57, 293} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 41472, 31488} nobackground noborder 
ioText {743, 12} {223, 481} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 29184, 22528} nobackground noborder 
ioText {4, 12} {536, 451} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {39424, 52736, 61440} nobackground noborder 
ioText {537, 12} {208, 480} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {21504, 61440, 52736} nobackground noborder 
ioText {-4, 359} {546, 132} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {18432, 14592, 61440} nobackground noborder 
ioSlider {16, 89} {42, 235} 0.000000 1.000000 0.834043 kamp
ioKnob {66, 89} {230, 229} 5.000000 0.010000 0.010000 4.051900 kresample
ioText {12, 42} {71, 29} label 0.000000 0.00100 "" left "Arial" 14 {0, 0, 0} {61440, 61440, 61440} nobackground noborder Send
ioText {119, 41} {71, 29} label 0.000000 0.00100 "" left "Arial" 14 {0, 0, 0} {61440, 61440, 61440} nobackground noborder resample
ioText {7, 328} {80, 25} scroll 0.834043 0.001000 "kamp" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {155, 307} {59, 24} scroll 4.051900 0.001000 "kresample" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {296, 89} {237, 226} 1.000000 0.000000 0.010000 0.360000 kcps
ioText {348, 48} {106, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder RANDOMi KCPS
ioGraph {246, 370} {291, 107} table 0.000000 1.000000 
ioText {383, 305} {63, 25} scroll 0.360000 0.001000 "kcps" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioCheckbox {317, 311} {30, 30} off kfreeze
ioText {337, 314} {47, 24} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder freeze
ioSlider {767, 106} {40, 253} 0.000000 10.000000 3.952569 kmoog_amp
ioSlider {820, 108} {40, 253} 40.000000 200.000000 181.660079 kmoog_freq
ioSlider {879, 108} {40, 253} 0.750000 0.999990 0.945644 kmoog_res
ioText {745, 77} {80, 25} label 0.000000 0.00100 "" left "Arial" 12 {0, 0, 0} {61440, 61440, 61440} nobackground noborder Low_Gain
ioText {809, 78} {80, 25} label 0.000000 0.00100 "" left "Arial" 12 {0, 0, 0} {61440, 61440, 61440} nobackground noborder moog_freq
ioText {877, 78} {80, 25} label 0.000000 0.00100 "" left "Arial" 12 {0, 0, 0} {61440, 61440, 61440} nobackground noborder moog_res
ioText {753, 365} {58, 22} scroll 3.952569 0.001000 "kmoog_amp" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {817, 365} {58, 22} scroll 181.660079 0.001000 "kmoog_freq" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {878, 364} {58, 22} scroll 0.945644 0.001000 "kmoog_res" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioSlider {563, 106} {40, 253} 0.000000 10.000000 2.806324 kmoog_amp1
ioSlider {616, 108} {40, 253} 2000.000000 10000.000000 3359.683794 kmoog_freq1
ioSlider {673, 107} {40, 253} 0.500000 0.999900 0.899130 kmoog_res1
ioText {549, 75} {80, 25} label 0.000000 0.00100 "" left "Arial" 12 {0, 0, 0} {61440, 61440, 61440} nobackground noborder High_Gain
ioText {608, 79} {80, 25} label 0.000000 0.00100 "" left "Arial" 12 {0, 0, 0} {61440, 61440, 61440} nobackground noborder moog_freq
ioText {665, 78} {80, 25} label 0.000000 0.00100 "" left "Arial" 12 {0, 0, 0} {61440, 61440, 61440} nobackground noborder moog_res
ioText {549, 365} {58, 22} scroll 2.806324 0.001000 "kmoog_amp1" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {613, 365} {58, 22} scroll 3359.683794 0.001000 "kmoog_freq1" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {674, 364} {58, 22} scroll 0.899130 0.001000 "kmoog_res1" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {871, 25} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder LOW MOOG
ioText {654, 23} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder HIGH MOOG
ioSlider {17, 519} {60, 292} 0.000000 1.000000 0.561644 gkDry
ioSlider {104, 519} {60, 292} 0.000000 1.000000 0.856164 gkFiltLow
ioSlider {196, 520} {60, 292} 0.000000 1.000000 0.465753 gkFiltHigh
ioSlider {273, 522} {89, 292} 0.000000 1.000000 0.390411 gkMaster
ioText {17, 810} {61, 24} scroll 0.561644 0.001000 "gkDry" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {104, 813} {58, 22} scroll 0.856164 0.001000 "gkFiltLow" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {197, 814} {58, 22} scroll 0.465753 0.001000 "gkFiltHigh" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {292, 814} {58, 22} scroll 0.390411 0.001000 "gkMaster" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {28, 498} {38, 23} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder DRY
ioText {108, 497} {60, 22} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder FILT LOW
ioText {198, 497} {60, 22} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder FILT HIGH
ioText {295, 497} {60, 22} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder MASTER
ioKnob {803, 389} {80, 80} 1.000000 0.000000 0.010000 0.370000 kthresh_low
ioText {816, 469} {58, 22} scroll 0.370000 0.001000 "kthresh_low" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 98.81422925
ioKnob {597, 391} {80, 80} 1.000000 0.000000 0.010000 0.500000 kthresh_high
ioText {610, 471} {58, 22} scroll 0.500000 0.001000 "kthresh_high" left "Arial" 10 {0, 0, 0} {65280, 65280, 65280} background noborder 0.25000000
ioText {364, 656} {33, 25} label 0.000000 0.00100 "" left "Arial" 20 {0, 0, 0} {61440, 61440, 61440} nobackground noborder <<<
ioText {355, 652} {44, 27} label 0.000000 0.00100 "" left "Arial" 20 {0, 0, 0} {61440, 61440, 61440} nobackground noborder <<<
ioText {355, 652} {44, 27} label 0.000000 0.00100 "" left "Arial" 20 {0, 0, 0} {61440, 61440, 61440} nobackground noborder <<<
ioText {355, 652} {44, 27} label 0.000000 0.00100 "" left "Arial" 20 {0, 0, 0} {61440, 61440, 61440} nobackground noborder <<<
ioText {355, 652} {44, 27} label 0.000000 0.00100 "" left "Arial" 20 {0, 0, 0} {61440, 61440, 61440} nobackground noborder <<<
ioText {923, 120} {44, 27} label 0.000000 0.00100 "" left "Arial" 20 {0, 0, 0} {61440, 61440, 61440} nobackground noborder <<<
ioText {844, 282} {44, 27} label 0.000000 0.00100 "" left "Arial" 20 {0, 0, 0} {61440, 61440, 61440} nobackground noborder <<<
ioText {921, 119} {44, 27} label 0.000000 0.00100 "" left "Arial" 20 {0, 0, 0} {61440, 61440, 61440} nobackground noborder <<<
ioText {706, 314} {44, 27} label 0.000000 0.00100 "" left "Arial" 20 {0, 0, 0} {61440, 61440, 61440} nobackground noborder <<<
ioText {642, 201} {44, 27} label 0.000000 0.00100 "" left "Arial" 20 {0, 0, 0} {61440, 61440, 61440} nobackground noborder <<<
</MacGUI>
