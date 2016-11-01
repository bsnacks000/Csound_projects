<CsoundSynthesizer>
<CsOptions>
;--displays
</CsOptions>
<CsInstruments>

ksmps =128
nchnls = 1
0dbfs = 20000

gi_HIST ftgen 0, 0, -200, -41,     1,.3,   2,.3,    7,.3 


instr 1
gk_chn duserrnd gi_HIST
endin

#define VOICE(voice_num'chn'num'vel'dur'pause'num_amp'num_min'num_max'vel_amp'vel_min'vel_max'dur_amp'dur_min'dur_max'pause_amp'pause_min'pause_max')#
instr $voice_num

kchn = $chn	
knum invalue $num
kvel invalue $vel
kdur invalue $dur
kpause invalue $pause

kamp_num invalue $num_amp
kcpsMin_num invalue $num_min
kcpsMax_num invalue $num_max

kamp_vel invalue $vel_amp
kcpsMin_vel invalue $vel_min
kcpsMax_vel invalue $vel_max

kamp_dur invalue $dur_amp
kcpsMin_dur invalue $dur_min
kcpsMax_dur invalue $dur_max

kamp_pause invalue $pause_amp
kcpsMin_pause invalue $pause_min
kcpsMax_pause invalue $pause_max


kjitter_num jitter kamp_num, kcpsMin_num, kcpsMax_num
kjitter_vel jitter kamp_vel, kcpsMin_vel, kcpsMax_vel
kjitter_dur jitter kamp_dur, kcpsMin_dur, kcpsMax_dur
kjitter_pause jitter kamp_pause, kcpsMin_pause, kcpsMax_pause

moscil kchn, int(knum) + kjitter_num, kvel + kjitter_vel, kdur + kjitter_dur, kpause + kjitter_pause
endin
#


$VOICE(10'gk_chn'1'2'3'4'5'6'7'8'9'10'11'12'13'14'15'16')


;instr 10
;
;kchn = gk_chn	
;knum invalue "knum_1"
;kvel invalue "kvel_1"
;kdur invalue "kdur_1"
;kpause invalue "kpause_1"
;
;
;kamp_num_1 invalue "kamp_num_1"
;kcpsMin_num_1 invalue "kcpsMin_num_1"
;kcpsMax_num_1 invalue "kcpsMax_num_1"
;
;kamp_vel_1 invalue "kamp_vel_1"
;kcpsMin_vel_1 invalue "kcpsMin_vel_1"
;kcpsMax_vel_1 invalue "kcpsMax_vel_1"
;
;kamp_dur_1 invalue "kamp_dur_1"
;kcpsMin_dur_1 invalue "kcpsMin_dur_1"
;kcpsMax_dur_1 invalue "kcpsMax_dur_1"
;
;kamp_pause_1 invalue "kamp_pause_1"
;kcpsMin_pause_1 invalue "kcpsMin_pause_1"
;kcpsMax_pause_1 invalue "kcpsMax_pause_1"
;
;
;kjitter_num jitter kamp_num_1, kcpsMin_num_1, kcpsMax_num_1
;kjitter_vel jitter kamp_vel_1, kcpsMin_vel_1, kcpsMax_vel_1
;kjitter_dur jitter kamp_dur_1, kcpsMin_dur_1, kcpsMax_dur_1
;kjitter_pause jitter kamp_pause_1, kcpsMin_pause_1, kcpsMax_pause_1
;
;moscil kchn, int(knum) + kjitter_num, kvel + kjitter_vel, kdur + kjitter_dur, kpause + kjitter_pause
;
;endin

</CsInstruments>
<CsScore>
i1   0 60

i10  0 60

f 0 3

