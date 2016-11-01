<CsoundSynthesizer>
<CsOptions>
;--displays
</CsOptions>
<CsInstruments>

ksmps =128
nchnls = 1
0dbfs = 20000

seed 0 
; --- setting up HIST tables as needed ---


gi_chn_HIST_1 ftgen 0, 0, -20, -41,     0,0,   0,0
gi_chn_HIST_2 ftgen 0, 0, -20, -41,     0,0,   0,0   
gi_chn_HIST_3 ftgen 0, 0, -20, -41,     0,0,   0,0    
gi_chn_HIST_4 ftgen 0, 0, -20, -41,     0,0,   0,0    

gi_pause_HIST_1 ftgen 0, 0, -20, -42,    0,0,.9,		.25,1,.1
gi_pause_HIST_2 ftgen 0, 0, -20, -42,    0,0,.6,   1,5,.4   
gi_pause_HIST_3 ftgen 0, 0, -20, -42,    7,12,1,   0,0,0 
gi_pause_HIST_4 ftgen 0, 0, -20, -42,    0,0,0,   0,0,0    


; channel histograms
instr 1
gk_chn_1 duserrnd gi_chn_HIST_1
gk_chn_2 duserrnd gi_chn_HIST_2
gk_chn_3 duserrnd gi_chn_HIST_3
gk_chn_4 duserrnd gi_chn_HIST_4

endin
;pause histograms
instr 2
gk_pause_1 duserrnd gi_pause_HIST_1
gk_pause_2 duserrnd gi_pause_HIST_2
gk_pause_3 duserrnd gi_pause_HIST_3
gk_pause_4 duserrnd gi_pause_HIST_4


endin


#define VOICE(num_voice'chn'num_min'num_max'num_cps'vel_min'vel_max'vel_cps'check'dur_min_short'dur_max_short'dur_min_long'dur_max_long'dur_cps'pause')#

instr $num_voice

kchn = $chn	

knum_min invalue $num_min
knum_max invalue $num_max
knum_cps invalue $num_cps

kvel_min invalue $vel_min
kvel_max invalue $vel_max
kvel_cps invalue $vel_cps

kcheck invalue $check

	if (kcheck == 0) then 
		kdur_min invalue $dur_min_short
		kdur_max invalue $dur_max_short
	else
		kdur_min invalue $dur_min_long
		kdur_max invalue $dur_max_long
	endif

kdur_cps invalue $dur_cps

kpause = $pause

knum randomh knum_min, knum_max, knum_cps, 3, 0
kvel randomh kvel_min, kvel_max, kvel_cps, 3, 0
kdur randomh kdur_min, kdur_max, kdur_cps, 3, 0


moscil kchn, int(knum), kvel, kdur, kpause

printk .3, kchn

endin

#

