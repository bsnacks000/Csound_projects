<CsoundSynthesizer>
<CsOptions>
;--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps =128
nchnls = 1
0dbfs = 20000

seed 0

giSine ftgen 0,0,8192, 	10, 		1 	

;stretch shapes

instr 1		;event gen
ievent_dur = p3		; from score
icount = 0
idensity = 50

loop:
    print icount
    
   	iamp random -38, -32 
   	icps_a random 150, 2000
   	icps_b	random 150, 2000
    
    event_i "i", 2, 0, ievent_dur, iamp, icps_a, icps_b

loop_le icount, 1, idensity, loop

endin

instr 2		;oscil bank
idur =	p3

iamp = ampdbfs(p4)

ia = p5
ib = p6

kcps line ia, idur, ib


aSig poscil iamp, kcps, giSine
	aEnv adsr 0.01, 0, 1, .01 

	out aSig * aEnv


endin


</CsInstruments>
<CsScore>

i1 0 15

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
 <bsbObject version="2" type="BSBVSlider">
  <objectName>slider1</objectName>
  <x>5</x>
  <y>5</y>
  <width>20</width>
  <height>100</height>
  <uuid>{50a8a6d0-5e98-43f9-b7aa-b21e106d7df8}</uuid>
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
