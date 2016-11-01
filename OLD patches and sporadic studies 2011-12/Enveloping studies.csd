<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr = 44100
kr = 4410
nchnls = 2
0dbfs = 20000
; instruments from chapter 1 of csound book


instr 113 ; simple osc with linen envelope

kamp= p4  ; amplitude 
irise= p7  ; attack
idur= p3   ; duration
idec= p8   ; release

kEnv linen kamp *1000, irise, idur, idec ; scaled amplitude

ia=p9
ib=p10


kLine line ia, idur, ib

	aOut oscili kEnv, kLine, p6 
		outs	aOut,aOut 

		;dispfft aOut, 0.5, 4096


endin

instr 115; buzz osc with linen envelope control multiplied by output signal plus exp 

kamp= p4  ; amplitude 
irise= p7  ; attack
idur= p3   ; duration
idec= p8   ; release

kEnv2 linen kamp *1000, irise, idur, idec

ia_2 = p9  
ib_2 = p10

kline2 line ia_2, p3, ib_2

ia_ex= p11
ib_ex= p12
kHarm expon ia_ex, idur, ib_ex ; sweeps the number of harmonic partials in buzz

	aOut2 buzz 1, kline2, kHarm, p6  
	
		outs aOut2 * kEnv2,aOut2 * kEnv2
		;dispfft aOut2, 0.5, 4096

endin

instr 117 ; Grain instrument with a-rate envelope control using linen



iamp = p4 *1000
ipitch = p5

kdens linseg p9, p3/2, p10, p3/2, p11  
kampoff  line p12, p3, p13
kpitchoff  expon p14, p3, p15
	 
kgdur linrand p16 
igfn = p8
iwfn = 4
imgdur = .73


aOut3 grain iamp, ipitch, kdens, kampoff, kpitchoff, kgdur, igfn, \ iwfn, imgdur 
	aEnv linen aOut3, p6, p3, p7
	outs aEnv, aEnv

endin


instr 118 ; loscil with osc for envelope generator


aAmp oscil p4 * 1000, 1/p3, p7  ; - 1/p3 commits to one full cycle (read through) for duration at audio rate

kcps linseg p9, p3/4, p10, p3/4, p11, p3/4, p12, p3/4, p13

	aOut3,aOut3   loscil aAmp, kcps, 5, 200 , 1
		outs aOut3, aOut3
		
endin

</CsInstruments>
<CsScore>

f1 0 4096 10  1 
f2 0 4096 10  1 0 .5 0 .333 0 .222 0 .05 0 .015
f3 0 4096 9   1 1 0    3 .333 180   5 .2 0   7 .143 180   9 .111 0


f4 0 4097 20 1
f5 0 0     1 "drum sample2.wav" 0 0 0

;p4 - amplitude, p5-freq, p6-ftable, p7-attack,p8 release,p9 - p10 freq mod srt, 
;p11 -p12 - exp cosine sweep - buzz 
;GRAIN:: p9 - p11 (linseg)  density mod, p12 -13  amp deviation (line),  p14-15 max pitch deviation (expon)
;		p16 -- krange for linrand(duration)
;
;  			p4		p5	p6	p7	p8	  p9  p10   p11   p12    p13    p14    p15  p16

i113 0  9	5.9	 	1	1	.5	 3    220 222
i113 0  9	4.0 	1	1	.5	 2    222 220
i113 0  9	5.0 	1	2	1	 2	  320 321
i113 0  9   3.2		1   2   3    1    321 319 
i113 0  9   2.9		1   3   1    1    422 419
i113 0  9   2.4		1   2   1    1    421 417
i113 0  9   1.1		1   1   5    1    521 519
i113 0  9   0.7		1   2   6    .5   621 618
i113 0  9   0.7		1   3   7    .5   721 719
i113 0  9   0.5		1   2   7    .5   921 919

i115 9  9	7.8	 	2	1	.5	 3    100   101 	20   20
i115 .  9	5.7	 	2	3	1	 3    107   102 	20   30
i115 .  9	4.1	 	1	2	1	 2    102   104 	30   50
i115 .  9	3.7	 	1	3	2	 2    108   110 	50   70
i115 .  9	2.5	 	1	1	3	 1    113   112 	30   80
i115 .  9	1.5	 	1	2	3	 1    120   125 	40   90
 
i117 18 9	1.0	 400	3	2	 2    100 1 100      	10 50       200 1000      	20   
i117 + 8	0.6	 600	.5	1	 1    1 300 1        	100 25      100 10      	5
i117 + 9	0.7	 120	1	6	 2    25 50 25       	1 40        270 2843     	200
i117 + 3	0.6	 300	.3	.7	 2    775 10 744     	20 79       14 543      	25
i117 + 9	0.8	 700	4	.7	 2    350 100 450    	34 74       176 34      	1
i117 + 7	0.5	 175	5	1	 2    10  5 1        	235 465     234 653      	50
i117 + 9	0.4	 650	8	1	 2    125 350 200    	23 30       342 30      	645
i117 + 4	0.7	 250	1	2	 2    10 15 700      	50 98       23  2      		274
i117 + 6	0.5	 300	1	5	 2    500 1 100      	50 30       87  874      	5


i118 60 10   .11   0     0   1    5     1000 900 1000 925 1025
i118 + 8   .11   0     0   3    5     400 200 200 400 400
i118 + 7   .13   0     0   2    5     370  1000 1100 1100 1000
i118 + 5   .14   0     0   4    5     1000 900 1800 200 35


</CsScore>
</CsoundSynthesizer><bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1301</x>
 <y>4</y>
 <width>486</width>
 <height>307</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBScope">
  <objectName>scope1</objectName>
  <x>25</x>
  <y>23</y>
  <width>426</width>
  <height>173</height>
  <uuid>{cc807a0c-d19b-477c-a379-cea8de7a4f34}</uuid>
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
  <x>33</x>
  <y>240</y>
  <width>419</width>
  <height>228</height>
  <uuid>{6ee2ecea-3ba6-4a4e-8561-3cc233d5f9fc}</uuid>
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
ioGraph {25, 23} {426, 173} scope 2.000000 -255 scope1
ioGraph {33, 240} {419, 228} table 0.000000 1.000000 
</MacGUI>
