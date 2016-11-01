<CsoundSynthesizer>
<CsOptions>
--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps =10
nchnls = 2
0dbfs = 20000

pyinit

seed 1

instr 1 ; i time loop

;; equivalent of while loop at i-time... runs before 

icount = 1
count:
    	irand random 1, 10
    	print icount
	print int(irand)
	
	icount = icount + 1
if icount < 11 igoto count
     prints "i-END!%n"   ;;note the else does not need to be declared

endin

instr 2 ; simpler i time loop that counts up <= value

icount = 1  ; initial condition

loop:
    print icount
    loop_le icount, 1, 10, loop
    	prints "Finished!%n"
    ; variable, increment, max value, goto label
    ; else statement need not be declared
endin


instr 3 ; python variant

pyruni {{
icount  = 1

while icount <= 10:
    print "The count is " + str(icount)
    icount = icount + 1
print "Finished!"
}}
endin 

instr 4

icount = 1

loop:
     
    irand random 0, 2 
    
    print icount, int(irand)
    
    loop_le icount, 1, 15, loop

prints "finished%n"
endin


</CsInstruments>
<CsScore>

i4 0 1
i4 5 2
i4 8 1

</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>72</x>
 <y>179</y>
 <width>400</width>
 <height>200</height>
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
  <uuid>{df5fa3a1-e66b-4c05-93bf-5018afc820fe}</uuid>
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
<MacOptions>
Version: 3
Render: Real
Ask: Yes
Functions: ioObject
Listing: Window
WindowBounds: 72 179 400 200
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioSlider {5, 5} {20, 100} 0.000000 1.000000 0.000000 slider1
</MacGUI>
