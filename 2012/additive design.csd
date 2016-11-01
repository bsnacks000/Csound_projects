<CsoundSynthesizer>
<CsOptions>
--displays
</CsOptions>
<CsInstruments>
sr = 44100
kr = 4410
ksmps = 10
nchnls = 2
0dbfs = 20000

gaLFO1 init 0
gaLFO2 init 0
gaLFO3 init 0
gaLFO4 init 0

; sines and complex sines

giWave1  ftgen 1, 0, 8192, 10, 1					; basic sine
giWave2  ftgen 2, 0, 8192, 10, 1, 0.50, 0.33, 0.2, .166,.143 ; basic saw
giWave3  ftgen 3, 0, 8192, 10, 1,0,.111,0,.4,0,.0204,0,.0123456,0,.00826, 0 ; basic triangle
giWave4  ftgen 4, 0, 8192, 10, 1,0,.111,0,.4,.333,.0204,0,.0123456,.222,.00826 ; complex triangle (arch)
giWave5  ftgen 5, 0, 8192, 9,   1,1,90,   ; basic cosine 
giWave6	 ftgen 6, 0, 8192, 9, 	.75,1,0,   	2.25,1,0,  3.17, 1, 0,  5.83, 1, 0 	; complex sine
giWave7  ftgen 7, 0, 8192, 9,    1.66,1,0,   3.33,1,0   ; complex sine	

; bit reduced to 16
giWave8  ftgen 8, 0, 16, 10, 1
giWave9 ftgen 9, 0, 16, 10, 1, 0.36, 0.33, 0.61, 1 
giWave10 ftgen 10, 0, 16, 10, 1,0,.111,0,.4,.333,.0204,0,.0123456,.222,.00826

; Cosine pulse waves

giWave11 ftgen 11, 0, 8192, 11,   5, 1, 1     ; safe for high freq
giWave11 ftgen 12, 0, 8192, 11,   10, 1, .9   ; safe for high freq
giWave12 ftgen 13, 0, 8192, 11,   15, 9, .75    ; low freq only - crazy aliasing
giWave13 ftgen 14, 0, 8192, 11,   25, 9, .95   ; low freq only - crazy aliasing
giWave14 ftgen 15, 0, 8192, 11,   50, 1, 1    ; low freq only - crazy aliasing

instr 1
; additive synth instrument - 7 upper partials with random (independent) frequency deviation and variable waveforms
; Amplitude modulation on upper partials provided by randomi opcode, user specified deviation

;; carrier control block;;
idur = p3			; amp envelope
iamp = ampdb(p4) 
iatt = p5
idec = p6
islev = p7
irel = p8

ifreq1 = p9      ;pitch envelope (cannot equal 0 due to use of expon)
ifreq2 = p10
ifreq3 = p11
ifreq4 = p12
ifreq5 = p13

ifn1 = p14		; partial function tables
ifn2 = p15
ifn3 = p16
ifn4 = p17
ifn5 = p18
ifn6 = p19
ifn7 = p20

;; slave control block ;;
; 1st bank patched cps of randomi 

imin = p21         ;random constrained value for deviation cps 
imax = p22

kmin1 = p23			; freq deviation
kmax1 = p24
imode1 = p25
ifirstval1 = p26
 
imin1 = p27		; random constrained value for scaling deviation
imax1 = p28

seed p29

iLFOswitch = p30



	irandom_cps1 random imin, imax
	irandom_cps2 random imin, imax
	irandom_cps3 random imin, imax
	irandom_cps4 random imin, imax
	irandom_cps5 random imin, imax
	irandom_cps6 random imin, imax
	
	ifreqscale_deviation1 random imin1, imax1
	ifreqscale_deviation2 random imin1, imax1
	ifreqscale_deviation3 random imin1, imax1
	ifreqscale_deviation4 random imin1, imax1
	ifreqscale_deviation5 random imin1, imax1
	ifreqscale_deviation6 random imin1, imax1

	irandom_car_scale1 random 1,2
	irandom_car_scale2 random 1,2
	irandom_car_scale3 random 1,2
	irandom_car_scale4 random 1,3
	irandom_car_scale5 random 1,3
	irandom_car_scale6 random 1,3



kfreq_deviation1 randomi kmin1, kmax1, irandom_cps1,imode1 ,ifirstval1
kfreq_deviation2 randomi kmin1, kmax1, irandom_cps2,imode1 ,ifirstval1
kfreq_deviation3 randomi kmin1, kmax1, irandom_cps3,imode1 ,ifirstval1
kfreq_deviation4 randomi kmin1, kmax1, irandom_cps4,imode1 ,ifirstval1
kfreq_deviation5 randomi kmin1, kmax1, irandom_cps5,imode1 ,ifirstval1
kfreq_deviation6 randomi kmin1, kmax1, irandom_cps6,imode1 ,ifirstval1

kamp_deviation1 randomi 0, 1, irandom_cps1,2 ,.87
kamp_deviation2 randomi 0, 1, irandom_cps2,2 ,.76
kamp_deviation3 randomi 0, .9, irandom_cps3,2 ,.65
kamp_deviation4 randomi 0, .75, irandom_cps4,2 ,.54
kamp_deviation5 randomi 0, .7, irandom_cps5,2 ,.49
kamp_deviation6 randomi 0, .6, irandom_cps6,2 ,.36


kcarrier_freq expseg ifreq1, p3/4, ifreq2 , p3/4 , ifreq3, p3/4, ifreq4, p3/4, ifreq5

;; audio block

