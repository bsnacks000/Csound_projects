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

;---------------MACROS-------------;
;----------------------------------;

; GEN42 macro   for global duserrnd  [lrange,hrange,percent in decimal]
#define HISTOGRAM(name'number'tab_numb')#
instr $number
$name ftgentmp $tab_numb, 0, 512, 42, p4,p5,p6,p7,p8,p9,p10
endin
#

; Random number generator --- for bandwidth & velocity [lower1&2, upper1&2, rate1&2]
#define RANDOM(name'number')#
instr $number
klower line p4, p3, p5
kupper line p6, p3, p7
krate line p8, p3, p9
$name randomh klower, kupper, krate, 3 ,0
endin
#

; Line Seg generator -- optional control of velocity (or other parameters) -  4 point/3 segment - linear [point 1, 2, 3, 4]
#define LINE_SEG(name'number')#
instr $number
$name linseg p4, p3 * 1/3, p5 , p3 * 1/3, p6, p3 * 1/3, p7 
endin
#

; Global duserrnd - density  [table number]
#define HIST_RND(name'number')#
instr $number
$name duserrnd p4
endin
#

;#define VOICE(number'g_lineseg'g_random_vel'g_random_num'g_rnd_dur'g_rnd_sil')#
;instr $number
;	if (p4 == 1) then
;		kchn = p5 
;	else
;		kTableNumber = p5
;		kchn duserrnd kTableNumber  ; random channel number from table -- only inst 1 - 3
;	endif
;	if (p6 == 1) then                ;velocity setting  - linear or statistical
;		kvel = $g_lineseg
;	else
;		kvel = $g_random_vel
;	endif
;;knum = $g_random_num
;;kdur = $g_rnd_dur   
;;ksilence = $g_rnd_sil   
;moscil int(kchn), int($g_random_num), $g_random_vel, $g_rnd_dur, $g_rnd_sil
;endin
;#

;-------------------------------------
;---------CHN_random_tables----------- table numbers used for global_dusernd pfield

$HISTOGRAM(gi_rand_chn_table_1'1'1') 
$HISTOGRAM(gi_rand_chn_table_2'2'1') 
$HISTOGRAM(gi_rand_chn_table_3'3'3') 


;--------DURATION_random_tables----

$HISTOGRAM(gi_rand_dur_table_1'4'4') 
$HISTOGRAM(gi_rand_dur_table_2'5'5') 
$HISTOGRAM(gi_rand_dur_table_3'6'6') 
$HISTOGRAM(gi_rand_dur_table_4'7'7') 
$HISTOGRAM(gi_rand_dur_table_5'8'8') 
$HISTOGRAM(gi_rand_dur_table_6'9'9') 



;--------SILENCE_random_tables-----
;----------------------------------
$HISTOGRAM(gi_rand_silence_table_1'10'10')
$HISTOGRAM(gi_rand_silence_table_1'11'11')
$HISTOGRAM(gi_rand_silence_table_1'12'12')
$HISTOGRAM(gi_rand_silence_table_1'13'13')
$HISTOGRAM(gi_rand_silence_table_1'14'14')
$HISTOGRAM(gi_rand_silence_table_1'15'15')

;------global RANDOM_bandwidth-----  for vel & frequency

$RANDOM(gk_random_1'16')
$RANDOM(gk_random_2'17')
$RANDOM(gk_random_3'18')
$RANDOM(gk_random_4'19')
$RANDOM(gk_random_5'20')
$RANDOM(gk_random_6'21')

$RANDOM(gk_random_7'22')
$RANDOM(gk_random_8'23')
$RANDOM(gk_random_9'24')
$RANDOM(gk_random_10'25')
$RANDOM(gk_random_11'26')
$RANDOM(gk_random_12'27')
;-----global_ lineseg-------;
;--------------------------

$LINE_SEG(gk_line_seg_1'28')
$LINE_SEG(gk_line_seg_1'29')
$LINE_SEG(gk_line_seg_1'30')
$LINE_SEG(gk_line_seg_1'31')
$LINE_SEG(gk_line_seg_1'32')
$LINE_SEG(gk_line_seg_1'33')
;------------------------------;

;------global_duserand---------;  for density

$HIST_RND(gk_dur_1'34')
$HIST_RND(gk_dur_2'35')
$HIST_RND(gk_dur_3'36')
$HIST_RND(gk_dur_4'37')
$HIST_RND(gk_dur_5'38')
$HIST_RND(gk_dur_6'39')

$HIST_RND(gk_sil_1'40')
$HIST_RND(gk_sil_2'41')
$HIST_RND(gk_sil_3'42')
$HIST_RND(gk_sil_4'43')
$HIST_RND(gk_sil_5'44')
$HIST_RND(gk_sil_6'45')

;---------------------------------------
;Instrument function key----------------
;(INST#, linseg_velocity(else 0), random_velocity(else 0), freq_function, dur_function, sil_function)
;seperate by a   '   
;--------------------------------------- 

;$VOICE(101'gk_line_seg_1'0'60'gk_dur_1'gk_sil_1')
;$VOICE(102'gk_line_seg_1'0'gk_random_1'gk_dur_1'gk_sil_1')
;$VOICE(103'gk_line_seg_1'0'gk_random_1'gk_dur_1'gk_sil_1')
;$VOICE(104'gk_line_seg_1'0'gk_random_1'gk_dur_1'gk_sil_1')
;$VOICE(105'gk_line_seg_1'0'gk_random_1'gk_dur_1'gk_sil_1')
;$VOICE(106'gk_line_seg_1'0'gk_random_1'gk_dur_1'gk_sil_1')



instr 201

kchn = 1
knum = gk_random_1
kvel = 50
kdur  = gk_dur_1
kpause = gk_sil_1

moscil int(kchn), int(knum), kvel, kdur, kpause
endin

</CsInstruments>
<CsScore>
;score should have a block for intruments needed for global variables and one 

i4 0 10    .125 .5 .5   .5 1 .5
i16 0 10   40 40 50 50 100 100 
i34 0 10   4
i40 0 10   4

;i101 0 10    1 1 1

i201 0 10

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
  <uuid>{4f1c0482-c896-4470-8661-03533b149ab5}</uuid>
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
