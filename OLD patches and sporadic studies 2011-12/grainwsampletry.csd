<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr = 44100
kr = 4410
ksmps = 10
nchnls = 2
0dbfs = 20000



; sample grain trial

instr 1

idur = p3
kamp = p4
ipitch = p5
kdens line p6, idur, p7
kampoff line p8, idur, p9
kpitchoff line p10, idur, p11
kgdur line p12, idur, p13
igfn = p14 
iwfn = p15
imgdur = p16


aGrain grain kamp, ipitch, kdens, kampoff, kpitchoff, kgdur, igfn, \ iwfn, imgdur 
kEnv adsr .1, .1, .8, 1
	aOut = aGrain * kEnv

	outs aOut, aOut

endin




</CsInstruments>
<CsScore>
f1 0 262144 1 "drum sample.wav" 0 0 0 
f2 0 8192 20 5
f3 0 262144 1 "drum sample2.wav" 0 0 0

i1 0 15    1000  300    .7 .5   200 500    100 200  .025 1   2 1 .9
i1 0 15    800   200    .6 .1   200 500    100 200   .025 1    2 3 .9  
</CsScore>
</CsoundSynthesizer><bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>56</x>
 <y>127</y>
 <width>400</width>
 <height>200</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>slider1</objectName>
  <x>5</x>
  <y>5</y>
  <width>20</width>
  <height>100</height>
  <uuid>{8c1000f9-0d47-4210-b46f-b96a3b9f3ea9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioSlider {5, 5} {20, 100} 0.000000 1.000000 0.000000 slider1
</MacGUI>
