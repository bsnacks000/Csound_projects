<CsoundSynthesizer>
<CsOptions>
;--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps =128
nchnls = 2
0dbfs = 20000


gaSend1 init 0
gaSend2 init 0
gaSend3 init 0

gk_Verbscale init 0

giSine ftgen 0, 0, 2 ^ 15, 10, 1
seed 0

instr 1 ; test instrument -- k rate knobs

aCarrier init 0 ; initialize Carrier 

ia = p4
ib = p5

kCarrier_Freq line ia, p3, ib
kMod_Freq line ib *.8, p3, ia * .8
kIndex line log(ia), p3, log(ib)

kSig_amp randomi -22, -10, .3 
kFeed_amount randomi 0, .125, .5 , 3

kSig_amp = ampdbfs(kSig_amp)

kMod_Factor = kMod_Freq/kCarrier_Freq
kIndex = kIndex/ 6.28   ; divide by 2pi

aEnv adsr .1, 0, 1 , .1 

aMod_osc poscil kIndex * aEnv, kMod_Freq * kMod_Factor, giSine
aPhase phasor kCarrier_Freq

aCarrier tablei aPhase + aMod_osc +(aCarrier * kFeed_amount), giSine , 1 , 0, 1


aLP_filt butterlp aCarrier, sr * 0.1 ; LPF helps reduce noise


gaSend = aLP_filt * aEnv * kSig_amp		; mono out to hrtf
;out aLP_filt * aEnv * kSig_amp 
endin

instr 2 ; test instrument -- k rate knobs

aCarrier init 0 ; initialize Carrier 

ia = p4
ib = p5

kCarrier_Freq line ia, p3, ib
kMod_Freq line ib *.8, p3, ia * .8
kIndex line log(ia), p3, log(ib)

kSig_amp randomi -22, -10, .3 
kFeed_amount randomi 0, .125, .5 , 3

kSig_amp = ampdbfs(kSig_amp)

kMod_Factor = kMod_Freq/kCarrier_Freq
kIndex = kIndex/ 6.28   ; divide by 2pi

aEnv adsr .1, 0, 1 , .1 

aMod_osc poscil kIndex * aEnv, kMod_Freq * kMod_Factor, giSine
aPhase phasor kCarrier_Freq

aCarrier tablei aPhase + aMod_osc +(aCarrier * kFeed_amount), giSine , 1 , 0, 1


aLP_filt butterlp aCarrier, sr * 0.1 ; LPF helps reduce noise


gaSend2 = aLP_filt * aEnv * kSig_amp		; mono out to hrtf
;out aLP_filt * aEnv * kSig_amp 
endin

instr 3 ; test instrument -- k rate knobs

aCarrier init 0 ; initialize Carrier 

ia = p4
ib = p5

kCarrier_Freq line ia, p3, ib
kMod_Freq line ib *.8, p3, ia * .8
kIndex line log(ia), p3, log(ib)

kSig_amp randomi -22, -10, .3 
kFeed_amount randomi 0, .125, .5 , 3

kSig_amp = ampdbfs(kSig_amp)

kMod_Factor = kMod_Freq/kCarrier_Freq
kIndex = kIndex/ 6.28   ; divide by 2pi

aEnv adsr .1, 0, 1 , .1 

aMod_osc poscil kIndex * aEnv, kMod_Freq * kMod_Factor, giSine
aPhase phasor kCarrier_Freq

aCarrier tablei aPhase + aMod_osc +(aCarrier * kFeed_amount), giSine , 1 , 0, 1


aLP_filt butterlp aCarrier, sr * 0.1 ; LPF helps reduce noise


gaSend3 = aLP_filt * aEnv * kSig_amp		; mono out to hrtf
;out aLP_filt * aEnv * kSig_amp 
endin



instr 99
gk_Verbscale line 1, p3, 2
endin


instr 100

kaz randomi -180, 180, .3 + gk_Verbscale, 3
kel randomi -45, 90, .9 + gk_Verbscale, 3

aleft, aright hrtfmove2 gaSend1, kaz, kel, "hrtf-44100-left.dat", "hrtf-44100-right.dat", 

outs aleft, aright

endin

instr 200

kaz randomi -180, 180, .4 + gk_Verbscale, 3
kel randomi -45, 90, .7 + gk_Verbscale, 3

aleft, aright hrtfmove2 gaSend2, kaz, kel, "hrtf-44100-left.dat", "hrtf-44100-right.dat", 

outs aleft, aright

endin

instr 300

kaz randomi -180, 180, .2 + gk_Verbscale, 3
kel randomi -45, 90, 1.2 + gk_Verbscale, 3

aleft, aright hrtfmove2 gaSend3, kaz, kel, "hrtf-44100-left.dat", "hrtf-44100-right.dat", 

outs aleft, aright

endin


</CsInstruments>
<CsScore>

i1 0 150 		100 200
i2 0 150 		250 150
i3 0 150 		200 300

i99  0 150
i100 0 150
i200 0 150
i300 0 150



</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>30</width>
 <height>30</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
<MacOptions>
Version: 3
Render: Real
Ask: Yes
Functions: ioObject
Listing: Window
WindowBounds: 72 179 540 385
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
</MacGUI>
