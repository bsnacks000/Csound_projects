<CsoundSynthesizer>
<CsOptions>
--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps =128
nchnls = 1
0dbfs = 20000

giSine ftgen 0, 0, 8192, 10, 1


; example from Csound FLOSS.. 
instr 1
kCarrier_Freq = 100
kMod_Freq = p5

kMod_Factor = kCarrier_Freq/kMod_Freq  ; this is one realization-- factor can be any value

kline1  randomi 1, 25, 1 
kIndex = kline1/ 6.28   ; need to divide Index factor by 2pi in order to read from table 

aEnv adsr 1, 0, 1 , .1 

aMod_osc poscil kIndex * aEnv, kMod_Freq * kMod_Factor, giSine
aPhase phasor kCarrier_Freq
aCarrier tablei aPhase + aMod_osc, giSine , 1 , 0, 1


out aCarrier * aEnv * p4 

endin

instr 2; simple focsil FM synth w/feedback
kSig init 0 
kSig_mod init 0

idur = p3
kamp = 2000  
kcps = 200 + (kSig_mod * 0.01)
acar_factor = 1.2 
amod_factor = 1.5 
kndx line 1, idur, 3



aSig foscili kamp, kcps, acar_factor, amod_factor, kndx, giSine 
aEnv adsr 1, 0, 1 , .1

kSig downsamp aSig
kSig_mod = kSig + 100

out aSig * aEnv
endin

instr 3 ; same as intr 1 but with feedback

aCarrier init 0 ; initialize Carrier 

kCarrier_Freq = 200
kMod_Freq = 123

kMod_Factor = kMod_Freq/kCarrier_Freq;kCarrier_Freq/kMod_Freq  ; this is one realization-- factor can be any value

kline1  randomi 1, 15, 5 
kIndex = kline1/ 6.28   ; need to divide Index factor by 2pi in order to read from table 

aEnv adsr 1, 0, 1 , .1 

aMod_osc poscil kIndex * aEnv, kMod_Freq * kMod_Factor, giSine
aPhase phasor kCarrier_Freq

kline2 linseg 0.001, p3/4, .1,p3/4,.175, p3/4,.001, p3/4, .1 ;can only get to about .2 before chaotic behavior 
aCarrier tablei aPhase + aMod_osc +(aCarrier * kline2), giSine , 1 , 0, 1

aLP_filt butterlp aCarrier, sr * 0.1 ; LPF helps reduce noise

out aLP_filt * aEnv * 2000 
endin

instr 4 ; same as intr 3 but with feedback and stacked modulators

aCarrier_Sig init 0 ; initialize Carrier for feedback 

kCarrier_Freq = 100

;FACTOR - multiply Factor * Carrier Freq to get Modhz 1 and 2
kMod1_Factor = 2
kMod2_Factor = .3

krandom1 randomi 1, 10, 2
krandom2 randomi 1, 10, 3
kIndex1 = krandom1/ 6.28   ; need to divide Index factor by 2pi in order to read from table 
kIndex2 = krandom2/ 6.28

kMod1_Freq = kMod1_Factor * kCarrier_Freq
kMod2_Freq = kMod2_Factor * kCarrier_Freq

aEnv adsr 1, 0, 1 , .1 ; amp env for all osc amp signals

aMod1 poscil kIndex1 * aEnv, kMod1_Freq , giSine

aPhasor_Mod phasor kMod2_Freq
aPhasor_Mod = aPhasor_Mod + aMod1
aMod2 tablei aPhasor_Mod, giSine , 1, 0, 1
aMod2 = aMod2 * kIndex2

aPhasor_Car phasor kCarrier_Freq
aPhasor_Car = aPhasor_Car + aMod2


kline2 linseg 0.001, p3/4, .1,p3/4,.175, p3/4,.001, p3/4, .1
aCarrier_Sig tablei aPhasor_Car + (aCarrier_Sig * kline2),giSine,1,0,1
 
aLP_filt butterlp aCarrier_Sig, sr * 0.2 ; LPF helps reduce noise

out aLP_filt * aEnv * 2000 
endin

</CsInstruments>
<CsScore>

i1 0 60    100   220
i1 2 60    300   520 
i1 6 60    600   460
i1 6 60    400   89
i1 9 60    600   432
i1 10 60    200   836
i1 13 60    300   73
i1 15 60    400   102
i1 25 60    100   34
i1 27 60    200   274
i1 29 60    600   500
i1 30 60    300   400 
i1 30 60    100   347
i1 31 60    100   218
i1 32 60    200   106

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
  <uuid>{65b0ee50-9783-42f7-93f6-2ed5675dda3a}</uuid>
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
