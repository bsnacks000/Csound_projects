<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr = 44100
kr = 4410
nchnls = 2
0dbfs = 20000


instr 1 ; sawtooth

kramp line p4, p3, p5

asig oscil 8000, kramp, p6 
	kenv adsr 1, .2, 1, .1

outs asig * kenv
dispfft asig, 0.5, 4096 

endin

</CsInstruments>
<CsScore>

f1 0 4096 10 1 
f2 0 4096 10 1 .5 .333 .25 .2 .166 .142 .125 .111 .1 .09 .083 .076 .071 .066 .062
f3 0 4097 20 3 1

;4. freq start  5. freq end 6.ftable lookup

i1 0 10	440 100000  2
i1 + 10	440 100000  1	
i1 + 10 440 100000  3

</CsScore>
</CsoundSynthesizer><bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1176</x>
 <y>163</y>
 <width>515</width>
 <height>311</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBGraph">
  <objectName>graph</objectName>
  <x>49</x>
  <y>49</y>
  <width>350</width>
  <height>170</height>
  <uuid>{0bbcf94e-ee66-4e51-af79-d80b76495e27}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <value>3</value>
  <objectName2>graph f_t</objectName2>
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
<MacOptions>
Version: 3
Render: Real
Ask: Yes
Functions: ioObject
Listing: Window
WindowBounds: 1176 163 515 311
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>
<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioGraph {49, 49} {350, 170} table 3.000000 1.000000 graph
</MacGUI>
