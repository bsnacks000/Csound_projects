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


</CsInstruments>
<CsScore>
f1 0 8192 10 1 ; bipolar sine wave
f2 0 8192 19 1. .5 0 .5; unipolar sine wave

f3 0 1024 7    0 256 1   256 .5   256 .7   256 0
f4 0 1024 7     0         682  1    342    0

f5 0 1024 5    .001 100 1   824 .7   100 .001

;;;;;;;***********;;;;;;;;;
;;;;;;;***********;;;;;;;;;
s

i1 0  2    440   50  50    2 ; amp mod
i1 +  2    540   50  50    2
i1 +  2    640   50  50    2
i1 +  2    740   50  50    2
i1 +  2    840   50  50    2


i1 +  2    440   50  50   1 ; ring mod
i1 +  2    540   50  50    1
i1 +  2    640   50  50   1
i1 +  2    740   50  50   1
i1 +  2    840   50  50    1

i1 +  2    440   50  50    2 ; side by side
i1 +  2    440   50  50    1
i1 +  2    540   50  50    2
i1 +  2    540   50  50    1
i1 +  2    640   50  50    2
i1 +  2    640   50  50    1
i1 +  2    740   50  50    2
i1 +  2    740   50  50    1
i1 +  2    840   50  50    2
i1 +  2    840   50  50    1

s
i2 0 5    0 3   120  1    5.5  .5 .5   400  2    10   ;;; switching between uni and bipolar produces a clear fundamental 
i2 + 5    0 4   110  1    5  .5 .5     300  2    30   
i2 + 5    0 5   100  1    4.5  .5 .5   250  2    50
i2 + 5    0 3   250  1    3  .5 .5     120  2    1

</CsScore>
</CsoundSynthesizer><bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1318</x>
 <y>4</y>
 <width>404</width>
 <height>332</height>
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
