<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr = 44100
kr = 4410
nchnls = 2
0dbfs = 20000


instr 1 ; 118 foscil with oscil envelope using multiple 

kamp oscil p4* 1000, 1/p3, p10
kndx line p5, p3, p6


aOut foscil kamp, p7, p8, p9, kndx, p11
	
	outs aOut, aOut
	
	dispfft aOut, 0.5, 4096
	
endin


instr 2 ; using foscili as an envelope for an oscil 

kndx line p5, p3, p6

aamp foscili p4 *1000, 1/p3, 200, 50, kndx, 1

aOut2 oscili aamp, p7, p8
	aclip adsr .8, 1, .5, .8
	outs aOut2 * aclip, aOut2 * aclip

endin

instr 3 ; 118 foscil with oscil envelope using phsor/table block for amplitude envelope 

	kndx1 phasor  1/p3 * p10  ; changing the numerator speeds up or slows down the table read
kamp tablei kndx1, p10, 1 
kampscale = kamp * 1000

kndx line p5, p3, p6

aOut3 foscil p4 * kampscale, p7, p8, p9, kndx, p11
	aclip adsr .8, 1, .5, .8
	outs aOut3 * aclip, aOut3 * aclip
	
	dispfft aOut3, 0.5, 4096
	
endin

instr 4 ; 118 foscil with oscil envelope using phasor/table blovk with dynamic read through control

	knum linseg p12, p3/5, p13, p3/5, p14, p3/5, p15, p3/5, p16, p3/5, p17  ; controls table read through rate linseg envelope
	kndx1 phasor  knum/p3 * p10  ; changing the numerator speeds up or slows down the table read
kamp tablei kndx1, p10, 1 
kampscale = kamp * 1000

kndx line p5, p3, p6

aOut4 foscil p4 * kampscale, p7, p8, p9, kndx, p11
	aclip adsr .8, 1, .5, .8
	outs aOut4 * aclip, aOut4 * aclip
	
	dispfft aOut4, 0.5, 4096
	
endin

</CsInstruments>
<CsScore>

f1 0 8192 10   1 
f2 0 8192 10   .01 .3 .6 .7  .9 
f3 0 1024 5    .001 140 1 192 .5 200 .8 350 .5 120 .001
f4 0 8192 10   1 0 .5 0 .333 0 .222 0 .05 0 .015 0 .05
f5 0 4096 7    .001 2048 1 2048  .001
f6 0 8192 5    .001 4096 1 4096 .001


i1 0  4   2.5     1 20   400 100 100   3  1
i1 +  4   1.8     35 1   200 50  25    3  1
i1 +  4   2.3     1  5   500 600 130   3  2
i1 +  4   4.1     9  43  200 100 150   3  1 
i1 +  4   2.1     30 30  120  50 15    3  2
i1 +  4   3.1     16 10  35  430 20    3  2
i1 +  4   4.1     15 54  120 400 100   3  1 
i1 +  4   5.1     7  11  105 50  20    3  1

i2 0  10   3.5  1 50    440 1   
i2 +  10   4.5  50 40   330 2
i2 +  10   4.9  200 50  250 4 
i2 +  10   4.3  120 100   300  5
i2 +  10   4.4  1  50   200  6

i3 0  10   4.5     1 20   300 50 20   5  1

i4 0  10   4.5     1  20   10  20  50   4  1       1  15  4   2   20  1
i4 5  10   2.5     10 1    5   30  70   6  1       10  1 11  .5   25  1
i4 10 10   3.2     3  1    75  20  75   2  1       1  25 10  35  13   5
i4 15 10   3.5     1  20   15  20  50   4  1       50  15  4   2   20  50
i4 20 10   4.5     1  18   10  20  50   4  1       1  20  1   1   20  1
i4 25 10   2.5     10 1    5  30  70    6  1       1  20 35  1   50   1
i4 33 10   3.2     3  1    75  20  75   2  1       50 1  10  50  10   1
</CsScore>
</CsoundSynthesizer><bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1235</x>
 <y>30</y>
 <width>585</width>
 <height>344</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBScope">
  <objectName/>
  <x>25</x>
  <y>15</y>
  <width>350</width>
  <height>150</height>
  <uuid>{7e09e5a6-092d-44cb-acf8-829a6dda8997}</uuid>
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
  <x>25</x>
  <y>189</y>
  <width>350</width>
  <height>150</height>
  <uuid>{77f8cda5-5d5b-41a0-9c1b-1206014e2c58}</uuid>
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
</bsbPanel>
<bsbPresets>
</bsbPresets>
<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioGraph {25, 15} {350, 150} scope 2.000000 -255 
ioGraph {25, 189} {350, 150} table 0.000000 1.000000 
</MacGUI>