</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>725</x>
 <y>414</y>
 <width>947</width>
 <height>239</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>6</x>
  <y>0</y>
  <width>463</width>
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
 <bsbObject version="2" type="BSBKnob">
  <objectName>1</objectName>
  <x>31</x>
  <y>35</y>
  <width>81</width>
  <height>78</height>
  <uuid>{f36f28db-5b61-4089-92cd-dc63588e868e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>127.00000000</maximum>
  <value>54.61000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>1</objectName>
  <x>54</x>
  <y>114</y>
  <width>34</width>
  <height>24</height>
  <uuid>{b9801ff7-86b0-44c8-821d-1cd546eaadab}</uuid>
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
  <value>54.61000000</value>
  <resolution>1.00000000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>127.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>2</objectName>
  <x>122</x>
  <y>35</y>
  <width>79</width>
  <height>77</height>
  <uuid>{a824a0fe-7c95-43c8-847c-0e35a8edc6e4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>127.00000000</maximum>
  <value>49.53000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>2</objectName>
  <x>145</x>
  <y>113</y>
  <width>34</width>
  <height>24</height>
  <uuid>{e545fd5e-4fc3-41a7-820f-eff505406c31}</uuid>
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
  <value>49.53000000</value>
  <resolution>1.00000000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>127.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>3</objectName>
  <x>204</x>
  <y>25</y>
  <width>127</width>
  <height>109</height>
  <uuid>{fb887c4b-cd76-4f43-beff-9d398d1b7c7b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.12500000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.41375000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>4</objectName>
  <x>331</x>
  <y>25</y>
  <width>127</width>
  <height>109</height>
  <uuid>{03e82531-cc97-4ba5-8c84-d4c13ab3de63}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>3</objectName>
  <x>250</x>
  <y>134</y>
  <width>42</width>
  <height>29</height>
  <uuid>{54654a10-6c67-4e3a-9fe3-74acc60ded5c}</uuid>
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
  <value>0.41375000</value>
  <resolution>0.00100000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>127.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>4</objectName>
  <x>374</x>
  <y>134</y>
  <width>43</width>
  <height>28</height>
  <uuid>{2a654745-bed7-44f9-8a03-f271cd1fd92f}</uuid>
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
  <value>0.00000000</value>
  <resolution>0.05000000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>127.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>6</objectName>
  <x>65</x>
  <y>142</y>
  <width>42</width>
  <height>24</height>
  <uuid>{91e6dd1f-96dd-4b4c-909a-724c7fe3a94d}</uuid>
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
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.50000000</resolution>
  <minimum>0</minimum>
  <maximum>10</maximum>
  <randomizable group="0">false</randomizable>
  <value>1</value>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>7</objectName>
  <x>66</x>
  <y>168</y>
  <width>42</width>
  <height>24</height>
  <uuid>{23995366-b8af-47bc-966a-2c5ea7305986}</uuid>
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
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.50000000</resolution>
  <minimum>0</minimum>
  <maximum>10</maximum>
  <randomizable group="0">false</randomizable>
  <value>4</value>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>9</objectName>
  <x>166</x>
  <y>140</y>
  <width>42</width>
  <height>24</height>
  <uuid>{ea944287-845a-4663-abf2-bff1a51d73c8}</uuid>
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
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.50000000</resolution>
  <minimum>0</minimum>
  <maximum>10</maximum>
  <randomizable group="0">false</randomizable>
  <value>1</value>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>10</objectName>
  <x>166</x>
  <y>167</y>
  <width>42</width>
  <height>24</height>
  <uuid>{8baab38f-666b-41c4-a64c-9257202ddfec}</uuid>
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
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.50000000</resolution>
  <minimum>0</minimum>
  <maximum>10</maximum>
  <randomizable group="0">false</randomizable>
  <value>4.5</value>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>12</objectName>
  <x>272</x>
  <y>165</y>
  <width>42</width>
  <height>24</height>
  <uuid>{7b03861a-076d-4eb0-8958-8a10e57ebf23}</uuid>
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
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.50000000</resolution>
  <minimum>0</minimum>
  <maximum>10</maximum>
  <randomizable group="0">false</randomizable>
  <value>1.5</value>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>13</objectName>
  <x>272</x>
  <y>192</y>
  <width>42</width>
  <height>24</height>
  <uuid>{5713c818-32b7-4281-a2b5-b58f2ece6ce5}</uuid>
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
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.50000000</resolution>
  <minimum>0</minimum>
  <maximum>10</maximum>
  <randomizable group="0">false</randomizable>
  <value>3</value>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>15</objectName>
  <x>405</x>
  <y>169</y>
  <width>42</width>
  <height>24</height>
  <uuid>{80663410-9776-4154-8f0a-c31bf3ff6e15}</uuid>
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
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.50000000</resolution>
  <minimum>0</minimum>
  <maximum>10</maximum>
  <randomizable group="0">false</randomizable>
  <value>1.5</value>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>16</objectName>
  <x>405</x>
  <y>196</y>
  <width>42</width>
  <height>24</height>
  <uuid>{96e58549-f327-4e89-b10b-78185dcd4ee2}</uuid>
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
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.50000000</resolution>
  <minimum>0</minimum>
  <maximum>10</maximum>
  <randomizable group="0">false</randomizable>
  <value>2</value>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>57</x>
  <y>14</y>
  <width>35</width>
  <height>22</height>
  <uuid>{d3de2afd-fded-442d-a640-ca8ba81e3c47}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>note</label>
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
  <x>136</x>
  <y>11</y>
  <width>46</width>
  <height>22</height>
  <uuid>{e7a1d2f3-60b5-424a-ba0a-26486dd09317}</uuid>
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
  <x>244</x>
  <y>5</y>
  <width>46</width>
  <height>22</height>
  <uuid>{9d8997de-1600-4e90-bcb7-75510403914e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>duration</label>
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
  <x>377</x>
  <y>5</y>
  <width>46</width>
  <height>22</height>
  <uuid>{d09dac40-d753-4233-a284-221ec43fa1f8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>pause</label>
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
  <objectName>5</objectName>
  <x>34</x>
  <y>149</y>
  <width>30</width>
  <height>37</height>
  <uuid>{a804096b-aec3-44c6-9a80-a15df03cb87a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>18</fontsize>
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
  <value>11.90000000</value>
  <resolution>1.00000000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>30.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>8</objectName>
  <x>134</x>
  <y>149</y>
  <width>32</width>
  <height>34</height>
  <uuid>{7d2c4533-642c-4706-97ad-32c823ce2db7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>18</fontsize>
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
  <value>12.00000000</value>
  <resolution>1.00000000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>30.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>14</objectName>
  <x>355</x>
  <y>176</y>
  <width>44</width>
  <height>33</height>
  <uuid>{1aaf5460-027a-406f-b518-d1a1b87b5cb5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>18</fontsize>
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
  <resolution>0.00100000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>11</objectName>
  <x>224</x>
  <y>174</y>
  <width>44</width>
  <height>33</height>
  <uuid>{44c621ba-443d-4e30-8067-898d4ee44eb4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>18</fontsize>
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
  <resolution>0.01000000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>474</x>
  <y>2</y>
  <width>463</width>
  <height>228</height>
  <uuid>{e885ad3d-55b9-4621-98e4-008f6c219d99}</uuid>
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
   <r>208</r>
   <g>240</g>
   <b>234</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>17</objectName>
  <x>502</x>
  <y>36</y>
  <width>81</width>
  <height>78</height>
  <uuid>{03fda2aa-ad94-40e6-aa52-5b21827d9395}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>127.00000000</maximum>
  <value>71.12000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>17</objectName>
  <x>525</x>
  <y>115</y>
  <width>34</width>
  <height>24</height>
  <uuid>{8e2f359c-5a29-4133-9783-8a59d026d03d}</uuid>
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
  <value>71.12000000</value>
  <resolution>1.00000000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>127.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>18</objectName>
  <x>593</x>
  <y>36</y>
  <width>79</width>
  <height>77</height>
  <uuid>{f16bf356-14a3-4959-946f-42ff4393975c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>127.00000000</maximum>
  <value>64.77000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>18</objectName>
  <x>616</x>
  <y>114</y>
  <width>34</width>
  <height>24</height>
  <uuid>{d38b2c89-6e7e-4952-8ebd-039f82c0be54}</uuid>
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
  <value>64.77000000</value>
  <resolution>1.00000000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>127.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>19</objectName>
  <x>675</x>
  <y>26</y>
  <width>127</width>
  <height>109</height>
  <uuid>{c91097fe-7269-4789-be00-dd63eea6626e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.12500000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.19125000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>20</objectName>
  <x>802</x>
  <y>26</y>
  <width>127</width>
  <height>109</height>
  <uuid>{f9dbbec3-40dd-4abf-805e-f30900b692f7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.12500000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.24750000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>19</objectName>
  <x>722</x>
  <y>135</y>
  <width>42</width>
  <height>29</height>
  <uuid>{e1a0904d-e5d4-4ed1-854d-0e7a45bb5cd3}</uuid>
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
  <value>0.19125000</value>
  <resolution>0.00100000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>127.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>20</objectName>
  <x>845</x>
  <y>135</y>
  <width>43</width>
  <height>28</height>
  <uuid>{241d23ff-e89f-4326-b54e-f66c2bed8771}</uuid>
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
  <value>0.24750000</value>
  <resolution>0.00100000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>127.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>22</objectName>
  <x>536</x>
  <y>143</y>
  <width>42</width>
  <height>24</height>
  <uuid>{05cc103a-bfea-4f96-bc95-535b28043ee4}</uuid>
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
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.50000000</resolution>
  <minimum>0</minimum>
  <maximum>10</maximum>
  <randomizable group="0">false</randomizable>
  <value>1</value>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>23</objectName>
  <x>537</x>
  <y>169</y>
  <width>42</width>
  <height>24</height>
  <uuid>{529bd44c-f879-4032-9d07-23acf8c3eaaa}</uuid>
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
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.50000000</resolution>
  <minimum>0</minimum>
  <maximum>10</maximum>
  <randomizable group="0">false</randomizable>
  <value>1.5</value>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>25</objectName>
  <x>637</x>
  <y>141</y>
  <width>42</width>
  <height>24</height>
  <uuid>{e15ca091-9a65-4bc0-b341-03317b3b9831}</uuid>
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
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.50000000</resolution>
  <minimum>0</minimum>
  <maximum>10</maximum>
  <randomizable group="0">false</randomizable>
  <value>1</value>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>26</objectName>
  <x>637</x>
  <y>168</y>
  <width>42</width>
  <height>24</height>
  <uuid>{8e11ad73-9595-486f-a93f-756f663ee914}</uuid>
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
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.50000000</resolution>
  <minimum>0</minimum>
  <maximum>10</maximum>
  <randomizable group="0">false</randomizable>
  <value>2</value>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>28</objectName>
  <x>743</x>
  <y>166</y>
  <width>42</width>
  <height>24</height>
  <uuid>{bfec6998-0333-4487-b420-a72704ea5865}</uuid>
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
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.50000000</resolution>
  <minimum>0</minimum>
  <maximum>10</maximum>
  <randomizable group="0">false</randomizable>
  <value>1.5</value>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>29</objectName>
  <x>743</x>
  <y>193</y>
  <width>42</width>
  <height>24</height>
  <uuid>{4adade86-9aa8-4770-9ad3-c99cced59bd0}</uuid>
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
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.50000000</resolution>
  <minimum>0</minimum>
  <maximum>10</maximum>
  <randomizable group="0">false</randomizable>
  <value>3</value>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>31</objectName>
  <x>876</x>
  <y>170</y>
  <width>42</width>
  <height>24</height>
  <uuid>{fcfd270a-42d6-4f53-8114-2859bf31d9b8}</uuid>
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
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.50000000</resolution>
  <minimum>0</minimum>
  <maximum>10</maximum>
  <randomizable group="0">false</randomizable>
  <value>1.5</value>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>32</objectName>
  <x>876</x>
  <y>197</y>
  <width>42</width>
  <height>24</height>
  <uuid>{12083eae-6d51-4031-8b84-847191944d6a}</uuid>
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
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.50000000</resolution>
  <minimum>0</minimum>
  <maximum>10</maximum>
  <randomizable group="0">false</randomizable>
  <value>2</value>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>528</x>
  <y>15</y>
  <width>35</width>
  <height>22</height>
  <uuid>{a762b056-5e62-4633-8f96-df2cccc32990}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>note</label>
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
  <x>607</x>
  <y>12</y>
  <width>46</width>
  <height>22</height>
  <uuid>{7df5c1e5-7e90-4604-a98d-fb1d6b308deb}</uuid>
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
  <x>715</x>
  <y>6</y>
  <width>46</width>
  <height>22</height>
  <uuid>{1fb8ef7e-f198-4d3f-b8e8-03cfe787573b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>duration</label>
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
  <x>848</x>
  <y>6</y>
  <width>46</width>
  <height>22</height>
  <uuid>{867c3bff-2870-4be6-8802-59f4549b8ba1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>pause</label>
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
  <objectName>21</objectName>
  <x>504</x>
  <y>148</y>
  <width>30</width>
  <height>37</height>
  <uuid>{0e8eb2f7-e89c-4e9c-9c2e-19f2891937e8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>18</fontsize>
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
  <value>12.90000000</value>
  <resolution>1.00000000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>30.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>24</objectName>
  <x>605</x>
  <y>150</y>
  <width>32</width>
  <height>34</height>
  <uuid>{69d1241f-8d44-4759-a56d-19a828f424e9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>18</fontsize>
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
  <value>12.00000000</value>
  <resolution>1.00000000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>30.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>30</objectName>
  <x>826</x>
  <y>177</y>
  <width>44</width>
  <height>33</height>
  <uuid>{927f3921-a5d9-44b4-8529-a42ac02e33d4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>18</fontsize>
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
  <value>0.24800000</value>
  <resolution>0.00100000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>27</objectName>
  <x>696</x>
  <y>175</y>
  <width>44</width>
  <height>33</height>
  <uuid>{bfe3238b-2e4f-433d-ae40-eef53fe22a61}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>18</fontsize>
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
  <resolution>0.01000000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>18</x>
  <y>199</y>
  <width>80</width>
  <height>25</height>
  <uuid>{2bb17a22-a448-4640-a16b-59a66dd31534}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>chn 1 -16</label>
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
  <x>482</x>
  <y>200</y>
  <width>80</width>
  <height>25</height>
  <uuid>{fbbd83c5-7813-4a7e-9ed6-723e3e75e450}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>chn 27 - 32</label>
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
WindowBounds: 725 414 947 239
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioText {6, 0} {463, 228} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {54784, 61440, 49408} nobackground noborder VOICE 1
ioKnob {31, 35} {81, 78} 127.000000 0.000000 0.010000 54.610000 1
ioText {54, 114} {34, 24} scroll 54.610000 1.000000 "1" left "Arial" 15 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {122, 35} {79, 77} 127.000000 0.000000 0.010000 49.530000 2
ioText {145, 113} {34, 24} scroll 49.530000 1.000000 "2" left "Arial" 15 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {204, 25} {127, 109} 1.000000 0.125000 0.010000 0.413750 3
ioKnob {331, 25} {127, 109} 1.000000 0.000000 0.010000 0.000000 4
ioText {250, 134} {42, 29} scroll 0.413750 0.001000 "3" left "Arial" 15 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {374, 134} {43, 28} scroll 0.000000 0.050000 "4" left "Arial" 15 {0, 0, 0} {65280, 65280, 65280} background noborder 0.00000000
ioText {65, 142} {42, 24} editnum 1.000000 0.500000 "6" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 1.000000
ioText {66, 168} {42, 24} editnum 4.000000 0.500000 "7" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 4.000000
ioText {166, 140} {42, 24} editnum 1.000000 0.500000 "9" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 1.000000
ioText {166, 167} {42, 24} editnum 4.500000 0.500000 "10" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 4.500000
ioText {272, 165} {42, 24} editnum 1.500000 0.500000 "12" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 1.500000
ioText {272, 192} {42, 24} editnum 3.000000 0.500000 "13" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 3.000000
ioText {405, 169} {42, 24} editnum 1.500000 0.500000 "15" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 1.500000
ioText {405, 196} {42, 24} editnum 2.000000 0.500000 "16" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 2.000000
ioText {57, 14} {35, 22} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder note
ioText {136, 11} {46, 22} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder velocity
ioText {244, 5} {46, 22} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder duration
ioText {377, 5} {46, 22} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder pause
ioText {34, 149} {30, 37} scroll 11.900000 1.000000 "5" left "Arial" 18 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {134, 149} {32, 34} scroll 12.000000 1.000000 "8" left "Arial" 18 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {355, 176} {44, 33} scroll 0.000000 0.001000 "14" left "Arial" 18 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {224, 174} {44, 33} scroll 0.500000 0.010000 "11" left "Arial" 18 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {474, 2} {463, 228} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {53248, 61440, 59904} nobackground noborder VOICE 2
ioKnob {502, 36} {81, 78} 127.000000 0.000000 0.010000 71.120000 17
ioText {525, 115} {34, 24} scroll 71.120000 1.000000 "17" left "Arial" 15 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {593, 36} {79, 77} 127.000000 0.000000 0.010000 64.770000 18
ioText {616, 114} {34, 24} scroll 64.770000 1.000000 "18" left "Arial" 15 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {675, 26} {127, 109} 1.000000 0.125000 0.010000 0.191250 19
ioKnob {802, 26} {127, 109} 1.000000 0.125000 0.010000 0.247500 20
ioText {722, 135} {42, 29} scroll 0.191250 0.001000 "19" left "Arial" 15 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {845, 135} {43, 28} scroll 0.247500 0.001000 "20" left "Arial" 15 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {536, 143} {42, 24} editnum 1.000000 0.500000 "22" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 1.000000
ioText {537, 169} {42, 24} editnum 1.500000 0.500000 "23" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 1.500000
ioText {637, 141} {42, 24} editnum 1.000000 0.500000 "25" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 1.000000
ioText {637, 168} {42, 24} editnum 2.000000 0.500000 "26" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 2.000000
ioText {743, 166} {42, 24} editnum 1.500000 0.500000 "28" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 1.500000
ioText {743, 193} {42, 24} editnum 3.000000 0.500000 "29" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 3.000000
ioText {876, 170} {42, 24} editnum 1.500000 0.500000 "31" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 1.500000
ioText {876, 197} {42, 24} editnum 2.000000 0.500000 "32" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 2.000000
ioText {528, 15} {35, 22} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder note
ioText {607, 12} {46, 22} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder velocity
ioText {715, 6} {46, 22} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder duration
ioText {848, 6} {46, 22} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder pause
ioText {504, 148} {30, 37} scroll 12.900000 1.000000 "21" left "Arial" 18 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {605, 150} {32, 34} scroll 12.000000 1.000000 "24" left "Arial" 18 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {826, 177} {44, 33} scroll 0.248000 0.001000 "30" left "Arial" 18 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {696, 175} {44, 33} scroll 0.500000 0.010000 "27" left "Arial" 18 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {88, 315} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder chn 1 -16
ioText {482, 200} {80, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder chn 27 - 32
</MacGUI>
