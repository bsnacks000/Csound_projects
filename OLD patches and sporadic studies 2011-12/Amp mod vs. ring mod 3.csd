<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr = 44100
kr = 4410
nchnls = 2
0dbfs = 20000


instr 1 ; simple amp/ring mod


kEnv linen 5000, 1, p3, 1
kline line p5, p3, p6

aMod oscili 1, kline, p7 ; using a unipolar or bipolar sine wave to modualte  

aCar oscili aMod * kEnv, p4, 1 ; simple bipolar sine wave


	outs aCar, aCar 
	
	dispfft aCar, 0.5, 4096

endin

instr 2; simple ring mod using complex modulator
	inum = p13     ; controls tremolo rate for modulator (readthrough per duration)
	kcps1 = inum/p3 
	iphs =  p4
	ifn1 =  p5

	
kndx phasor kcps1, iphs
ilength = ftlen(p5)
kndx = kndx * ilength
kEnvMod tablei kndx, ifn1  


	icps1=  p6
	ifn2 =  p7

kmodosc1 oscili (kEnvMod),      icps1,     ifn2 
kmodosc2 oscili (kEnvMod) * .3, icps1 * 1.5, ifn2 
kmodosc3 oscili (kEnvMod) * .2, icps1 * 1.7, ifn2 
kmodosc4 oscili (kEnvMod) * .1, icps1 * 1.8, ifn2 
kmodosc5 oscili (kEnvMod) * .05, icps1 * 3.9, ifn2 

kMod = kmodosc1 + kmodosc2 + kmodosc3 + kmodosc4 + kmodosc5 


kamp = p8 * 1000	
irise = p9
idur = p3
idec = p10

kCarEnv linen kamp, irise, idur, idec 

kfreq = p11
ifn4 =  p12

aCar oscili kCarEnv, kfreq, ifn4

	kClip adsr .1,1,1,.1

aSignal = aCar * kMod * kClip

	outs aSignal, aSignal
	
endin

instr 3 ;  Ring modulation with dynamic control from Csound book p 242

kamp oscil1 0, p4 *1000, p3, p7

kcar oscil1 0, p5, p3, p8
kcmr oscil1 0, p6, p3, p9
kmp  oscil1 0, 1, p3, p10

acarr oscili 1, kcar, 1 
amod  oscili 1, kcar/kcmr, 6 

asig = acarr*amod*kmp
	
aunmod = acarr * (1-kmp) 
	outs (asig + aunmod) *kamp,(asig+aunmod) *kamp  ; creates mix of mod and unmod signal for percussive effect

endin



</CsInstruments>
<CsScore>
f1 0 8192 10 1 ; bipolar sine wave
f2 0 8192 19 1 .5 0 .5; unipolar sine wave

; unipolar envelopes
f3 0 1024 7     0 256 1   256 .5   256 .7   256 0
f4 0 1024 7     0         682  1    342    0

f5 0 1024 5    .001 100 1   824 .7   100 .001


;triangle wave
f6 0 8192 10   1 .9 .8 .7 .6 .5 .4 .3 .2 .1

;percussive functions
 
f7   0 512 7   1 512 1
f8   0 512 7   0.6799 32 0.6799 160 1 384 0.9808
f9   0 512 7   1 32 0.1 414 0.11
f10  0 512 7   0 32 1 64 0.3 10 0 374 
;;;;;;;***********;;;;;;;;;
;;;;;;;***********;;;;;;;;;


i3      0      0.1  5.5      500    3     10    7    8    9
i3      +      0.1  >        400    3     .     .     .    .
i3      +      0.1  >        400    4     .     .     .    .
i3      +      0.1  >        300    5     .     .     .    .   
i3      +      0.2  >        300    6     .     .     .    .
i3      +      0.2  >        300    5     .     .     .    .
i3      +      0.2  >        300    5     .     .     .    .
i3      +      0.3  >        300    5     .     .     .    .
i3      +      0.4  >        300    6     .     .     .    .
i3      +      0.7  >        300    7     .     .     .    .
i3      +      0.9  >        300    7     .     .     .    .
i3      +      1.1  >        200    8     .     .     .    .
i3      +      1.9  >        200    9     .     .     .    .
i3      +      2.9  7.3      200    10    .     .     .    .

