<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr = 44100
kr = 4410
nchnls = 2
0dbfs = 20000


instr 1


ktab invalue "tabnum" ; table number selected
	
	if (ktab>10  || ktab<1) then
		ktab = 1 ; only allow existing tables
	endif
 
aSig oscilikt 5000, 440 , ktab 
	kEnv adsr .3, .2, 1, .3
	outs aSig * kEnv, aSig * kEnv
	
dispfft aSig, 0.5, 4096

endin


</CsInstruments>
<CsScore>

f1 0 4096 10  1 ; sine 
f2 0 4096 10  1 1 1 1 1 1 1 
f3 0 4096 9   .2 .5 90 .9 .333 90 6.1 .25 30 9.5 1 115 11 .222 180 13.2 1 90
f4 0 4096 9   1 1 0 3 .7 0 5 .9 0 13 .333 180
f5 0 4096 9   1 1 0 3 .333 180 5 .2 0 7 .143 180 9 .111 0 

f6 0 4096 10 1 .5 .333 .25 .2 .166 .142 .125 .111 .1 .09 .083 .076 .071 .066 .062 ; saw
f7 0 4097 20 3 1; hanning window
f8 0 4096 7  1 2048 1 0 -1 2048 -1 ; square  
f9 0 4096 7  -1 1024   .7 1024   -.3 1024    1 1024    1 ; wave shaping 4 segments
f10 0 4096 7  1 10 1 0 1 0; impulse 
;4. freq start  5. freq end 6.ftable lookup

i1 0 3600	



</CsScore>
</CsoundSynthesizer><bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1144</x>
 <y>248</y>
 <width>457</width>
 <height>332</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>tabnum</objectName>
  <x>70</x>
  <y>253</y>
  <width>80</width>
  <height>25</height>
  <uuid>{5cf83557-7852-48de-972f-d5b83ef01a96}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>-1e+12</minimum>
  <maximum>1e+12</maximum>
  <randomizable group="0">false</randomizable>
  <value>4</value>
 </bsbObject>
 <bsbObject version="2" type="BSBGraph">
  <objectName>graph</objectName>
  <x>46</x>
  <y>81</y>
  <width>350</width>
  <height>150</height>
  <uuid>{8a149aa7-b98b-492b-8596-e11fc75915f7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <value>3</value>
  <objectName2>graph_f_t</objectName2>
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
ioText {70, 253} {80, 25} editnum 4.000000 1.000000 "tabnum" left "" 0 {0, 0, 0} {61440, 61440, 61440} nobackground noborder 4.000000
ioGraph {46, 81} {350, 150} table 3.000000 1.000000 graph
</MacGUI>
