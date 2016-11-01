 <CsoundSynthesizer>
<CsOptions>
;--displays
;-Q1 
;--midioutfile=mmm1.mid
</CsOptions>
<CsInstruments>
sr = 44100
ksmps =128
nchnls = 1
0dbfs = 20000

seed 0

#define HISTOGRAM(name)#
$name ftgenonce 0, 0, -20, 42, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17,p18, p19
#

;---------CHN_random_tables-----------
;-------------------------------------
instr 1 ;GEN 42 for duserrnd _chan... [lrange,hrange,percent in decimal]
gi_rand_chn_table_1 ftgenonce 0, 0, -20, 42, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17,p18, p19
endin
instr 2 ;GEN 42 for duserrnd _chan... [lrange,hrange,percent in decimal]
gi_rand_chn_table_2 ftgenonce 0, 0, -20, 42, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17,p18, p19
endin
instr 3 ;GEN 42 for duserrnd _chan... [lrange,hrange,percent in decimal]
gi_rand_chn_table_3 ftgenonce 0, 0, -20, 42, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17,p18, p19
endin

;--------DURATION_random_tables----
;----------------------------------
instr 4 ;GEN 42 for duserrnd _chan... [lrange,hrange,percent in decimal]
gi_rand_dur_table_1 ftgenonce 0, 0, -20, 42, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17,p18, p19
endin
instr 5 ;GEN 42 for duserrnd _chan... [lrange,hrange,percent in decimal]
gi_rand_dur_table_2 ftgenonce 0, 0, -20, 42, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17,p18, p19
endin
instr 6 ;GEN 42 for duserrnd _chan... [lrange,hrange,percent in decimal]
gi_rand_dur_table_3 ftgenonce 0, 0, -20, 42, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17,p18, p19
endin
instr 7 ;GEN 42 for duserrnd _chan... [lrange,hrange,percent in decimal]
gi_rand_dur_table_4 ftgenonce 0, 0, -20, 42, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17,p18, p19
endin
instr 8 ;GEN 42 for duserrnd _chan... [lrange,hrange,percent in decimal]
gi_rand_dur_table_5 ftgenonce 0, 0, -20, 42, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17,p18, p19
endin
instr 9 ;GEN 42 for duserrnd _chan... [lrange,hrange,percent in decimal]
gi_rand_dur_table_6 ftgenonce 0, 0, -20, 42, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17,p18, p19
endin


;--------SILENCE_random_tables-----
;----------------------------------
instr 10 ;GEN 42 for duserrnd _chan... [lrange,hrange,percent in decimal]
gi_rand_silence_table_1 ftgenonce 0, 0, -20, 42, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17,p18, p19
endin
instr 11 ;GEN 42 for duserrnd _chan... [lrange,hrange,percent in decimal]
gi_rand_silence_table_2 ftgenonce 0, 0, -20, 42, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17,p18, p19
endin
instr 12 ;GEN 42 for duserrnd _chan... [lrange,hrange,percent in decimal]
gi_rand_silence_table_3 ftgenonce 0, 0, -20, 42, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17,p18, p19
endin
instr 13 ;GEN 42 for duserrnd _chan... [lrange,hrange,percent in decimal]
gi_rand_silence_table_4 ftgenonce 0, 0, -20, 42, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17,p18, p19
endin
instr 14 ;GEN 42 for duserrnd _chan... [lrange,hrange,percent in decimal]
gi_rand_silence_table_5 ftgenonce 0, 0, -20, 42, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17,p18, p19
endin
instr 15 ;GEN 42 for duserrnd _chan... [lrange,hrange,percent in decimal]
gi_rand_silence_table_6 ftgenonce 0, 0, -20, 42, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17,p18, p19
endin

;------global RANDOM_bandwidth-----  for vel & frequency
;----------------------------------

klower line p4, p3, p5
kupper line p6, p3, p7
krate line p8, p3, p9

gkrandomh1 randomh klower, kupper, krate, 3 ,0

;-----global_ lineseg-------;
;--------------------------

instr 28 ; global line seg
gk_line_seg_1 linseg p4, p3 * 1/3, p5 , p3 * 1/3, p6, p3 * 1/3, p7 
endin
instr 29 ; global line seg
gk_line_seg_2 linseg p4, p3 * 1/3, p5 , p3 * 1/3, p6, p3 * 1/3, p7 
endin
instr 30 ; global line seg
gk_line_seg_2 linseg p4, p3 * 1/3, p5 , p3 * 1/3, p6, p3 * 1/3, p7 
endin
instr 31 ; global line seg
gk_line_seg_2 linseg p4, p3 * 1/3, p5 , p3 * 1/3, p6, p3 * 1/3, p7 
endin
instr 32 ; global line seg
gk_line_seg_2 linseg p4, p3 * 1/3, p5 , p3 * 1/3, p6, p3 * 1/3, p7 
endin
instr 3 ; global line seg
gk_line_seg_2 linseg p4, p3 * 1/3, p5 , p3 * 1/3, p6, p3 * 1/3, p7 
endin



instr 101; midi voice 1;  p4 & p5 = setting for channel and velocity 

	if (pX == 1) then
		kchn = x_chn_numb 
	else
		kchn duserrnd kTableNumber  ; only inst 1 - 3
	endif
	
	if (pY == 1) then
		kvel = x_global_lineseg
	else
		kvel = x_global_random
	endif
	
		
knum = x_global_random
kdur = x_global_duserrnd   ; instr 4 - 9
kpause = x_global_duserrnd   ; instr 10 - 15

moscil kchn, knum, kvel, kdur, kpause

endin



</CsInstruments>
<CsScore>


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
  <uuid>{ce6936b8-34a7-4a55-b963-6bf900babd39}</uuid>
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
