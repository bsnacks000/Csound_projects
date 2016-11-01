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



instr 10

kchn = gk_chn	
knum invalue "knum_1"
kvel invalue "kvel_1"
kdur invalue "kdur_1"
kpause invalue "kpause_1"


kamp_num_1 invalue "kamp_num_1"
kcpsMin_num_1 invalue "kcpsMin_num_1"
kcpsMax_num_1 invalue "kcpsMax_num_1"

kamp_vel_1 invalue "kamp_vel_1"
kcpsMin_vel_1 invalue "kcpsMin_vel_1"
kcpsMax_vel_1 invalue "kcpsMax_vel_1"

kamp_dur_1 invalue "kamp_dur_1"
kcpsMin_dur_1 invalue "kcpsMin_dur_1"
kcpsMax_dur_1 invalue "kcpsMax_dur_1"

kamp_pause_1 invalue "kamp_pause_1"
kcpsMin_pause_1 invalue "kcpsMin_pause_1"
kcpsMax_pause_1 invalue "kcpsMax_pause_1"


kjitter_num jitter kamp_num_1, kcpsMin_num_1, kcpsMax_num_1
kjitter_vel jitter kamp_vel_1, kcpsMin_vel_1, kcpsMax_vel_1
kjitter_dur jitter kamp_dur_1, kcpsMin_dur_1, kcpsMax_dur_1
kjitter_pause jitter kamp_pause_1, kcpsMin_pause_1, kcpsMax_pause_1

moscil kchn, int(knum) + kjitter_num, kvel + kjitter_vel, kdur + kjitter_dur, kpause + kjitter_pause

