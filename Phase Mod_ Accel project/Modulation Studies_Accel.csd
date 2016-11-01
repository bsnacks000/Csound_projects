<CsoundSynthesizer>
<CsOptions>
--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps =128
nchnls = 2
0dbfs = 20000

giSine ftgen 0, 0, 8192, 10, 1
seed 0

instr 1 ; test instrument -- k rate knobs

aCarrier init 0 ; initialize Carrier 

kCarrier_Freq invalue "kCarrier_Freq"
kMod_Freq invalue "kMod_Freq"

kMod_Factor = kMod_Freq/kCarrier_Freq

kIndex invalue "kIndex"
 kIndex = kIndex/ 6.28   ; divide by 2pi

aEnv adsr .1, 0, 1 , .1 

aMod_osc poscil kIndex * aEnv, kMod_Freq * kMod_Factor, giSine
aPhase phasor kCarrier_Freq

kFeed_amount invalue "kFeed_amount"

aCarrier tablei aPhase + aMod_osc +(aCarrier * kFeed_amount), giSine , 1 , 0, 1

kSig_amp invalue "kSig_amp"
aLP_filt butterlp aCarrier, sr * 0.1 ; LPF helps reduce noise

outs aLP_filt * aEnv * kSig_amp, aLP_filt * aEnv * kSig_amp 
endin




instr 2; stochastic instrument -- k rate tendency masks * time
;
aCarrier init 0 ; initialize Carrier 

iCarrier_Freq random 50, 100
iMod_Freq random 50, 75

iMod_Factor = iMod_Freq/iCarrier_Freq

iIndex_rate random .1, 1
aIndex randomi 0, 20, iIndex_rate,3 
aIndex = aIndex/ 6.28   ; divide by 2pi

aEnv adsr 5, 0, 1 , 5 

aMod_osc poscil aIndex * aEnv, iMod_Freq * iMod_Factor, giSine
aPhase phasor iCarrier_Freq

iFeed_rate random .1, 1
aFeed_amount randomi 0, .175, iFeed_rate,3

aCarrier tablei aPhase + aMod_osc +(aCarrier * aFeed_amount), giSine , 1 , 0, 1

iSig_rate random .5, 1.5
aSig_amp randomi 500, 1000, iSig_rate,3
aLP_filt butterlp aCarrier, sr * 0.1 ; LPF helps reduce noise

kStereo_rate random 0,2
kStereo_drift randomi 0,1,kStereo_rate,1
aVerb nreverb aLP_filt, 1.25, .5 

aOut_L, aOut_R pan2 aVerb, kStereo_drift , 1

outs aOut_L * aEnv * aSig_amp , aOut_R * aEnv * aSig_amp



endin



</CsInstruments>
<CsScore>
i1 0 500


;i2 0 500
;i2 0 500
;i2 0 500
;i2 0 500
;i2 0 500
;i2 0 500

