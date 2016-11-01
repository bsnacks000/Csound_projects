<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr = 44100
kr = 4410
nchnls = 2
0dbfs = 20000


instr 1 ;AM instrument with Modulation index

kline linseg p6, p3/2, p7, p3/2, p8

kModEnv oscil1 0, p4 * 1000 , p3, p9 ; reads envelope table
kMod oscili kModEnv, kline, 2  ; reads unipolar waveform GEN 19

kEnvOsc oscil1 0, p4*1000, p3, p9


kCarEnv = kEnvOsc + kMod
aCar oscili kCarEnv, p5, 1

	outs aCar, aCar
	
endin

instr 2 ; simple FM instrument 234
kline linseg p6, p3/2, p7, p3/2, p8
kmodfreq = p5

kModEnv oscil1 0, p4, p3, p9
kDev = kmodfreq *kModEnv

kModOsc oscili kDev, kmodfreq, 1 ; bipolar waveform

kCarFreq = p6
kCarFreqMod = kCarFreq +kModOsc


kCarEnv oscil1 0, p4*1000, p3, p9
aCar oscili kCarEnv, kCarFreqMod, 1 ;bipolar waveform

	outs aCar,aCar
endin






</CsInstruments>
<CsScore>

f1 0 8192 10 1 ; bipolar sine wave
f2 0 8192 19 1. .5 0 .5 ; unipolar sine wave

;unipolar envelopes
f3 0 1024 5   .0001  200 1 300 .7  524 .0001
f4 0 1024 5   .0001 500    1   524  .001
f5 0 1024 5   .0001  100 1 900 .7  24 .001
f6 0 1024 5   .0001 100 1 200 .0001 100 1 200 .001 100  1 100 .001 100 1 124 .001
f7 0 512  5   .001 50 1 50 .001 50 1 50 .001 50 1 50 .001 50 1 50 .001 50 1 50 .001 

;;;;;;;;;
;i1=  p4-amp; p5-Car Freq; p6-p8 Mod index(linseg);p9 Env tables
;i2= p4-amp;p5-Carfreq; p6- Mod freq; p7 Env tables

i1 0  10.0   4.5 200   15 20 10        3   
i1 3  7.1    3.5 190   11 15 11        4
i1 6  4.0    2.5 180   8  10 8         5
i2 5  15.1   3.4 200   5  2  7         4 
i2 8  7.3    3.5 180   6  9  5         3 
i2 8  20.4   3.5 150   3  9  2         4 
i1 10 9.1    2.5 180   20 14 35        3
i2 10 8.1    2.1 163   5  6  3         4 
i1 11 3.0    1.5 213   24 35 34        3
i1 +  2.3    1.5 224   23 31 25        7
i1 +   .7    1.5 226   14 65 26        7
i1 +   .4    1.5 226   14 65 26        7
i1 +   .7    1.5 226   14 65 26        7
i1 +  1.3    1.5 229   24  5 34        7
i2 18 10.7    3.1 150   3  2  3         4
i1 18 6.0    1.5 213   24 35 34        3
i1 +  2.3    1.5 224   23 31 25        7
i1 +   .7    1.5 226   14 65 26        7
i1 +   .6    1.5 226   14 65 26        7
i1 +   .8    1.5 226   14 65 26        7
i1 +  1.3    1.5 229   24  5 34        7
i2 21 10     2.3 180   2  4  5         4
i1 +  6.0   4.5 200   15 20 10        3
i1 +  3.1    3.5 190   11 15 11        4

</CsScore>
</CsoundSynthesizer><bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1316</x>
 <y>44</y>
 <width>391</width>
 <height>390</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBGraph">
  <objectName/>
  <x>6</x>
  <y>185</y>
  <width>350</width>
  <height>150</height>
  <uuid>{3eff7ddc-9510-478c-8352-625803ed417f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <value>4</value>
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
  <x>7</x>
  <y>14</y>
  <width>350</width>
  <height>150</height>
  <uuid>{d01867ed-a30b-407e-9622-c83a0aec4d96}</uuid>
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
ioGraph {6, 185} {350, 150} table 4.000000 1.000000 
ioGraph {7, 14} {350, 150} scope 2.000000 -255 
</MacGUI>
