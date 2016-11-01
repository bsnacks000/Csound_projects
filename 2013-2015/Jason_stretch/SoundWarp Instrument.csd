<CsoundSynthesizer>
<CsOptions>
--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps =10
nchnls = 2  
0dbfs = 20000


giSource1 ftgen 0, 0, 0, 1, "intro -  unstretched-longer.wav", 0, 0, 0

giWin_Gauss ftgen 0,0,8192, 20,6

instr 1

iamp = 10000
itimewarp = 100
iresample = 1

ifn1 = giSource1
ibeg = 1
iwsize = 2205
irandw = 75
ioverlap = 500
ifn2 = giWin_Gauss
itimemode = 0


aSig, aComp sndwarp iamp, itimewarp, iresample, ifn1, ibeg, iwsize, irandw, ioverlap, ifn2, itimemode

	aBal balance aSig, aComp 
	aEnv adsr .01, 0, 1, .1

outs aBal * aEnv, aBal * aEnv
endin


</CsInstruments>
<CsScore>

f 0 1
s

i1 0 600


</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1720</x>
 <y>72</y>
 <width>198</width>
 <height>626</height>
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
  <uuid>{c8dece58-6d49-4d03-abb4-b26f34b570df}</uuid>
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
WindowBounds: 1720 72 198 626
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioSlider {5, 5} {20, 100} 0.000000 1.000000 0.000000 slider1
</MacGUI>
