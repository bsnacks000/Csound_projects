<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr = 44100
kr = 4410
nchnls = 2
0dbfs = 20000


instr 1 ;; modified book code
; init. variables:
   idur = p3   ; duration of the note
   ipitch= p4 ; carrier frequency
   kfreq linseg p6, p3, p7, p3, p8 ; modulating frequency, given in hertz
   imodfunc=p9 ; modulating waveshape; 1 = amp. mod., 2 = ring mod.

kampenv expseg .005, .2*idur,1, .5*idur, .6, .3*idur,.005; amplitude envelope

kampenv = kampenv * p5 ;  multiply this envelope by p5 (peak amplitude for each note)

amod oscil3 1, kfreq, imodfunc ; modulating oscillator
  ; sine wave carrier oscillator with amplitude or ring modulation:

acarrier oscil3  amod*kampenv, ipitch, 1 

outs acarrier, acarrier

dispfft acarrier, 0.5, 4096

endin



</CsInstruments>
<CsScore>

f1 0 8192 10 1
f2 0 1024 19 1. .5 0 .5

i1 0 3    440  5000      100  100  100      2
i1 + 3    460  5000      100  100  100      2
i1 + 3    480  5000      100  100  100      2
i1 + 3    440  5000      100  100  100      1
i1 + 3    460  5000      100  100  100      1
i1 + 3    480  5000      100  100  100      1 





</CsScore>
</CsoundSynthesizer><bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1010</x>
 <y>111</y>
 <width>426</width>
 <height>363</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBGraph">
  <objectName/>
  <x>11</x>
  <y>182</y>
  <width>351</width>
  <height>149</height>
  <uuid>{c11e4f14-e28d-4904-9ec2-a8d773cfac4f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <value>2</value>
  <objectName2/>
  <zoomx>1.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <modex>lin</modex>
  <modey>lin</modey>
  <all>true</all>
 </bsbObject>
 <bsbObject version="2" type="BSBScope">
  <objectName/>
  <x>12</x>
  <y>8</y>
  <width>350</width>
  <height>150</height>
  <uuid>{757cb6b8-2282-476f-a6e9-7ff33133de0f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <value>-255.00000000</value>
  <type>scope</type>
  <zoomx>2.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <mode>0.00000000</mode>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioGraph {11, 182} {351, 149} table 2.000000 1.000000 
ioGraph {12, 8} {350, 150} scope 2.000000 -255 
</MacGUI>
