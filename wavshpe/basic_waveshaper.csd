<CsoundSynthesizer>
<CsOptions>
--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps =128
nchnls = 1
0dbfs = 20000

giSine ftgen 0,0,8192, 	10, 		1 						
giADSR ftgen 0,0,512, 	7,			0,10,1,10,.8,482,.8,10,0 

giPoly1 ftgen 0,0,8193, 	13, 1,1,	0,1,-.7,0,.6,0,.7,0,.4,0,0,0,0,.1,-.2,-.3,.5		;w
giNorm1 ftgen 0,0,513, 	4, 			giPoly1,1		;n

instr 1

idur = p3
kamp1 randomi .1, 5, 10 
kamp2 = 1;randomi .1, 1.5, 1 
kcps = 50


aEnv_Osc poscil3  	kamp1, 1/idur, giSine	; sig_a

aSig_Osc poscil3 kamp2, kcps, giSine		; sig_x

aSig_ax = aSig_Osc * aEnv_Osc

aWave tablei aSig_ax, giPoly1 ,1		;w(ax)
aNorm tablei aEnv_Osc, giNorm1 ,1		; N(a)

out aWave * aNorm * 1000

endin

</CsInstruments>
<CsScore>

i1 0 1
</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1524</x>
 <y>72</y>
 <width>394</width>
 <height>567</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBGraph">
  <objectName/>
  <x>21</x>
  <y>196</y>
  <width>350</width>
  <height>150</height>
  <uuid>{4ed6cf74-357b-456b-9f00-d95ca035d601}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
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
 <bsbObject version="2" type="BSBScope">
  <objectName/>
  <x>21</x>
  <y>353</y>
  <width>350</width>
  <height>150</height>
  <uuid>{9b489666-c998-4e09-9c40-707fe0efce3c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <value>-255.00000000</value>
  <type>scope</type>
  <zoomx>8.00000000</zoomx>
  <zoomy>8.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <mode>0.00000000</mode>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioGraph {21, 196} {350, 150} table 3.000000 1.000000 
ioGraph {21, 353} {350, 150} scope 8.000000 -255 
</MacGUI>
