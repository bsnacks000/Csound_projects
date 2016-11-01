<CsoundSynthesizer>
<CsOptions>
;--displays
</CsOptions>
<CsInstruments>

ksmps =128
nchnls = 1
0dbfs = 20000

gi_HIST ftgen 0, 0, -200, -41,     1,.3,   2,.3,    7,.3 
gi_pause_HIST ftgen 0, 0, -200, -42,   0,0,.5,  .05,.1,.3,   .1,.15,.2


instr 1
gk_chn duserrnd gi_HIST
endin
instr 2
gk_pause duserrnd gi_pause_HIST
endin

instr 10

kchn = gk_chn	

knum_min invalue 1
knum_max invalue 2 
knum_cps invalue 3

kvel_min invalue 4
kvel_max invalue 5 
kvel_cps invalue 6

kcheck invalue 7

	if (kcheck == 0) then 
		kdur_min invalue 8
		kdur_max invalue 9
	else
		kdur_min invalue 10
		kdur_max invalue 11
	endif

kdur_cps invalue 12

kpause = gk_pause

knum randomh knum_min, knum_max, knum_cps, 3, 0
kvel randomh kvel_min, kvel_max, kvel_cps, 3, 0
kdur randomh kdur_min, kdur_max, kdur_cps, 3, 0


moscil kchn, int(knum), kvel, kdur, kpause

endin

</CsInstruments>
<CsScore>
f 0 1
s
i1   0 60
i2   0 60

i10  0 60

f 0 3

