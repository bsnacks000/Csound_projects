<CsoundSynthesizer>
<CsOptions>
--displays
</CsOptions>
<CsInstruments>
sr = 44100
kr = 4410
nchnls = 1
0dbfs = 20000


giNoise ftgen 1, 0, 8192, 10, 0

instr 1

aNoise rand 1

imethod = 1
aSig pinkish aNoise , imethod 

kSig downsamp aSig 

;kSig = (kSig + 1) * 0.5
kSig = abs(kSig)

printk 0, kSig 

kenv line 0, p3, 4410
tabw kSig, kenv, giNoise 

out aSig

endin

</CsInstruments>
<CsScore>
i1 0 1


</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1244</x>
 <y>72</y>
 <width>427</width>
 <height>369</height>
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
  <uuid>{0572a6fa-6a40-4ab2-bbb2-bf2b850c2a93}</uuid>
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
 <bsbObject version="2" type="BSBGraph">
  <objectName/>
  <x>77</x>
  <y>219</y>
  <width>350</width>
  <height>150</height>
  <uuid>{53eeb78a-7533-4b53-8c0e-135adce65a3e}</uuid>
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
</bsbPanel>
<bsbPresets>
</bsbPresets>
<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioSlider {5, 5} {20, 100} 0.000000 1.000000 0.000000 slider1
ioGraph {77, 219} {350, 150} table 0.000000 1.000000 
</MacGUI>
