<CsoundSynthesizer>
<CsOptions>
--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps =10
nchnls = 2
0dbfs = 20000

giSource1 ftgen 0, 0, 0, 1, "DRUMnBASS test.wav", 0, 0, 0

instr 1

iamp = 5000
kcps invalue "kcps"
ifn = giSource1

aSig loscil iamp, kcps, ifn, 1, 1 
	aEnv adsr .01,0,1,.1

	outs aSig *aEnv, aSig * aEnv
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
 <x>1376</x>
 <y>72</y>
 <width>213</width>
 <height>287</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBKnob">
  <objectName>kcps</objectName>
  <x>27</x>
  <y>57</y>
  <width>186</width>
  <height>230</height>
  <uuid>{916914c0-0e11-439c-aa1f-b3b03883078b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>25.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioKnob {27, 57} {186, 230} 25.000000 0.000000 0.010000 1.000000 kcps
</MacGUI>
