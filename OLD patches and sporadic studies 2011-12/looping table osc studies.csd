<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr = 44100
kr = 4410
nchnls = 2
0dbfs = 20000


instr 1 ; wavetable osc


	kcps jitter p8, p9, p10

kamp oscil 100, kcps, p13 ; amplitude enveloped by osc with fluctuating cps

kEnv linen kamp, p4, p3, p5
 
kline line p11, p3, p12 
 
	aOut,aOut loscil kEnv, kline, p7, 200, 1 
		outs aOut, aOut

		dispfft aOut, 0.5, 4096		
endin

instr 2 ; wavetable osc


	kcps gauss p8      ; guassian distribution

kamp oscil 100, kcps, p13 ; amplitude enveloped by osc with fluctuating cps

kEnv linen kamp, p4, p3, p5
 
kline line p11, p3, p12 
 
	aOut2,aOut2 loscil kEnv, kline, p7, 200, 1 
		outs aOut2, aOut2

		dispfft aOut2, 0.5, 4096		
endin








</CsInstruments>
<CsScore>

f1 0 0  1 "drum sample.wav" 0 0 0 
f2 0 4096 10 1 

f3 0 4096 9   1 1 0   3 .333 180   5 .2 0   7 .143 180   9 .111 0 
f4 0 4096 9   .5 .5 180   3.4 .7 0   5.1 1 180   7.8 .143 0   9 .111 0 
f5 0 4096 9   1 1 0   5 .333 180   25 .6 0   19 1 180 




; p4 - p5 - amplitude AR, p6 - osc freq, p7 osc ftable
; p8 jitter amp 9 - 10 -jitter freq range p11-12 - osc p13 modulating ftable tnumber 
;
;       	p4   p5      	p6   p7      p8     p9 p10      p11 p12   p13

i1 0 10 	 3    .2          1    1      100   1   15       200 200   5
i1 + 10  	.2    .2          1    1      215   1   35       215 210   2
i1 + 10  	.2     4           1    1      230   1   62       450 400   4

i2 30 25      8    .001          1    1     1000      0   0       1   10    2
i2 +  25      .001   .001        1    1     1000      0   0       1   225   2
i2 +  25      .001   .001        1    1     1000      0   0       225 225   2 
i2 +  25      .001   3			 1    1     1000      0   0       225 1500  2



</CsScore>
</CsoundSynthesizer><bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1266</x>
 <y>8</y>
 <width>377</width>
 <height>322</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBGraph">
  <objectName/>
  <x>9</x>
  <y>161</y>
  <width>350</width>
  <height>150</height>
  <uuid>{aadb50b0-bcf9-4956-bbed-1831f1eeeee6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
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
 <bsbObject version="2" type="BSBScope">
  <objectName/>
  <x>9</x>
  <y>3</y>
  <width>350</width>
  <height>150</height>
  <uuid>{b91ffc70-7150-4a4f-bc3b-3b9f9ac8199b}</uuid>
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
ioGraph {9, 161} {350, 150} table 0.000000 1.000000 
ioGraph {9, 3} {350, 150} scope 2.000000 -255 
</MacGUI>