</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>946</x>
 <y>946</y>
 <width>557</width>
 <height>231</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>2</x>
  <y>3</y>
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
  <x>36</x>
  <y>163</y>
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
  <objectName>1</objectName>
  <x>34</x>
  <y>26</y>
  <width>29</width>
  <height>137</height>
  <uuid>{58a747d5-cd4e-4279-99e6-c86002e86f1d}</uuid>
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
  <objectName>2</objectName>
  <x>67</x>
  <y>26</y>
  <width>29</width>
  <height>137</height>
  <uuid>{8a517079-897c-4e06-99f6-58c3d9e0c7c1}</uuid>
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
  <objectName>2</objectName>
  <x>69</x>
  <y>163</y>
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
  <objectName>3</objectName>
  <x>100</x>
  <y>119</y>
  <width>63</width>
  <height>70</height>
  <uuid>{7a7d30e8-ea92-4e87-8d2f-689e50d2a8fe}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>10.00000000</maximum>
  <value>1.50000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>4</objectName>
  <x>170</x>
  <y>163</y>
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
  <value>33.18978102</value>
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
  <x>168</x>
  <y>26</y>
  <width>29</width>
  <height>137</height>
  <uuid>{a44b8aad-63b1-401a-804a-305ea663bb6e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <value>33.18978102</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>5</objectName>
  <x>201</x>
  <y>26</y>
  <width>29</width>
  <height>137</height>
  <uuid>{8b5658a9-4441-4288-8e03-d6ac2d3aaef7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>127.00000000</maximum>
  <value>59.86131387</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>5</objectName>
  <x>203</x>
  <y>163</y>
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
  <value>59.86131387</value>
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
  <x>233</x>
  <y>119</y>
  <width>63</width>
  <height>70</height>
  <uuid>{2a8c0808-f7b0-4708-8801-690f91afd670}</uuid>
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
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>59</x>
  <y>192</y>
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
  <x>202</x>
  <y>193</y>
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
  <x>312</x>
  <y>192</y>
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
  <x>303</x>
  <y>30</y>
  <width>39</width>
  <height>136</height>
  <uuid>{383883b4-aeec-4d8a-a2e5-9a4a9788e99c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.12500000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.13143382</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>9</objectName>
  <x>346</x>
  <y>30</y>
  <width>39</width>
  <height>136</height>
  <uuid>{48755a37-8dcd-4c75-a85c-6b90903f8370}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.12500000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.24080882</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>12</objectName>
  <x>387</x>
  <y>118</y>
  <width>63</width>
  <height>70</height>
  <uuid>{c94db9d0-0cb4-4bd9-bcdd-3ae84f71b38a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>10.00000000</maximum>
  <value>0.90000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>7</objectName>
  <x>309</x>
  <y>164</y>
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
  <x>348</x>
  <y>163</y>
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
  <value>0.24080882</value>
  <resolution>0.00500000</resolution>
  <minimum>0.12500000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>10</objectName>
  <x>457</x>
  <y>33</y>
  <width>39</width>
  <height>136</height>
  <uuid>{16a8e6f0-2482-40d5-ae9c-0d91bbc725be}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>5.00000000</maximum>
  <value>2.15294118</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>11</objectName>
  <x>502</x>
  <y>33</y>
  <width>39</width>
  <height>136</height>
  <uuid>{bf4861ab-48d7-4e7c-9f4e-8e2f35f0a3d1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>5.00000000</maximum>
  <value>3.97058824</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>7</objectName>
  <x>493</x>
  <y>10</y>
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
  <x>464</x>
  <y>195</y>
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
  <x>309</x>
  <y>164</y>
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
  <x>309</x>
  <y>164</y>
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
  <value>0.13143382</value>
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
  <objectName>10</objectName>
  <x>460</x>
  <y>168</y>
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
  <value>0.00000000</value>
  <resolution>0.05000000</resolution>
  <minimum>0.12500000</minimum>
  <maximum>5.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>11</objectName>
  <x>505</x>
  <y>166</y>
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
  <value>0.00000000</value>
  <resolution>0.00500000</resolution>
  <minimum>0.12500000</minimum>
  <maximum>5.00000000</maximum>
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
WindowBounds: 1047 645 544 246
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioText {2, 3} {555, 228} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {54784, 61440, 49408} nobackground noborder VOICE 1
ioText {36, 163} {24, 25} scroll 28.591241 1.000000 "1" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioSlider {34, 26} {29, 137} 1.000000 127.000000 28.591241 1
ioSlider {67, 26} {29, 137} 1.000000 127.000000 68.138686 2
ioText {69, 163} {24, 25} scroll 68.138686 1.000000 "2" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {100, 119} {63, 70} 10.000000 0.000000 0.010000 1.500000 3
ioText {170, 163} {24, 25} scroll 33.189781 1.000000 "4" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioSlider {168, 26} {29, 137} 1.000000 127.000000 33.189781 4
ioSlider {201, 26} {29, 137} 1.000000 127.000000 59.861314 5
ioText {203, 163} {24, 25} scroll 59.861314 1.000000 "5" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioKnob {233, 119} {63, 70} 10.000000 0.000000 0.010000 4.500000 6
ioText {59, 192} {55, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder bandwidth
ioText {202, 193} {55, 25} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder velocity
ioText {312, 192} {74, 24} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder duration short
ioSlider {303, 30} {39, 136} 0.125000 1.000000 0.131434 8
ioSlider {346, 30} {39, 136} 0.125000 1.000000 0.240809 9
ioKnob {387, 118} {63, 70} 10.000000 0.000000 0.010000 0.900000 12
ioText {309, 164} {33, 25} scroll 0.000000 0.005000 "7" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {348, 163} {33, 25} scroll 0.240809 0.005000 "9" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 0.39522059
ioSlider {457, 33} {39, 136} 1.000000 5.000000 2.152941 10
ioSlider {502, 33} {39, 136} 1.000000 5.000000 3.970588 11
ioCheckbox {493, 10} {20, 20} off 7
ioText {464, 195} {74, 24} label 0.000000 0.00100 "" left "Arial" 10 {0, 0, 0} {61440, 61440, 61440} nobackground noborder duration long
ioText {309, 164} {33, 25} scroll 0.000000 0.005000 "7" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
ioText {309, 164} {33, 25} scroll 0.131434 0.005000 "8" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 1.00000000
ioText {460, 168} {33, 25} scroll 0.000000 0.050000 "10" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 0.00000000
ioText {505, 166} {33, 25} scroll 0.000000 0.005000 "11" left "Arial" 12 {0, 0, 0} {65280, 65280, 65280} background noborder 
</MacGUI>