;----------------------------
;VOICE[inst#, chn select, (controls), pause select]
;----------------------------


$VOICE(101'p4' 		1'2'3'4'5'6'7'8'9'10'11'12' 	gk_pause_1')
$VOICE(102'p4' 		13'14'15'16'17'18'19'20'21'22'23'24'	gk_pause_1')
$VOICE(103'p4' 		25'26'27'28'29'30'31'32'33'34'35'36'	gk_pause_2')
$VOICE(104'p4' 		37'38'39'40'41'42'43'44'45'46'47'48'	gk_pause_2')

</CsInstruments>
<CsScore>
; global variables always on
i1   0 300
i2   0 300

; instrument 101 - 104

i101  0 300 	2
i102  0 300	2
;i103  0 300	2
;i104  0 300	2

f 0 3

</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>133</x>
 <y>310</y>
 <width>1338</width>
 <height>285</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>9</x>
  <y>14</y>
  <width>1239</width>
  <height>586</height>
  <uuid>{036b4c62-0616-4b12-931e-7a3bb4577853}</uuid>
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
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>56</x>
  <y>53</y>
  <width>555</width>
  <height>228</height>
  <uuid>{b1abb5b0-1b44-4eed-ac60-8ddb062f4f40}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>VOICE 1</label>
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
   <r>214</r>
   <g>240</g>
   <b>193</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>1</objectName>
  <x>90</x>
  <y>213</y>
  <width>24</width>
  <height>25</height>
  <uuid>{e65572ad-3b02-4036-bfcd-1ee379a8bb75}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>55.26277372</value>
  <resolution>1.00000000</resolution>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>1</objectName>
  <x>88</x>
  <y>76</y>
  <width>29</width>
  <height>137</height>
  <uuid>{58a747d5-cd4e-4279-99e6-c86002e86f1d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <value>55.26277372</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>2</objectName>
  <x>121</x>
  <y>76</y>
  <width>29</width>
  <height>137</height>
  <uuid>{8a517079-897c-4e06-99f6-58c3d9e0c7c1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <value>74.57664234</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>2</objectName>
  <x>123</x>
  <y>213</y>
  <width>24</width>
  <height>25</height>
  <uuid>{30a7f542-3204-4b23-8862-f40cb9cd012f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>74.57664234</value>
  <resolution>1.00000000</resolution>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>3</objectName>
  <x>154</x>
  <y>169</y>
  <width>63</width>
  <height>70</height>
  <uuid>{7a7d30e8-ea92-4e87-8d2f-689e50d2a8fe}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>15.00000000</maximum>
  <value>6.60000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>4</objectName>
  <x>224</x>
  <y>213</y>
  <width>24</width>
  <height>25</height>
  <uuid>{e9c684ec-1f79-4397-98d9-e7b1402f7747}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>47.90510949</value>
  <resolution>1.00000000</resolution>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>4</objectName>
  <x>222</x>
  <y>76</y>
  <width>29</width>
  <height>137</height>
  <uuid>{a44b8aad-63b1-401a-804a-305ea663bb6e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <value>47.90510949</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>5</objectName>
  <x>255</x>
  <y>76</y>
  <width>29</width>
  <height>137</height>
  <uuid>{8b5658a9-4441-4288-8e03-d6ac2d3aaef7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <value>76.41605839</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>5</objectName>
  <x>257</x>
  <y>213</y>
  <width>24</width>
  <height>25</height>
  <uuid>{1b8bfb32-8bad-48b1-b5cc-18bdd1a55d5a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>76.41605839</value>
  <resolution>1.00000000</resolution>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>6</objectName>
  <x>287</x>
  <y>169</y>
  <width>63</width>
  <height>70</height>
  <uuid>{2a8c0808-f7b0-4708-8801-690f91afd670}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>15.00000000</maximum>
  <value>5.10000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>113</x>
  <y>242</y>
  <width>55</width>
  <height>25</height>
  <uuid>{1c5a07f8-4cbb-47bd-9816-5ee6e630870a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>bandwidth</label>
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
  <x>256</x>
  <y>243</y>
  <width>55</width>
  <height>25</height>
  <uuid>{345eb5e5-5577-4b7e-b2ad-beeab099dc71}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>velocity</label>
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
  <x>366</x>
  <y>242</y>
  <width>74</width>
  <height>24</height>
  <uuid>{46e8c096-4c4c-49b5-91b1-2e3e1ae6d56f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>duration short</label>
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
  <objectName>8</objectName>
  <x>357</x>
  <y>80</y>
  <width>39</width>
  <height>136</height>
  <uuid>{383883b4-aeec-4d8a-a2e5-9a4a9788e99c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.06300000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.51772059</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>9</objectName>
  <x>400</x>
  <y>80</y>
  <width>39</width>
  <height>136</height>
  <uuid>{48755a37-8dcd-4c75-a85c-6b90903f8370}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.06300000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.86220588</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>12</objectName>
  <x>441</x>
  <y>168</y>
  <width>63</width>
  <height>70</height>
  <uuid>{c94db9d0-0cb4-4bd9-bcdd-3ae84f71b38a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>10.00000000</maximum>
  <value>6.80000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>7</objectName>
  <x>363</x>
  <y>214</y>
  <width>33</width>
  <height>25</height>
  <uuid>{406fd4ce-dba7-438a-977b-366ccf57c636}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>0.00000000</value>
  <resolution>0.00500000</resolution>
  <minimum>0.12500000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>9</objectName>
  <x>402</x>
  <y>213</y>
  <width>33</width>
  <height>25</height>
  <uuid>{479761c2-30d4-467c-94e7-ab4e3d6e84c2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>0.86220588</value>
  <resolution>0.00100000</resolution>
  <minimum>0.06300000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>10</objectName>
  <x>511</x>
  <y>83</y>
  <width>39</width>
  <height>136</height>
  <uuid>{16a8e6f0-2482-40d5-ae9c-0d91bbc725be}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.50000000</minimum>
  <maximum>15.00000000</maximum>
  <value>0.50000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>11</objectName>
  <x>556</x>
  <y>83</y>
  <width>39</width>
  <height>136</height>
  <uuid>{bf4861ab-48d7-4e7c-9f4e-8e2f35f0a3d1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.50000000</minimum>
  <maximum>15.00000000</maximum>
  <value>3.05882353</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>7</objectName>
  <x>547</x>
  <y>60</y>
  <width>20</width>
  <height>20</height>
  <uuid>{a497785c-6c2f-4461-933a-a9b3583037c3}</uuid>
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
  <x>518</x>
  <y>245</y>
  <width>74</width>
  <height>24</height>
  <uuid>{281c3cf3-4c92-4460-8816-696ccebb1c8a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>duration long</label>
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
  <objectName>7</objectName>
  <x>363</x>
  <y>214</y>
  <width>33</width>
  <height>25</height>
  <uuid>{486b869c-446c-4745-96bc-fb29681e6384}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>0.00000000</value>
  <resolution>0.00500000</resolution>
  <minimum>0.12500000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>8</objectName>
  <x>363</x>
  <y>214</y>
  <width>33</width>
  <height>25</height>
  <uuid>{0dacbb92-af60-446f-b814-832644170e39}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>0.51772059</value>
  <resolution>0.00100000</resolution>
  <minimum>0.06300000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>10</objectName>
  <x>514</x>
  <y>218</y>
  <width>33</width>
  <height>25</height>
  <uuid>{15a61339-1b40-4395-af55-e15d1e663bc5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <resolution>0.05000000</resolution>
  <minimum>0.50000000</minimum>
  <maximum>15.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>11</objectName>
  <x>559</x>
  <y>218</y>
  <width>33</width>
  <height>25</height>
  <uuid>{22e0f23c-530f-475f-8678-a10929e88441}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>3.05882353</value>
  <resolution>0.05000000</resolution>
  <minimum>0.50000000</minimum>
  <maximum>15.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>613</x>
  <y>53</y>
  <width>555</width>
  <height>228</height>
  <uuid>{2aae1787-4770-45a0-a7f6-0745c6b72a3f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>VOICE 2</label>
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
   <r>188</r>
   <g>240</g>
   <b>237</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>13</objectName>
  <x>647</x>
  <y>213</y>
  <width>24</width>
  <height>25</height>
  <uuid>{0d38993c-837c-4f3e-8bc1-d139fcae8d0b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>58.02189781</value>
  <resolution>1.00000000</resolution>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>13</objectName>
  <x>645</x>
  <y>76</y>
  <width>29</width>
  <height>137</height>
  <uuid>{ddd65729-9e88-4ec2-85b7-3e4da355b42e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <value>58.02189781</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>14</objectName>
  <x>678</x>
  <y>76</y>
  <width>29</width>
  <height>137</height>
  <uuid>{8415b18b-f5e8-48e9-b0b7-e684e3ea77a1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <value>71.81751825</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>14</objectName>
  <x>680</x>
  <y>213</y>
  <width>24</width>
  <height>25</height>
  <uuid>{39bb271b-1d1e-468d-90b2-3b7372fd69f4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>71.81751825</value>
  <resolution>1.00000000</resolution>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>15</objectName>
  <x>711</x>
  <y>169</y>
  <width>63</width>
  <height>70</height>
  <uuid>{6de741f8-fcad-40f1-a00e-99a76d59533e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>15.00000000</maximum>
  <value>8.40000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>16</objectName>
  <x>781</x>
  <y>213</y>
  <width>24</width>
  <height>25</height>
  <uuid>{33472d13-029f-460f-80e9-a4d81d7714fb}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>45.14598540</value>
  <resolution>1.00000000</resolution>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>16</objectName>
  <x>779</x>
  <y>76</y>
  <width>29</width>
  <height>137</height>
  <uuid>{a2e7ded4-3023-4e39-b2aa-3b8dec49cfd1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <value>45.14598540</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>17</objectName>
  <x>812</x>
  <y>76</y>
  <width>29</width>
  <height>137</height>
  <uuid>{6c230699-740f-4715-aa95-62827f7af750}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <value>76.41605839</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>17</objectName>
  <x>814</x>
  <y>213</y>
  <width>24</width>
  <height>25</height>
  <uuid>{7eea344d-3094-4efa-b918-4c24b1be5061}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>76.41605839</value>
  <resolution>1.00000000</resolution>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>18</objectName>
  <x>844</x>
  <y>169</y>
  <width>63</width>
  <height>70</height>
  <uuid>{4f3ac209-506e-427e-b961-a167ea537f1b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>10.00000000</maximum>
  <value>5.60000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>670</x>
  <y>242</y>
  <width>55</width>
  <height>25</height>
  <uuid>{95de752d-1a12-4eea-9742-d55c3dd48ca6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>bandwidth</label>
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
  <x>813</x>
  <y>243</y>
  <width>55</width>
  <height>25</height>
  <uuid>{5caf3caf-ce6e-4579-911a-dd184a180188}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>velocity</label>
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
  <x>923</x>
  <y>242</y>
  <width>74</width>
  <height>24</height>
  <uuid>{a7a852de-cc7e-4783-9bbd-691328fdb325}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>duration short</label>
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
  <objectName>20</objectName>
  <x>915</x>
  <y>80</y>
  <width>39</width>
  <height>136</height>
  <uuid>{9d8faf86-11bd-40a0-b6f5-7955e59de425}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.06300000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.49705147</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>21</objectName>
  <x>957</x>
  <y>80</y>
  <width>39</width>
  <height>136</height>
  <uuid>{9ef83ade-4c0d-4939-8077-3efd94d74b2e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.06300000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.90354412</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>24</objectName>
  <x>998</x>
  <y>169</y>
  <width>63</width>
  <height>70</height>
  <uuid>{bc21ebf1-67f4-48b3-a754-7f4c598f441a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>10.00000000</maximum>
  <value>4.50000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>7</objectName>
  <x>920</x>
  <y>214</y>
  <width>33</width>
  <height>25</height>
  <uuid>{ba40ec71-4f03-4ca3-922c-2b344aaf46a7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>0.00000000</value>
  <resolution>0.00500000</resolution>
  <minimum>0.12500000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>21</objectName>
  <x>959</x>
  <y>213</y>
  <width>33</width>
  <height>25</height>
  <uuid>{b31aa1b7-0bd1-4f03-892e-f677ff845a41}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>0.90354412</value>
  <resolution>0.00100000</resolution>
  <minimum>0.06300000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>22</objectName>
  <x>1068</x>
  <y>83</y>
  <width>39</width>
  <height>136</height>
  <uuid>{04cac497-fc10-4777-babd-f1ccb851c699}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.50000000</minimum>
  <maximum>15.00000000</maximum>
  <value>0.50000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>23</objectName>
  <x>1113</x>
  <y>83</y>
  <width>39</width>
  <height>136</height>
  <uuid>{3dd83b9d-cb0b-4b5d-a48e-da88ee243da8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.50000000</minimum>
  <maximum>15.00000000</maximum>
  <value>2.09926471</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>19</objectName>
  <x>1104</x>
  <y>60</y>
  <width>20</width>
  <height>20</height>
  <uuid>{a0a4a189-6813-450b-951d-37980514dc70}</uuid>
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
  <x>1075</x>
  <y>245</y>
  <width>74</width>
  <height>24</height>
  <uuid>{e32a17dc-4d11-43e3-a30b-059e81fc3981}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>duration long</label>
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
  <objectName>7</objectName>
  <x>920</x>
  <y>214</y>
  <width>33</width>
  <height>25</height>
  <uuid>{4ba71543-11dc-4dd1-bf7b-8037ebdbddc8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>0.00000000</value>
  <resolution>0.00500000</resolution>
  <minimum>0.12500000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>20</objectName>
  <x>920</x>
  <y>214</y>
  <width>33</width>
  <height>25</height>
  <uuid>{91fa2a86-e9b0-4649-aab9-32b489b3429f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>0.49705147</value>
  <resolution>0.00100000</resolution>
  <minimum>0.06300000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>22</objectName>
  <x>1072</x>
  <y>218</y>
  <width>33</width>
  <height>25</height>
  <uuid>{df7bfa4c-a535-45b7-bd87-e13f4aaa6e7b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <resolution>0.05000000</resolution>
  <minimum>0.50000000</minimum>
  <maximum>15.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>23</objectName>
  <x>1116</x>
  <y>216</y>
  <width>33</width>
  <height>25</height>
  <uuid>{2dade4d0-490d-41ff-8112-61702159d9bc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>2.09926471</value>
  <resolution>0.00500000</resolution>
  <minimum>0.50000000</minimum>
  <maximum>15.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>54</x>
  <y>287</y>
  <width>555</width>
  <height>228</height>
  <uuid>{52052347-0ca1-4c60-92fb-9c8150a30c3d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>VOICE 3</label>
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
   <r>174</r>
   <g>178</g>
   <b>240</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>25</objectName>
  <x>87</x>
  <y>447</y>
  <width>24</width>
  <height>25</height>
  <uuid>{74dcfe02-e21a-4f05-b740-670708d0b7ae}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>28.59124088</value>
  <resolution>1.00000000</resolution>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>25</objectName>
  <x>85</x>
  <y>310</y>
  <width>29</width>
  <height>137</height>
  <uuid>{26b3f409-fd2e-4ce1-97ab-f4a8de686484}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <value>28.59124088</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>26</objectName>
  <x>118</x>
  <y>310</y>
  <width>29</width>
  <height>137</height>
  <uuid>{8d41cb10-0f5d-440f-b167-b2f33e416a6b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <value>68.13868613</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>26</objectName>
  <x>120</x>
  <y>447</y>
  <width>24</width>
  <height>25</height>
  <uuid>{688c23d6-c2aa-4e97-aaa0-e808f3510755}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>68.13868613</value>
  <resolution>1.00000000</resolution>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>27</objectName>
  <x>151</x>
  <y>403</y>
  <width>63</width>
  <height>70</height>
  <uuid>{68e25532-a071-41c0-b54d-9f1a545ef22e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>15.00000000</maximum>
  <value>7.80000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>28</objectName>
  <x>221</x>
  <y>447</y>
  <width>24</width>
  <height>25</height>
  <uuid>{1b9f78f5-1125-45cf-860b-e922a77cb14e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>35.94890511</value>
  <resolution>1.00000000</resolution>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>28</objectName>
  <x>219</x>
  <y>310</y>
  <width>29</width>
  <height>137</height>
  <uuid>{8f0441dc-b71b-4e4e-873a-e39499b57cce}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <value>35.94890511</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>29</objectName>
  <x>252</x>
  <y>310</y>
  <width>29</width>
  <height>137</height>
  <uuid>{460653be-f033-4225-8bc5-9ed2efe483fe}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <value>74.57664234</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>29</objectName>
  <x>254</x>
  <y>447</y>
  <width>24</width>
  <height>25</height>
  <uuid>{1ec79848-4e2d-4320-8f5b-149ecb226d30}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>74.57664234</value>
  <resolution>1.00000000</resolution>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>30</objectName>
  <x>284</x>
  <y>403</y>
  <width>63</width>
  <height>70</height>
  <uuid>{6402bb4c-7da5-42a0-b15e-1ca4981bf51c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>10.00000000</maximum>
  <value>5.30000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>110</x>
  <y>476</y>
  <width>55</width>
  <height>25</height>
  <uuid>{d1059792-380e-45db-abba-3f46d468577d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>bandwidth</label>
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
  <x>253</x>
  <y>477</y>
  <width>55</width>
  <height>25</height>
  <uuid>{168dd10c-3aec-4224-8f92-47d30433f2a4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>velocity</label>
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
  <x>363</x>
  <y>476</y>
  <width>74</width>
  <height>24</height>
  <uuid>{4afb1049-23f1-47aa-866b-f2917c219f26}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>duration short</label>
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
  <objectName>32</objectName>
  <x>354</x>
  <y>314</y>
  <width>39</width>
  <height>136</height>
  <uuid>{a4542947-19fc-4110-b2c6-59aa1b1607f0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.06300000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.06300000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>33</objectName>
  <x>397</x>
  <y>314</y>
  <width>39</width>
  <height>136</height>
  <uuid>{b3713ba6-86dc-4f58-94dd-4719ee28cc2f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.06300000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.06300000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>36</objectName>
  <x>438</x>
  <y>402</y>
  <width>63</width>
  <height>70</height>
  <uuid>{64510ea4-ff41-4825-8e86-1bff044d8037}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>10.00000000</maximum>
  <value>6.70000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>7</objectName>
  <x>360</x>
  <y>448</y>
  <width>33</width>
  <height>25</height>
  <uuid>{26d39649-f7fd-47ca-abde-d6b8ca5cbcfd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>0.00000000</value>
  <resolution>0.00500000</resolution>
  <minimum>0.12500000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>33</objectName>
  <x>399</x>
  <y>447</y>
  <width>33</width>
  <height>25</height>
  <uuid>{79edd895-ed9a-470e-9bde-2ddee8f567b7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>0.06300000</value>
  <resolution>0.00100000</resolution>
  <minimum>0.06300000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>34</objectName>
  <x>508</x>
  <y>317</y>
  <width>39</width>
  <height>136</height>
  <uuid>{1af8a86f-385a-4e0e-ac09-8e470ae10cc0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.50000000</minimum>
  <maximum>15.00000000</maximum>
  <value>0.50000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>35</objectName>
  <x>553</x>
  <y>317</y>
  <width>39</width>
  <height>136</height>
  <uuid>{369b64e3-a9eb-492a-8faf-230991167c56}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.50000000</minimum>
  <maximum>15.00000000</maximum>
  <value>0.50000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>31</objectName>
  <x>544</x>
  <y>294</y>
  <width>20</width>
  <height>20</height>
  <uuid>{6a16eddb-2324-4552-8a50-b03f27f66df0}</uuid>
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
  <x>515</x>
  <y>479</y>
  <width>74</width>
  <height>24</height>
  <uuid>{17f07398-44a6-429e-8b0e-a291dfdfad1b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>duration long</label>
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
  <objectName>7</objectName>
  <x>360</x>
  <y>448</y>
  <width>33</width>
  <height>25</height>
  <uuid>{1e6ff962-7051-433c-a1ac-91305e9ea901}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>0.00000000</value>
  <resolution>0.00500000</resolution>
  <minimum>0.12500000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>32</objectName>
  <x>360</x>
  <y>448</y>
  <width>33</width>
  <height>25</height>
  <uuid>{98c042b0-83e9-42e5-bc44-8928556b19b3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>0.06300000</value>
  <resolution>0.00100000</resolution>
  <minimum>0.06300000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>34</objectName>
  <x>511</x>
  <y>452</y>
  <width>33</width>
  <height>25</height>
  <uuid>{d5405a00-c4ad-49d3-8c49-df9bb95a3653}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <resolution>0.05000000</resolution>
  <minimum>0.50000000</minimum>
  <maximum>15.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>35</objectName>
  <x>556</x>
  <y>450</y>
  <width>33</width>
  <height>25</height>
  <uuid>{27fed4e8-9da1-499e-978e-71336d8041ac}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <resolution>0.00500000</resolution>
  <minimum>0.50000000</minimum>
  <maximum>15.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>616</x>
  <y>288</y>
  <width>555</width>
  <height>228</height>
  <uuid>{9e0671c6-2d91-41bf-8999-7e8bba159166}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>VOICE 4</label>
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
   <g>194</g>
   <b>156</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>37</objectName>
  <x>649</x>
  <y>448</y>
  <width>24</width>
  <height>25</height>
  <uuid>{638b469e-29d3-4b43-b621-12776a2ce666}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>58.02189781</value>
  <resolution>1.00000000</resolution>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>37</objectName>
  <x>647</x>
  <y>311</y>
  <width>29</width>
  <height>137</height>
  <uuid>{54434815-b00d-4852-a6d1-55df488f2231}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <value>58.02189781</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>38</objectName>
  <x>680</x>
  <y>311</y>
  <width>29</width>
  <height>137</height>
  <uuid>{41411742-f3c0-4b32-9a38-820c5fe25c19}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <value>71.81751825</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>38</objectName>
  <x>682</x>
  <y>448</y>
  <width>24</width>
  <height>25</height>
  <uuid>{f0eaa773-7383-472f-b2f7-7c98ca88da8a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>71.81751825</value>
  <resolution>1.00000000</resolution>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>39</objectName>
  <x>713</x>
  <y>404</y>
  <width>63</width>
  <height>70</height>
  <uuid>{c9589243-474f-4db8-8eec-611454577147}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>10.00000000</maximum>
  <value>6.90000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>40</objectName>
  <x>783</x>
  <y>448</y>
  <width>24</width>
  <height>25</height>
  <uuid>{dfd6edb8-7dd4-4f6a-9450-a75a9a31ea6a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>35.02919708</value>
  <resolution>1.00000000</resolution>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>40</objectName>
  <x>781</x>
  <y>311</y>
  <width>29</width>
  <height>137</height>
  <uuid>{4952c5c5-352a-493a-94e7-123dd5a2916e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <value>35.02919708</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>41</objectName>
  <x>814</x>
  <y>311</y>
  <width>29</width>
  <height>137</height>
  <uuid>{42b9bf9f-402c-4563-aeef-de17d5d70c2c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <value>67.21897810</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>41</objectName>
  <x>816</x>
  <y>448</y>
  <width>24</width>
  <height>25</height>
  <uuid>{510e697c-1d40-4334-bd00-ce68ee7e2e01}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>67.21897810</value>
  <resolution>1.00000000</resolution>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>42</objectName>
  <x>846</x>
  <y>404</y>
  <width>63</width>
  <height>70</height>
  <uuid>{daeab317-e70e-4106-948f-d49ee2f4dd8f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>10.00000000</maximum>
  <value>5.50000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>672</x>
  <y>477</y>
  <width>55</width>
  <height>25</height>
  <uuid>{b0458aef-6a58-4071-b461-00d7dff0f93a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>bandwidth</label>
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
  <x>815</x>
  <y>478</y>
  <width>55</width>
  <height>25</height>
  <uuid>{80dd94d7-5687-4a24-8da4-9cfcabc82d38}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>velocity</label>
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
  <x>925</x>
  <y>477</y>
  <width>74</width>
  <height>24</height>
  <uuid>{4349516f-39fc-4df6-8c3c-901dac024330}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>duration short</label>
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
  <objectName>44</objectName>
  <x>917</x>
  <y>316</y>
  <width>39</width>
  <height>136</height>
  <uuid>{d02a4e03-56b6-435e-bb52-27a7ec2fe2f7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.06300000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.25591176</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>45</objectName>
  <x>959</x>
  <y>315</y>
  <width>39</width>
  <height>136</height>
  <uuid>{ef6a6df2-a999-4db4-9fd0-067fbc00f818}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.06300000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.75097059</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>48</objectName>
  <x>1000</x>
  <y>403</y>
  <width>63</width>
  <height>70</height>
  <uuid>{682e1a16-4673-4624-9508-a03dd745007b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>10.00000000</maximum>
  <value>5.20000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>7</objectName>
  <x>922</x>
  <y>449</y>
  <width>33</width>
  <height>25</height>
  <uuid>{2106cff9-2c4a-438c-bec0-343831bf7632}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>0.00000000</value>
  <resolution>0.00500000</resolution>
  <minimum>0.12500000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>45</objectName>
  <x>963</x>
  <y>450</y>
  <width>33</width>
  <height>25</height>
  <uuid>{fa1cfe0a-63ee-432c-af62-77af9e645e77}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>0.75097059</value>
  <resolution>0.00100000</resolution>
  <minimum>0.06300000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>46</objectName>
  <x>1070</x>
  <y>318</y>
  <width>39</width>
  <height>136</height>
  <uuid>{508d3a2e-331d-4160-9a9f-d7c496801f95}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.50000000</minimum>
  <maximum>15.00000000</maximum>
  <value>0.50000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>47</objectName>
  <x>1115</x>
  <y>318</y>
  <width>39</width>
  <height>136</height>
  <uuid>{2630f648-2da5-415b-8e68-5d20e106ab32}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.50000000</minimum>
  <maximum>15.00000000</maximum>
  <value>2.50102941</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>43</objectName>
  <x>1106</x>
  <y>295</y>
  <width>20</width>
  <height>20</height>
  <uuid>{0716603e-0479-4bde-afe3-ed84cc2bde3b}</uuid>
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
  <x>1077</x>
  <y>480</y>
  <width>74</width>
  <height>24</height>
  <uuid>{445a3467-5a63-4c99-95a4-eab0abde30fc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>duration long</label>
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
  <objectName>44</objectName>
  <x>922</x>
  <y>449</y>
  <width>33</width>
  <height>25</height>
  <uuid>{123602c7-5aab-40e5-97cf-35ec9cb4d772}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>0.25591176</value>
  <resolution>0.00100000</resolution>
  <minimum>0.06300000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>46</objectName>
  <x>1073</x>
  <y>453</y>
  <width>33</width>
  <height>25</height>
  <uuid>{3049e9e0-ba5b-4701-8cd9-97c9c5de9773}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <resolution>0.05000000</resolution>
  <minimum>0.50000000</minimum>
  <maximum>15.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>47</objectName>
  <x>1118</x>
  <y>451</y>
  <width>33</width>
  <height>25</height>
  <uuid>{c224e1fb-8645-4c4d-b048-8f0101642171}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <value>2.50102941</value>
  <resolution>0.00500000</resolution>
  <minimum>0.50000000</minimum>
  <maximum>15.00000000</maximum>
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
WindowBounds: 133 310 1338 285
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioText {9, 14} {1239, 586} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {0, 0, 0} nobackground noborder 
ioText {56, 53} {555, 228} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {54784, 61440, 49408} nobackground noborder VOICE 1
ioText {90, 213} {24, 25} scroll 55.262774 1.000000 "1" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioSlider {88, 76} {29, 137} 1.000000 127.000000 55.262774 1
ioSlider {121, 76} {29, 137} 1.000000 127.000000 74.576642 2
ioText {123, 213} {24, 25} scroll 74.576642 1.000000 "2" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {154, 169} {63, 70} 15.000000 0.000000 0.010000 6.600000 3
ioText {224, 213} {24, 25} scroll 47.905109 1.000000 "4" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioSlider {222, 76} {29, 137} 1.000000 127.000000 47.905109 4
ioSlider {255, 76} {29, 137} 1.000000 127.000000 76.416058 5
ioText {257, 213} {24, 25} scroll 76.416058 1.000000 "5" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {287, 169} {63, 70} 15.000000 0.000000 0.010000 5.100000 6
ioText {113, 242} {55, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder bandwidth
ioText {256, 243} {55, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder velocity
ioText {366, 242} {74, 24} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder duration short
ioSlider {357, 80} {39, 136} 0.063000 1.000000 0.517721 8
ioSlider {400, 80} {39, 136} 0.063000 1.000000 0.862206 9
ioKnob {441, 168} {63, 70} 10.000000 0.000000 0.010000 6.800000 12
ioText {363, 214} {33, 25} scroll 0.000000 0.005000 "7" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {402, 213} {33, 25} scroll 0.862206 0.001000 "9" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioSlider {511, 83} {39, 136} 0.500000 15.000000 0.500000 10
ioSlider {556, 83} {39, 136} 0.500000 15.000000 3.058824 11
ioCheckbox {547, 60} {20, 20} off 7
ioText {518, 245} {74, 24} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder duration long
ioText {363, 214} {33, 25} scroll 0.000000 0.005000 "7" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {363, 214} {33, 25} scroll 0.517721 0.001000 "8" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {514, 218} {33, 25} scroll 0.500000 0.050000 "10" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {559, 218} {33, 25} scroll 3.058824 0.050000 "11" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {613, 53} {555, 228} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {48128, 61440, 60672} nobackground noborder VOICE 2
ioText {647, 213} {24, 25} scroll 58.021898 1.000000 "13" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioSlider {645, 76} {29, 137} 1.000000 127.000000 58.021898 13
ioSlider {678, 76} {29, 137} 1.000000 127.000000 71.817518 14
ioText {680, 213} {24, 25} scroll 71.817518 1.000000 "14" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {711, 169} {63, 70} 15.000000 0.000000 0.010000 8.400000 15
ioText {781, 213} {24, 25} scroll 45.145985 1.000000 "16" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioSlider {779, 76} {29, 137} 1.000000 127.000000 45.145985 16
ioSlider {812, 76} {29, 137} 1.000000 127.000000 76.416058 17
ioText {814, 213} {24, 25} scroll 76.416058 1.000000 "17" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {844, 169} {63, 70} 10.000000 0.000000 0.010000 5.600000 18
ioText {670, 242} {55, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder bandwidth
ioText {813, 243} {55, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder velocity
ioText {923, 242} {74, 24} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder duration short
ioSlider {915, 80} {39, 136} 0.063000 1.000000 0.497051 20
ioSlider {957, 80} {39, 136} 0.063000 1.000000 0.903544 21
ioKnob {998, 169} {63, 70} 10.000000 0.000000 0.010000 4.500000 24
ioText {920, 214} {33, 25} scroll 0.000000 0.005000 "7" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {959, 213} {33, 25} scroll 0.903544 0.001000 "21" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioSlider {1068, 83} {39, 136} 0.500000 15.000000 0.500000 22
ioSlider {1113, 83} {39, 136} 0.500000 15.000000 2.099265 23
ioCheckbox {1104, 60} {20, 20} off 19
ioText {1075, 245} {74, 24} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder duration long
ioText {920, 214} {33, 25} scroll 0.000000 0.005000 "7" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {920, 214} {33, 25} scroll 0.497051 0.001000 "20" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {1072, 218} {33, 25} scroll 0.500000 0.050000 "22" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {1116, 216} {33, 25} scroll 2.099265 0.005000 "23" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {54, 287} {555, 228} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {44544, 45568, 61440} nobackground noborder VOICE 3
ioText {87, 447} {24, 25} scroll 28.591241 1.000000 "25" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioSlider {85, 310} {29, 137} 1.000000 127.000000 28.591241 25
ioSlider {118, 310} {29, 137} 1.000000 127.000000 68.138686 26
ioText {120, 447} {24, 25} scroll 68.138686 1.000000 "26" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {151, 403} {63, 70} 15.000000 0.000000 0.010000 7.800000 27
ioText {221, 447} {24, 25} scroll 35.948905 1.000000 "28" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioSlider {219, 310} {29, 137} 1.000000 127.000000 35.948905 28
ioSlider {252, 310} {29, 137} 1.000000 127.000000 74.576642 29
ioText {254, 447} {24, 25} scroll 74.576642 1.000000 "29" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {284, 403} {63, 70} 10.000000 0.000000 0.010000 5.300000 30
ioText {110, 476} {55, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder bandwidth
ioText {253, 477} {55, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder velocity
ioText {363, 476} {74, 24} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder duration short
ioSlider {354, 314} {39, 136} 0.063000 1.000000 0.063000 32
ioSlider {397, 314} {39, 136} 0.063000 1.000000 0.063000 33
ioKnob {438, 402} {63, 70} 10.000000 0.000000 0.010000 6.700000 36
ioText {360, 448} {33, 25} scroll 0.000000 0.005000 "7" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {399, 447} {33, 25} scroll 0.063000 0.001000 "33" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioSlider {508, 317} {39, 136} 0.500000 15.000000 0.500000 34
ioSlider {553, 317} {39, 136} 0.500000 15.000000 0.500000 35
ioCheckbox {544, 294} {20, 20} off 31
ioText {515, 479} {74, 24} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder duration long
ioText {360, 448} {33, 25} scroll 0.000000 0.005000 "7" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {360, 448} {33, 25} scroll 0.063000 0.001000 "32" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {511, 452} {33, 25} scroll 0.500000 0.050000 "34" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {556, 450} {33, 25} scroll 0.500000 0.005000 "35" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {616, 288} {555, 228} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 49664, 39936} nobackground noborder VOICE 4
ioText {649, 448} {24, 25} scroll 58.021898 1.000000 "37" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioSlider {647, 311} {29, 137} 1.000000 127.000000 58.021898 37
ioSlider {680, 311} {29, 137} 1.000000 127.000000 71.817518 38
ioText {682, 448} {24, 25} scroll 71.817518 1.000000 "38" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {713, 404} {63, 70} 10.000000 0.000000 0.010000 6.900000 39
ioText {783, 448} {24, 25} scroll 35.029197 1.000000 "40" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioSlider {781, 311} {29, 137} 1.000000 127.000000 35.029197 40
ioSlider {814, 311} {29, 137} 1.000000 127.000000 67.218978 41
ioText {816, 448} {24, 25} scroll 67.218978 1.000000 "41" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {846, 404} {63, 70} 10.000000 0.000000 0.010000 5.500000 42
ioText {672, 477} {55, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder bandwidth
ioText {815, 478} {55, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder velocity
ioText {925, 477} {74, 24} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder duration short
ioSlider {917, 316} {39, 136} 0.063000 1.000000 0.255912 44
ioSlider {959, 315} {39, 136} 0.063000 1.000000 0.750971 45
ioKnob {1000, 403} {63, 70} 10.000000 0.000000 0.010000 5.200000 48
ioText {922, 449} {33, 25} scroll 0.000000 0.005000 "7" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {963, 450} {33, 25} scroll 0.750971 0.001000 "45" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioSlider {1070, 318} {39, 136} 0.500000 15.000000 0.500000 46
ioSlider {1115, 318} {39, 136} 0.500000 15.000000 2.501029 47
ioCheckbox {1106, 295} {20, 20} off 43
ioText {1077, 480} {74, 24} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder duration long
ioText {922, 449} {33, 25} scroll 0.255912 0.001000 "44" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {1073, 453} {33, 25} scroll 0.500000 0.050000 "46" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {1118, 451} {33, 25} scroll 2.501029 0.005000 "47" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
</MacGUI>