endin

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
 <x>974</x>
 <y>72</y>
 <width>944</width>
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
  <x>3</x>
  <y>1</y>
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
  <objectName>knum_1</objectName>
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
  <value>67.31000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>knum_1</objectName>
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
  <value>67.31000000</value>
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
  <objectName>kvel_1</objectName>
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
  <value>64.77000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kvel_1</objectName>
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
  <objectName>kdur_1</objectName>
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
  <value>0.19125000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kpause_1</objectName>
  <x>331</x>
  <y>25</y>
  <width>127</width>
  <height>109</height>
  <uuid>{03e82531-cc97-4ba5-8c84-d4c13ab3de63}</uuid>
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
  <objectName>kdur_1</objectName>
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
  <objectName>kpause_1</objectName>
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
  <objectName>kcpsMin_num_1</objectName>
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
  <objectName>kcpsMax_num_1</objectName>
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
  <value>1.5</value>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>kcpsMin_vel_1</objectName>
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
  <objectName>kcpsMax_vel_1</objectName>
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
  <value>2</value>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName> kcpsMin_dur_1</objectName>
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
  <objectName>kcpsMax_dur_1</objectName>
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
  <objectName>kcpsMin_pause_1</objectName>
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
  <objectName>kcpsMax_pause_1</objectName>
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
  <objectName>kamp_num_1</objectName>
  <x>36</x>
  <y>149</y>
  <width>27</width>
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
  <objectName>kamp_vel_1</objectName>
  <x>134</x>
  <y>149</y>
  <width>29</width>
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
  <objectName>kamp_pause_1</objectName>
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
  <objectName>kamp_dur_1</objectName>
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
  <x>468</x>
  <y>1</y>
  <width>463</width>
  <height>228</height>
  <uuid>{798f9253-0906-4e9b-bff9-e6e01febd5b8}</uuid>
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
   <r>187</r>
   <g>210</g>
   <b>240</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>knum_2</objectName>
  <x>496</x>
  <y>35</y>
  <width>81</width>
  <height>78</height>
  <uuid>{d4305416-471c-409d-8793-d9f736043d04}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <value>67.31000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>knum_2</objectName>
  <x>519</x>
  <y>114</y>
  <width>34</width>
  <height>24</height>
  <uuid>{c66baf89-7840-49f1-a5d6-925e44efbc2c}</uuid>
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
  <value>67.31000000</value>
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
  <objectName>kvel_2</objectName>
  <x>587</x>
  <y>35</y>
  <width>79</width>
  <height>77</height>
  <uuid>{21c4e7e2-aba7-4701-81ba-4f53faaa39a9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <value>64.77000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>kvel_2</objectName>
  <x>610</x>
  <y>113</y>
  <width>34</width>
  <height>24</height>
  <uuid>{201d2518-b7c2-4ebc-9cae-10865e824e56}</uuid>
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
  <objectName>kdur_2</objectName>
  <x>669</x>
  <y>25</y>
  <width>127</width>
  <height>109</height>
  <uuid>{1ab623a0-1816-4af8-8133-a22fd44c8f63}</uuid>
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
  <objectName>kpause_2</objectName>
  <x>796</x>
  <y>25</y>
  <width>127</width>
  <height>109</height>
  <uuid>{3b71ac6d-6b55-4119-84df-ac05133536bd}</uuid>
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
  <objectName>kdur_2</objectName>
  <x>715</x>
  <y>134</y>
  <width>42</width>
  <height>29</height>
  <uuid>{78b8599f-db0a-45a4-9394-927d9455136e}</uuid>
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
  <objectName>kpause_2</objectName>
  <x>839</x>
  <y>134</y>
  <width>43</width>
  <height>28</height>
  <uuid>{70e28e7c-2d99-4df2-9257-d09f5b1591dc}</uuid>
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
  <objectName>kcpsMin_num_2</objectName>
  <x>530</x>
  <y>142</y>
  <width>42</width>
  <height>24</height>
  <uuid>{e89bee3b-1ad7-4408-9979-71e337dd9d51}</uuid>
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
  <objectName>kcpsMax_num_2</objectName>
  <x>531</x>
  <y>168</y>
  <width>42</width>
  <height>24</height>
  <uuid>{c0f1e8dd-7608-4cb8-8236-7d0510500bb2}</uuid>
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
  <objectName>kcpsMin_vel_2</objectName>
  <x>631</x>
  <y>140</y>
  <width>42</width>
  <height>24</height>
  <uuid>{8030b263-dc0a-42eb-8dad-4c50cd76456e}</uuid>
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
  <objectName>kcpsMax_vel_2</objectName>
  <x>631</x>
  <y>166</y>
  <width>42</width>
  <height>24</height>
  <uuid>{db78a2a7-9053-4070-868b-684302d159ae}</uuid>
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
  <objectName> kcpsMin_dur_2</objectName>
  <x>737</x>
  <y>165</y>
  <width>42</width>
  <height>24</height>
  <uuid>{c9ac8102-9fab-4f3b-8ce0-0ea8fd7d3393}</uuid>
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
  <objectName>kcpsMax_dur_2</objectName>
  <x>737</x>
  <y>192</y>
  <width>42</width>
  <height>24</height>
  <uuid>{03e45531-da18-45a1-9c3f-7d4618d628bd}</uuid>
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
  <objectName>kcpsMin_pause_2</objectName>
  <x>870</x>
  <y>169</y>
  <width>42</width>
  <height>24</height>
  <uuid>{52214414-4374-4390-ae3f-f095526b5288}</uuid>
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
  <objectName>kcpsMax_pause_2</objectName>
  <x>870</x>
  <y>196</y>
  <width>42</width>
  <height>24</height>
  <uuid>{7bda9541-62c4-4c59-95a0-5d4a84ceebfc}</uuid>
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
  <x>522</x>
  <y>14</y>
  <width>35</width>
  <height>22</height>
  <uuid>{4db453be-a2d1-4a64-a68e-895cffc6735a}</uuid>
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
  <x>601</x>
  <y>11</y>
  <width>46</width>
  <height>22</height>
  <uuid>{6f3c1ee1-246f-47bd-8ba8-f568bde5d03c}</uuid>
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
  <x>709</x>
  <y>5</y>
  <width>46</width>
  <height>22</height>
  <uuid>{e2973b4d-6e55-43a5-b22b-97c9ed423f9f}</uuid>
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
  <x>842</x>
  <y>5</y>
  <width>46</width>
  <height>22</height>
  <uuid>{4146f896-1cc6-4604-a8f0-354fd14de84e}</uuid>
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
  <objectName>kamp_num_2</objectName>
  <x>501</x>
  <y>149</y>
  <width>27</width>
  <height>37</height>
  <uuid>{f5fb7e44-6733-49a4-8ff1-63da989d9d94}</uuid>
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
  <objectName>kamp_vel_2</objectName>
  <x>599</x>
  <y>149</y>
  <width>29</width>
  <height>34</height>
  <uuid>{e877820f-ca63-443c-97f8-2e2f34a95481}</uuid>
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
  <objectName>kamp_pause_2</objectName>
  <x>820</x>
  <y>176</y>
  <width>44</width>
  <height>33</height>
  <uuid>{0feaccfb-e70a-48c9-a97a-9d31b58aed64}</uuid>
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
  <objectName>kamp_dur_2</objectName>
  <x>689</x>
  <y>174</y>
  <width>44</width>
  <height>33</height>
  <uuid>{fa3c342a-1e35-4b9c-9068-aa693e57ba6f}</uuid>
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
</bsbPanel>
<bsbPresets>
</bsbPresets>
<MacOptions>
Version: 3
Render: Real
Ask: Yes
Functions: ioObject
Listing: Window
WindowBounds: 974 72 944 698
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioText {3, 1} {463, 228} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {54784, 61440, 49408} nobackground noborder VOICE 1
ioKnob {31, 35} {81, 78} 127.000000 0.000000 0.010000 67.310000 knum_1
ioText {54, 114} {34, 24} scroll 67.310000 1.000000 "knum_1" left "Arial" 15 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {122, 35} {79, 77} 127.000000 0.000000 0.010000 64.770000 kvel_1
ioText {145, 113} {34, 24} scroll 64.770000 1.000000 "kvel_1" left "Arial" 15 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {204, 25} {127, 109} 1.000000 0.125000 0.010000 0.191250 kdur_1
ioKnob {331, 25} {127, 109} 1.000000 0.125000 0.010000 0.247500 kpause_1
ioText {250, 134} {42, 29} scroll 0.191250 0.001000 "kdur_1" left "Arial" 15 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {374, 134} {43, 28} scroll 0.247500 0.001000 "kpause_1" left "Arial" 15 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {65, 142} {42, 24} editnum 1.000000 0.500000 "kcpsMin_num_1" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 1.000000
ioText {66, 168} {42, 24} editnum 1.500000 0.500000 "kcpsMax_num_1" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 1.500000
ioText {166, 140} {42, 24} editnum 1.000000 0.500000 "kcpsMin_vel_1" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 1.000000
ioText {166, 167} {42, 24} editnum 2.000000 0.500000 "kcpsMax_vel_1" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 2.000000
ioText {272, 165} {42, 24} editnum 1.500000 0.500000 " kcpsMin_dur_1" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 1.500000
ioText {272, 192} {42, 24} editnum 3.000000 0.500000 "kcpsMax_dur_1" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 3.000000
ioText {405, 169} {42, 24} editnum 1.500000 0.500000 "kcpsMin_pause_1" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 1.500000
ioText {405, 196} {42, 24} editnum 2.000000 0.500000 "kcpsMax_pause_1" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 2.000000
ioText {57, 14} {35, 22} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder note
ioText {136, 11} {46, 22} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder velocity
ioText {244, 5} {46, 22} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder duration
ioText {377, 5} {46, 22} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder pause
ioText {36, 149} {27, 37} scroll 11.900000 1.000000 "kamp_num_1" left "Arial" 18 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {134, 149} {29, 34} scroll 12.000000 1.000000 "kamp_vel_1" left "Arial" 18 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {355, 176} {44, 33} scroll 0.248000 0.001000 "kamp_pause_1" left "Arial" 18 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {224, 174} {44, 33} scroll 0.500000 0.010000 "kamp_dur_1" left "Arial" 18 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {468, 1} {463, 228} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {47872, 53760, 61440} nobackground noborder VOICE 2
ioKnob {496, 35} {81, 78} 127.000000 1.000000 0.010000 67.310000 knum_2
ioText {519, 114} {34, 24} scroll 67.310000 1.000000 "knum_2" left "Arial" 15 {0, 0, 0} {65280, 65280, 65280} background noborder 67.31000000
ioKnob {587, 35} {79, 77} 127.000000 1.000000 0.010000 64.770000 kvel_2
ioText {610, 113} {34, 24} scroll 64.770000 1.000000 "kvel_2" left "Arial" 15 {0, 0, 0} {65280, 65280, 65280} background noborder 64.77000000
ioKnob {669, 25} {127, 109} 1.000000 0.125000 0.010000 0.191250 kdur_2
ioKnob {796, 25} {127, 109} 1.000000 0.125000 0.010000 0.247500 kpause_2
ioText {715, 134} {42, 29} scroll 0.191250 0.001000 "kdur_2" left "Arial" 15 {0, 0, 0} {65280, 65280, 65280} background noborder 0.19125000
ioText {839, 134} {43, 28} scroll 0.247500 0.001000 "kpause_2" left "Arial" 15 {0, 0, 0} {65280, 65280, 65280} background noborder 0.24750000
ioText {530, 142} {42, 24} editnum 1.000000 0.500000 "kcpsMin_num_2" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 1.000000
ioText {531, 168} {42, 24} editnum 1.500000 0.500000 "kcpsMax_num_2" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 1.500000
ioText {631, 140} {42, 24} editnum 1.000000 0.500000 "kcpsMin_vel_2" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 1.000000
ioText {631, 166} {42, 24} editnum 2.000000 0.500000 "kcpsMax_vel_2" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 2.000000
ioText {737, 165} {42, 24} editnum 1.500000 0.500000 " kcpsMin_dur_2" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 1.500000
ioText {737, 192} {42, 24} editnum 3.000000 0.500000 "kcpsMax_dur_2" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 3.000000
ioText {870, 169} {42, 24} editnum 1.500000 0.500000 "kcpsMin_pause_2" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 1.500000
ioText {870, 196} {42, 24} editnum 2.000000 0.500000 "kcpsMax_pause_2" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 2.000000
ioText {57, 14} {35, 22} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder note
ioText {136, 11} {46, 22} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder velocity
ioText {244, 5} {46, 22} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder duration
ioText {377, 5} {46, 22} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder pause
ioText {501, 149} {27, 37} scroll 11.900000 1.000000 "kamp_num_2" left "Arial" 18 {0, 0, 0} {65280, 65280, 65280} background noborder 11.90000000
ioText {599, 149} {29, 34} scroll 12.000000 1.000000 "kamp_vel_2" left "Arial" 18 {0, 0, 0} {65280, 65280, 65280} background noborder 12.00000000
ioText {820, 176} {44, 33} scroll 0.248000 0.001000 "kamp_pause_2" left "Arial" 18 {0, 0, 0} {65280, 65280, 65280} background noborder 0.24800000
ioText {689, 174} {44, 33} scroll 0.500000 0.010000 "kamp_dur_2" left "Arial" 18 {0, 0, 0} {65280, 65280, 65280} background noborder 0.50000000
</MacGUI>
