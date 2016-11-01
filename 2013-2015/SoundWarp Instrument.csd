<CsoundSynthesizer>
<CsOptions>
--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps =10
nchnls = 2  ; mono output
0dbfs = 20000


giSource1 ftgen 0, 0, 1048576, 1, "Guitar Solo 1.wav", 0, 0, 0
giSource2 ftgen 0, 0, 2097152, 1, "Noise Guitar Solo Full.wav", 0, 0, 0

giWin_Gauss ftgen 0,0,8192, 20,6

instr 1

iamp = 8000
itimewarp = 3
iresample = 2.5

ifn1 = giSource2
ibeg = 2
iwsize = 4410
irandw = 850
ioverlap = 300
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

i1 0 300


</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1420</x>
 <y>72</y>
 <width>340</width>
 <height>667</height>
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
WindowBounds: 1420 72 340 667
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioSlider {5, 5} {20, 100} 0.000000 1.000000 0.000000 slider1
</MacGUI>
