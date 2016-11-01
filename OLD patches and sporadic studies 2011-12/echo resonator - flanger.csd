<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr = 44100
kr = 4410
nchnls = 2
0dbfs = 20000


instr 1; loscil  with echo resonator

idur = p3
iamp = p4

krvt = p5
ilooptime = p6


kEnv linen iamp, .2, idur, .1
aSig,aSig loscil kEnv, 1, 3, 1, 1

aFilt comb aSig * kEnv, krvt, ilooptime, 0

	outs aFilt+ aSig,aFilt+ aSig
endin	;;; better design would be to use this as global effect 


instr 2; vdelay flanger - cascading vdelay with white noise and lfo
idur = p3
iamp = p4

iatk = p5
irel = p6

ifrq = p7

iLFOrate1 = p8
iLFOrate2 = p9

imaxdel = p10

kEnv expseg .001, iatk, iamp, idur/8, iamp *.3, idur - (iatk + irel + idur/8), iamp *.7, irel, .01

kLFOrate line iLFOrate1, idur, iLFOrate2 
aLFO oscil imaxdel, kLFOrate/idur, 2  ; unipolar LFO controls the maximum resonance

anoise rand ifrq

adel4 vdelay anoise, aLFO, imaxdel 
adel3 vdelay adel4,  aLFO, imaxdel 
adel2 vdelay adel3,  aLFO, imaxdel 
adel1 vdelay adel2,  aLFO, imaxdel 
adel0 vdelay adel1,  aLFO, imaxdel 

aMix = adel4 + adel3 + adel2 + adel1 + adel0
	outs kEnv * aMix,kEnv * aMix

endin

;;try replacing expseg with a oscil1 that performs a unipolar/expon ADSR envelope... probably easier to code.
;; also try with oscil or loscil instead of white noise


instr 3; vdelay flanger - cascading vdelay with white noise and lfo
		; with oscil1 as exp envelope 
idur = p3
kamp = p4

ifrq = p5

iLFOrate1 = p6
iLFOrate2 = p7

imaxdel = p8

kEnv oscil1 0, kamp, idur, p9

kLFOrate line iLFOrate1, idur, iLFOrate2 
aLFO oscil imaxdel, kLFOrate/idur, 2  ; unipolar LFO controls the maximum resonance

anoise rand ifrq

adel4 vdelay anoise, aLFO, imaxdel 
adel3 vdelay adel4,  aLFO, imaxdel 
adel2 vdelay adel3,  aLFO, imaxdel 
adel1 vdelay adel2,  aLFO, imaxdel 
adel0 vdelay adel1,  aLFO, imaxdel 

aMix = adel4 + adel3 + adel2 + adel1 + adel0
	outs kEnv * aMix,kEnv * aMix

endin

instr 4; vdelay flanger - cascading vdelay with white noise and lfo
		; with oscil1 as exp envelope, loscil as source
idur = p3
kamp = p4

ifrq = p5

iLFOrate1 = p6
iLFOrate2 = p7

imaxdel = p8

kEnv oscil1 0, kamp, idur, p9

kLFOrate line iLFOrate1, idur, iLFOrate2 
aLFO oscil imaxdel, kLFOrate/idur, 2  ; unipolar LFO controls the maximum resonance

aSig,aSig loscil kEnv, ifrq, 3, 1, 1

adel4 vdelay aSig, aLFO, imaxdel 
adel3 vdelay adel4,  aLFO, imaxdel 
adel2 vdelay adel3,  aLFO, imaxdel 
adel1 vdelay adel2,  aLFO, imaxdel 
adel0 vdelay adel1,  aLFO, imaxdel 

aMix = adel4 + adel3 + adel2 + adel1 + adel0
	outs kEnv * aMix,kEnv * aMix

endin



</CsInstruments>



<CsScore>

f1 0 8192 10 1 1 1 .5 1
f2 0 8192 19 1 .5 0 .5 
f3 0 0    1 "drum sample.wav" 0 0 0

f4 0 1024 5 .001 100 1 412 .001  412 .75 100 .001
f5 0 1024 5 .001 50 1 50  .001 412 .75  412 .3 100 .001
f6 0 1024 5 .001 100 1 800 .75 100 .001
f7 0 1024 5 .001 25 1 25 .001 50 1 412 .001  412 .75 100 .001

;    3.dur  4.amp        5. rvrb time 6. looptime
s
i1 0 6		10    	       5   .5
i1 2 9		10    	       4   .25
i1 3 5		10    	       4   .25
i1 4 6		10    	       2   .0625  
i1 10 4		10			   2   .03125
i1 12 6		10			   3   .03125
i1 13 2		10			   2.5   .03125
i1 14 1		9			   3.7   .03345
i1 14 9		8			   1.2   .05125
i1 14 10		7			   2.3   .07125

; 3.dur 4.amp   5.atk  6.rel  7.freq   8.LFO1  9. LFO2   10. maxdelay
 
s                                        ; short passage using drum sample from loscil 
i4 0   4  25    10    .6   1    43     4 ; envelope ftable
i4 1   1  10    4     2    .1   60     5 
i4 3   2  28    9     2    .1   53     7 
i4 5   3  13    9     3    .5   26     6
i4 6   2  14    15    .4   .2   10     7 
i4 6   5  10    17     4    .1  10    4
i4 7   3  10    6     .1   .1   7     5
i4 8   4  10    3      2   .3   8     6

i1 7   3  9     2 .01325
i1 8   5  7     2 .001

i3 8   3  10    100    .1 .6    75     5
i3 10   5  10    75    .2 .2    50     4
i3 11   2  10    43    .2 .5    64     4
i3 12   3  10    10    .2 .5    12     5
i3 13   1  10    10    .2 .5    12     7 

i1 13   5  5     2 .003
i1 13   2  6     4  .0625 
i1 13   2  2     10  .25

i4 11   7  12    6    .4    .2   90       6 
i4 14   5  9    16     1    .1   150     4

i3 14   3  10    15      .1   .5      9     3 
i3 15   4  6     12      .9   .3      3     10 

</CsScore>
</CsoundSynthesizer><bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1046</x>
 <y>600</y>
 <width>465</width>
 <height>140</height>
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
  <uuid>{9bd0d9fc-fde8-4e52-ba14-6190aa30f453}</uuid>
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
