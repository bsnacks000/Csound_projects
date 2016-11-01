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

instr 1


icps = 7.83

aSig1 oscil 2000,icps , giSine
aSig2 oscil 2000,(icps *2) , giSine
aSig3 oscil 2000,(icps *5) , giSine
aSig4 oscil 1000,(icps *10) , giSine
aSig5 oscil 1000,(icps *20) , giSine
aSig6 oscil 1000,(icps *50) , giSine
aSig7 oscil 1000,(icps *80) , giSine
aSig8 oscil 1000,(icps *100) , giSine
aSig9 oscil 1000,(icps *150) , giSine
aSig10 oscil 1000,(icps *200), giSine

aSig11 oscil 2000,icps + 5, giSine
aSig12 oscil 2000,(icps *2)  + 5, giSine
aSig13 oscil 2000,(icps *5)  + 5, giSine
aSig14 oscil 1000,(icps *10)  + 5, giSine
aSig15 oscil 1000,(icps *20)  + 5, giSine
aSig16 oscil 1000,(icps *50) + 5, giSine
aSig17 oscil 1000,(icps *80) + 5, giSine
aSig18 oscil 1000,(icps *100) +  5, giSine
aSig19 oscil 1000,(icps *150) +  5, giSine
aSig20 oscil 1000,(icps *200) +  5, giSine


awhite rand 350

aNoise pinkish awhite, 1,  0 , 0 , 0



outs aSig1 + aSig2 + aSig3 + aSig4 + aSig5 + aSig6 + aSig7 + aSig8 + aSig9 + aSig10 + aNoise, aSig11 + aSig12 + aSig13 + aSig14 + aSig15 + aSig16 + aSig17 + aSig18 + aSig19 + aSig20 + aNoise

endin

</CsInstruments>
<CsScore>

i1 0 1800

</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>72</x>
 <y>179</y>
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
  <uuid>{04cdfa13-5f15-41d1-9000-e3a923389a69}</uuid>
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
<MacOptions>
Version: 3
Render: Real
Ask: Yes
Functions: ioObject
Listing: Window
WindowBounds: 72 179 400 200
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioSlider {5, 5} {20, 100} 0.000000 1.000000 0.000000 slider1
</MacGUI>
