<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr = 44100
kr = 4410
nchnls = 2
0dbfs = 20000


garvb init  0

instr 1; Global Reverb
idur = p3            
irvbtim = p4 
ihiatn = p5

arvb	nreverb garvb, irvbtim, ihiatn
		outs arvb, arvb
garvb = 0
endin


instr 2 ; simple sine with reverb and panning control

irvbsnd = p6
klineseg linseg p7, p3/3, p8, p3/3, p9, p3/3, p10

aOsc oscili p4, p5, 1
	kEnv adsr .01,1,1,.1
	aMix = aOsc * kEnv 
	
aL, aR pan2 aMix, klineseg, 0

	outs aL, aR 

garvb = garvb  + (aMix * irvbsnd)


endin


</CsInstruments>
<CsScore>

f1 0 8192 10 1



i1 0 12   6 .3   




;                     RVB   Panning control (0 = left 1 = right)
i2 0 .3   1000 440   1     1  1   1   1 
i2 0 .3   1000 441   .01     1  1   1   1 
i2 1 .2   1000 439   .02     0  0   0   0   
i2 1 .2   1000 440   .02     0  0   0   0 
i2 2 .3   1000 438   .01     1  0   1   0
i2 2 .3   1000 439   .01     1  0   1   0 
i2 3  3   1000 440   .03     0  .5  .5  1
i2 3  3   1000 441   .03     0 .5   .5  1
i2 6  3   1000 440   .02     1  .8  0  .7
i2 6  3   1000 441   .02     1  .8  0  .7



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
  <uuid>{e22b7cd9-12d0-4a8d-8cb9-e4f5a2423efe}</uuid>
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