aOSC1 poscil iamp, kcarrier_freq, ifn1 
aOSC2 poscil (iamp * kamp_deviation1), (kcarrier_freq * irandom_car_scale1) + (kfreq_deviation1 * ifreqscale_deviation1), ifn2 
aOSC3 poscil (iamp * kamp_deviation2), (kcarrier_freq * irandom_car_scale2) + (kfreq_deviation2 * ifreqscale_deviation2), ifn3
aOSC4 poscil (iamp * kamp_deviation3), (kcarrier_freq * irandom_car_scale3) + (kfreq_deviation3 * ifreqscale_deviation3), ifn4 
aOSC5 poscil (iamp * kamp_deviation4), (kcarrier_freq * irandom_car_scale4) + (kfreq_deviation4 * ifreqscale_deviation4), ifn5 
aOSC6 poscil (iamp * kamp_deviation5), (kcarrier_freq * irandom_car_scale5) + (kfreq_deviation5 * ifreqscale_deviation5), ifn6 
aOSC7 poscil (iamp * kamp_deviation6), (kcarrier_freq * irandom_car_scale6) + (kfreq_deviation6 * ifreqscale_deviation6), ifn7 

aMIX = aOSC1 + aOSC2 + aOSC3 + aOSC4 + aOSC5 + aOSC6 + aOSC7

; LFO initialization block -- choose between 4 different LFOs in score

	if iLFOswitch == 1 then
		aMIX = aMIX * gaLFO1
	elseif iLFOswitch == 2 then
		aMIX = aMIX * gaLFO2
	elseif iLFOswitch == 3 then
		aMIX = aMIX * gaLFO3		
	elseif iLFOswitch == 4 then
		aMIX = aMIX * gaLFO4
	endif


aMIXfilt1 butterlp aMIX, 12000
aMIXfilt2 butterlp aMIXfilt1, 12000 


aEnv adsr iatt, idec, islev, irel 

 	outs aMIXfilt2 * aEnv, aMIXfilt2 *aEnv

	dispfft aMIXfilt2, .05, 1024 
endin

;; GLOBAL LFOs

instr 2

irate1 = p4
irate2 = p5
irate3 = p6
irate4 = p7
irate5 = p8
itype = p9


krate linseg irate1, p3/4, irate2, p3/4, irate3, p4/4, irate4, p3/4, irate5
gaLFO1 lfo 1, krate , itype

endin

instr 3

irate1 = p4
irate2 = p5
irate3 = p6
irate4 = p7
irate5 = p8
itype = p9


krate linseg irate1, p3/4, irate2, p3/4, irate3, p4/4, irate4, p3/4, irate5
gaLFO2 lfo 1, krate , itype

endin


instr 4

imin = p4
imax = p5

ifreq1 = p6
ifreq2 = p7
ifreq3 = p8
ifreq4 = p9
ifreq5 = p10

itype = p11
ifirstval = p12 

kcps linseg ifreq1, p3/4, ifreq2, p3/4, ifreq3, p3/4, ifreq4, p3/4, ifreq5
krate randomi imin, imax, kcps, 3,0 
gaLFO3 lfo 1, krate , itype

endin

instr 5

imin = p4
imax = p5

ifreq1 = p6
ifreq2 = p7
ifreq3 = p8
ifreq4 = p9
ifreq5 = p10

itype = p11 

kcps linseg ifreq1, p3/4, ifreq2, p3/4, ifreq3, p3/4, ifreq4, p3/4, ifreq5
krate randomi imin, imax, kcps, 3, 0 
gaLFO4 lfo 1, krate , itype

endin




</CsInstruments>
<CsScore>

f 0 2
s	
;Global LFO initialization

i2 0 50    6 6 6 4 3    1
i3 0 50    4 5 6 5 3    1
i4 0 50    0 9 		2 3 3 5 16  		 5
i5 0 50	   0 15     2 2 6 9 16  		 5		

;																				;(DEVIATIONS)
;				   (AMP_env)	        (PITCH)		       (WAVEFORMS)		        (cps_dev)     (freq_dev)      (devscale)
; strt_dur_amp	:: A  D  S  R :: 1   2   3   4   5  :: 1 2 3 4 5 6 7::::	;  min max::  min max mode 1stval:: min max	::  seed :: LFO	
																			              
i1 0 50  60 	.05 0  1  3  	109 107 105 100 90     1 2 3 1 2 3 1           1   15        1   2    3    0       1 3        1     3   
i1 0	50  60 	.05 0  1  3   	102 103 107 108 120    14 13 4 9 2 3 1         1   6         1   5    3    0       1 2        3     4    
i1 0 50  60    .05 0  1  3   	200 210 207 212 200    3 4 6 5 4 3 4           0   3         0   20   3    0       1 4        6     3    
i1 0 50  60    .05 0  1  3   	130 150 190 212 301    8 9 11 5 14 1 1         0   8         0   25   3    0       1 6        2     4
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
 <bsbObject version="2" type="BSBScope">
  <objectName/>
  <x>12</x>
  <y>24</y>
  <width>349</width>
  <height>149</height>
  <uuid>{ad48026e-c2f8-46bb-98f9-cb51ff3664f5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
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
  <x>13</x>
  <y>186</y>
  <width>350</width>
  <height>150</height>
  <uuid>{84955d34-3d99-441f-934f-6a2c2ec77531}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
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
ioGraph {12, 24} {349, 149} scope 2.000000 -255 
ioGraph {13, 186} {350, 150} table 0.000000 1.000000 
</MacGUI>
