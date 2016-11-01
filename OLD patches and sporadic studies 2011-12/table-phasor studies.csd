<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr = 44100
kr = 4410
nchnls = 2
0dbfs = 20000

instr 202; page 72 Csound book

kenv linen p4, .5, p3, .5
aphase phasor p5
ilength = ftlen(p6)
aphase = aphase*ilength          ; need to express this to phase over length of table

asig tablei aphase, p6
	outs, asig*kenv , asig*kenv
endin

;; this configuration is equivalent to:

instr 203

kenv linen p4, .5, p3, .5
asig oscili kenv, p5, p6
	outs asig * kenv, asig*kenv

endin

instr 1


kphase phasor 1/p3     ; setting up a phsor as an amp envelope ( 1/p3 ) for one read through during note dur
ilength = ftlen(p4)
kphase = kphase * ilength

ktabread table kphase, p4

asig oscili ktabread * 1000, p5, 1
	outs asig,asig

endin

</CsInstruments>
<CsScore>
f1 0 8192 10 1
f2 0 1024 7    0 256 1   256 .5   256 .7   256 0
f3 0 1024 5    .001 100 1   824 .7   100 .001
f4 0 8192 19 1. .5 0 .5; unipolar sine wave

;i202  0 5   3000    200    2

i1 0 5    2 440

 
</CsScore>
</CsoundSynthesizer><bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1453</x>
 <y>147</y>
 <width>422</width>
 <height>442</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBScope">
  <objectName/>
  <x>16</x>
  <y>18</y>
  <width>350</width>
  <height>150</height>
  <uuid>{a7813f63-1f75-4bdb-b971-34c20d6e20d1}</uuid>
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
 <bsbObject version="2" type="BSBGraph">
  <objectName/>
  <x>19</x>
  <y>204</y>
  <width>350</width>
  <height>150</height>
  <uuid>{449fcad5-7c12-420a-b32a-8e885bb50ade}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <value>3</value>
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
ioGraph {16, 18} {350, 150} scope 2.000000 -255 
ioGraph {19, 204} {350, 150} table 3.000000 1.000000 
</MacGUI>