i3      7.2     4    4.3     790    6     10    9     8    7
i3      +       3    4.3     795    6     10    9     8    7
i3      +       2    4.3     800    5     10    9     8    7
i3      +       1    4.3     800    5     10    9     8    7
i3      +      .9   >        800    4     .		.	  .    .
i3      +      .6   >        800    3     .		.	  .    .
i3      +      .53   >       800    3     .		.	  .    .
i3      +      .41   >       800    3     .		.	  .    .
i3      +      .3   >        800    3     .		.	  .    .
i3      +      .3   >        803    4     .		.	  .    .
i3      +      .25   >       803    4     .		.	  .    .
i3      +      .23   >       803    4     .		.	  .    .
i3      +      .2   >        805    4     .		.	  .    .
i3      +      .2   >        805    4     .		.	  .    .
i3      +      .15   >       806    3     .		.	  .    .
i3      +      .13  6.3      807    3     .		.	  .    .
i3      +      .1   <        807    2     .		.	  .    .
i3      +      .1   <        807    2     .		.	  .    .
i3      +      .09  <        807    2     .		.	  .    .
i3      +      .09  <        807    2     .		.	  .    .
i3      +      .08  4.3      810    1     .		.	  .    .
i3      +      .07  <        810    1     .		.	  .    .
i3      +      .06  <        820    1     .		.	  .    .
i3      +      .05  <        820    1     .		.	  .    .
i3      +      .05  2.2      840    1     .		.	  .    .
i3      +      .05  2.2      850    1     .		.	  .    .
i3      +      .05  2.2      850    1     .		.	  .    .
i3      +      .05  2.2      850    3     .		.	  .    .
i3      +      .05  <        850    2     .		.	  .    .
i3      +      .06  <        820    1     .		.	  .    .
i3      +      .07  <        810    2     .		.	  .    .
i3      +      .08  4.3      810    1     .		.	  .    .
i3      +      .07  <        810    2     .		.	  .    .
i3      +      .06  <        820    1     .		.	  .    .
i3      +      .05  <        820    2     .		.	  .    .
i3      +      .05  2.2      840    2     .		.	  .    .
i3      +      .05  2.2      850    1     .		.	  .    .
i3      +      .06  <        820    1     .		.	  .    .
i3      +      .07  <        810    1     .		.	  .    .
i3      +      .08  4.3      810    1     .		.	  .    .
i3      +      .09  <        807    2     .		.	  .    .
i3      +      .09  <        807    2     .		.	  .    .
i3      +      .09  <        807    2     .		.	  .    .
i3      +      .09  <        807    2     .		.	  .    .
i3      +      .13  6.3      807    3     .		.	  .    .
i3      +      .15   >       806    3     .		.	  .    .
i3      +      .2   >        805    4     .		.	  .    .
i3      +      .23   >       803    4     .		.	  .    .
i3      +      .24   >       803    4     .		.	  .    .
i3      +      .25   >       803    4     .		.	  .    .
i3      +      .3   >        803    4     .		.	  .    .
i3      +      .3   >        803    4     .		.	  .    .
i3      +      .41   >       800    3     .		.	  .    .
i3      +      .6   >        800    3     .		.	  .    .
i3      +      .8   >        800    4     .		.	  .    .
i3      +      .9   >        800    4     .		.	  .    .
i3      +      .9   >        800    4     .		.	  .    .
i3      +      1    4.3      800    5     10    9     8    7
i3      +      2    4.3      800    5     10    9     8    7
i3      +      3    4.3      800    5     10    9     8    7

</CsScore>
</CsoundSynthesizer><bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>833</x>
 <y>650</y>
 <width>422</width>
 <height>140</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBScope">
  <objectName/>
  <x>15</x>
  <y>13</y>
  <width>350</width>
  <height>150</height>
  <uuid>{4079400f-4fec-4fd2-b484-8906002312f2}</uuid>
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
  <x>18</x>
  <y>199</y>
  <width>350</width>
  <height>150</height>
  <uuid>{eb0b7e8e-9a06-44f6-9cf7-47c7005ed0f4}</uuid>
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
ioGraph {15, 13} {350, 150} scope 2.000000 -255 
ioGraph {18, 199} {350, 150} table 0.000000 1.000000 
</MacGUI>
