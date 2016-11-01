<CsoundSynthesizer>
<CsOptions>
--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps =128
nchnls = 1
0dbfs = 20000

giSine ftgen 0, 0, 8192, 10, 1
giSquare ftgen 0, 0, 32, 7,   1,16,1,   0,   0,16,0 

seed 0

instr 1

kamp1 randomi 1800, 2000, .5, 3 , 0
kamp2 randomi 1800, 2000, .5, 3 , 0
kamp3 randomi 1800, 2000, .5, 3 , 0
kamp4 randomi 1800, 2000, .5, 3 , 0
kamp5 randomi 1800, 2000, .5, 3 , 0


aOsc1 oscili kamp1, 7.83, giSine
aOsc2 oscili kamp2, 7.83 * 10, giSine
aOsc3 oscili kamp3, 7.83 * 50, giSine
aOsc4 oscili kamp4, 7.83 * 100, giSine
aOsc5 oscili kamp5, 7.83 * 150, giSine

aOSC_sig = aOsc1 + aOsc2 + aOsc3 + aOsc4 + aOsc5

aLFO oscil3 1, 3.5, giSquare

aEnv adsr .1,0,1,.1

aMix = aOSC_sig * aLFO

out aMix * aEnv

endin

</CsInstruments>
<CsScore>

i1 0 1800

</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>0</width>
 <height>0</height>
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
  <uuid>{1e6a712e-bedb-42fd-91ce-59c15a371d90}</uuid>
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