</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1347</x>
 <y>72</y>
 <width>504</width>
 <height>593</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kCarrier_Freq</objectName>
  <x>31</x>
  <y>58</y>
  <width>164</width>
  <height>172</height>
  <uuid>{ccb0c2e6-9374-4b1f-a03e-dd334684040e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>1000.00000000</maximum>
  <value>180.82000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kCarrier_Freq</objectName>
  <x>73</x>
  <y>229</y>
  <width>89</width>
  <height>22</height>
  <uuid>{888bcc37-cd14-4066-bb4a-4f694250ef85}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
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
  <value>180.82000000</value>
  <resolution>0.10000000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScope">
  <objectName/>
  <x>20</x>
  <y>541</y>
  <width>350</width>
  <height>150</height>
  <uuid>{db116cec-35bc-4be5-a39c-80d5eb67636d}</uuid>
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
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>61</x>
  <y>5</y>
  <width>104</width>
  <height>58</height>
  <uuid>{a81b1b76-38c0-4944-96ed-7236cdaa277a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Carrier Frequency</label>
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
 <bsbObject version="2" type="BSBKnob">
  <objectName>kMod_Freq</objectName>
  <x>212</x>
  <y>60</y>
  <width>152</width>
  <height>159</height>
  <uuid>{e218ead5-0fdd-4aa5-be9b-0949c093cedf}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>1000.00000000</maximum>
  <value>190.81000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kMod_Freq</objectName>
  <x>253</x>
  <y>230</y>
  <width>89</width>
  <height>22</height>
  <uuid>{f40a902f-0d39-4855-9c10-779098a57ba7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
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
  <value>190.81000000</value>
  <resolution>0.10000000</resolution>
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
  <x>248</x>
  <y>5</y>
  <width>104</width>
  <height>58</height>
  <uuid>{1f1c698d-e9e8-4088-90b0-2eb0a4a8ec36}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Mod Frequency</label>
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
 <bsbObject version="2" type="BSBVSlider">
  <objectName>kFeed_amount</objectName>
  <x>166</x>
  <y>301</y>
  <width>39</width>
  <height>201</height>
  <uuid>{ae843dd8-a143-497c-b478-0956ecee193c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00100000</minimum>
  <maximum>0.20000000</maximum>
  <value>0.10396517</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kFeed_amount</objectName>
  <x>146</x>
  <y>508</y>
  <width>89</width>
  <height>22</height>
  <uuid>{0b2716f3-f3ca-4e31-acb4-7d60ae472ae5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
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
  <value>0.10396517</value>
  <resolution>0.10000000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kIndex</objectName>
  <x>261</x>
  <y>262</y>
  <width>260</width>
  <height>252</height>
  <uuid>{0c37a696-18bc-4fa3-b3c8-f895bd0ad736}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>50.00000000</maximum>
  <value>9.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kIndex</objectName>
  <x>348</x>
  <y>510</y>
  <width>91</width>
  <height>24</height>
  <uuid>{74a20884-e43f-4b2f-8fcc-ea71ad0a2340}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
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
  <value>9.00000000</value>
  <resolution>0.01000000</resolution>
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
  <x>381</x>
  <y>197</y>
  <width>68</width>
  <height>32</height>
  <uuid>{65a886a3-c01a-4b50-a180-098092d9d228}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Index</label>
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
  <x>139</x>
  <y>265</y>
  <width>99</width>
  <height>30</height>
  <uuid>{1b7350b0-0226-4e6a-abfc-54f6a0ba5eda}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Feedback</label>
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
 <bsbObject version="2" type="BSBVSlider">
  <objectName>kSig_amp</objectName>
  <x>47</x>
  <y>302</y>
  <width>39</width>
  <height>201</height>
  <uuid>{c4a331ab-2870-4cfb-a1c8-113da3b041d1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>100.00000000</minimum>
  <maximum>7000.00000000</maximum>
  <value>2022.38805970</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kSig_amp</objectName>
  <x>27</x>
  <y>509</y>
  <width>89</width>
  <height>22</height>
  <uuid>{a8ab6ab8-78ce-437b-a811-248f0c3284ca}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
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
  <value>2022.38805970</value>
  <resolution>0.10000000</resolution>
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
  <x>20</x>
  <y>266</y>
  <width>99</width>
  <height>30</height>
  <uuid>{298740c5-5791-42d1-ad51-55d83a048d7f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Amp</label>
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
WindowBounds: 1347 72 504 593
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioKnob {31, 58} {164, 172} 1000.000000 1.000000 0.010000 180.820000 kCarrier_Freq
ioText {73, 229} {89, 22} scroll 180.820000 0.100000 "kCarrier_Freq" left "Arial" 15 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioGraph {20, 541} {350, 150} scope 2.000000 -255 
ioText {61, 5} {104, 58} label 0.000000 0.00100 "" left "Arial" 20 {0, 0, 0} {61440, 61440, 61440} nobackground noborder Carrier Frequency
ioKnob {212, 60} {152, 159} 1000.000000 1.000000 0.010000 190.810000 kMod_Freq
ioText {253, 230} {89, 22} scroll 190.810000 0.100000 "kMod_Freq" left "Arial" 15 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {248, 5} {104, 58} label 0.000000 0.00100 "" left "Arial" 20 {0, 0, 0} {61440, 61440, 61440} nobackground noborder Mod Frequency
ioSlider {166, 301} {39, 201} 0.001000 0.200000 0.103965 kFeed_amount
ioText {146, 508} {89, 22} scroll 0.103965 0.100000 "kFeed_amount" left "Arial" 15 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {261, 262} {260, 252} 50.000000 0.000000 0.010000 9.000000 kIndex
ioText {348, 510} {91, 24} scroll 9.000000 0.010000 "kIndex" left "Arial" 15 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {381, 197} {68, 32} label 0.000000 0.00100 "" left "Arial" 20 {0, 0, 0} {61440, 61440, 61440} nobackground noborder Index
ioText {139, 265} {99, 30} label 0.000000 0.00100 "" left "Arial" 20 {0, 0, 0} {61440, 61440, 61440} nobackground noborder Feedback
ioSlider {47, 302} {39, 201} 100.000000 7000.000000 2022.388060 kSig_amp
ioText {27, 509} {89, 22} scroll 2022.388060 0.100000 "kSig_amp" left "Arial" 15 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {20, 266} {99, 30} label 0.000000 0.00100 "" left "Arial" 20 {0, 0, 0} {61440, 61440, 61440} nobackground noborder Amp
</MacGUI>
