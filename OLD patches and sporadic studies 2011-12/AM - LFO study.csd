<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr = 41000
kr = 4100
nchnls = 2
0dbfs = 20000

instr 1 

 
kEnv oscil p8, p9, p7


kline line p4, p3, p5
aSig oscili kEnv, kline, p6
	
	kClip adsr .1, 1, 1 , .2
	outs aSig * kClip, aSig * kClip

dispfft aSig, 0.5, 4096
endin

</CsInstruments>
<CsScore>

f1 0 4096 10 1
f2 0 4096 10 1 2 3  
f3 0 4096 9  .3 1 0   .7 .9 0   3 .3 180  7 .6 90  3.5 .4 0
f4 0 4096 9  1 3 0   3 1 0  9 0.333 180
f5 0 4096 9  10 .4 0  22 .5 0   27 1 0 


i1 0    60 300 350 4 3  2000  12
i1 10   20 298 301 1 4  2000  5
i1 10   12 303 301 2 2  1600  3		
i1 16   30 297 302 2 4  1100  1
i1 16   6  307 305 2 1	1500  7
i1 22   5  307 305 2 1	1500  10
i1 29   4  307 305 1 2	1500  3 
i1 30   5  307 305 2 1	1500  12
i1 33   25 307 304 1 2	1500  2
i1 33   25 280 283 2 5  2000  2
i1 40   20 300 296 5 4  1000  3


</CsScore>
</CsoundSynthesizer><bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>890</x>
 <y>4</y>
 <width>705</width>
 <height>374</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBScope">
  <objectName/>
  <x>33</x>
  <y>22</y>
  <width>350</width>
  <height>150</height>
  <uuid>{c99b7f35-154e-4ef0-9e09-e89e40866463}</uuid>
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
  <x>42</x>
  <y>195</y>
  <width>350</width>
  <height>150</height>
  <uuid>{7ae158aa-520f-466f-b01f-059694f2a41e}</uuid>
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
ioGraph {33, 22} {350, 150} scope 2.000000 -255 
ioGraph {42, 195} {350, 150} table 0.000000 1.000000 
</MacGUI>
