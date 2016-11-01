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


#define TABLE(number'name'table_n')#
instr $number 
$name ftgentmp $table_n, 0, -200, -42, p4, p5, p6,    p7, p8, p9,   p10,p11,p12
endin
#

#define HIST_RND(name'number')#
instr $number
$name duserrnd p4
endin
#

#define RANDOM(name'number')#
instr $number
klower line p4, p3, p5
kupper line p6, p3, p7
krate line p8, p3, p9
$name randomh klower, kupper, krate, 3 ,0
endin
#

#define LINE_SEG(name'number')#
instr $number
$name linseg p4, p3 * 1/3, p5 , p3 * 1/3, p6, p3 * 1/3, p7 
endin
#

#define VOICE(number'chn'note'vel'dur'pause')#
instr $number

kchn = $chn
knum = $note
kvel = $vel
kdur  = $dur
kpause = $pause

moscil kchn, int(knum), kvel, kdur, kpause
endin
#

;--------HISTOGRAMS - inst 1- 12-------;
$TABLE(1'gi_HIST_1'1')
$TABLE(2'gi_HIST_2'2')
$TABLE(3'gi_HIST_3'3')
$TABLE(4'gi_HIST_4'4')
$TABLE(5'gi_HIST_5'5')
$TABLE(6'gi_HIST_6'6')

$TABLE(7'gi_HIST_7'7')
$TABLE(8'gi_HIST_8'8')
$TABLE(9'gi_HIST_9'9')
$TABLE(10'gi_HIST_10'10')
$TABLE(11'gi_HIST_11'11')
$TABLE(12'gi_HIST_12'12')

;--------RANDOM bandwidth generators - inst 13 - 24-----;

$RANDOM(gk_random_1'13')
$RANDOM(gk_random_2'14')
$RANDOM(gk_random_3'15')
$RANDOM(gk_random_4'16')
$RANDOM(gk_random_5'17')
$RANDOM(gk_random_6'18')

$RANDOM(gk_random_7'19')
$RANDOM(gk_random_8'20')
$RANDOM(gk_random_9'21')
$RANDOM(gk_random_10'22')
$RANDOM(gk_random_11'23')
$RANDOM(gk_random_12'24')

;--------DUSSRND generators - inst 25 - 36--;

$HIST_RND(gk_tabrand_1'25')
$HIST_RND(gk_tabrand_2'26')
$HIST_RND(gk_tabrand_3'27')
$HIST_RND(gk_tabrand_4'28')
$HIST_RND(gk_tabrand_5'29')
$HIST_RND(gk_tabrand_6'30')

$HIST_RND(gk_tabrand_7'31')
$HIST_RND(gk_tabrand_8'32')
$HIST_RND(gk_tabrand_9'33')
$HIST_RND(gk_tabrand_10'34')
$HIST_RND(gk_tabrand_11'35')
$HIST_RND(gk_tabrand_12'36')

;-----global_ lineseg-------;
$LINE_SEG(gk_line_seg_1'37')
$LINE_SEG(gk_line_seg_2'38')
$LINE_SEG(gk_line_seg_3'39')
$LINE_SEG(gk_line_seg_4'40')
$LINE_SEG(gk_line_seg_5'41')
$LINE_SEG(gk_line_seg_6'42')

;-----------------------INSTRUMENTS ---------------------------------;
;--- [inst#, channel, bandwidth, velocity, duration, silence]--------


$VOICE(101'7'gk_random_1'gk_line_seg_1'gk_tabrand_1'gk_tabrand_7')
$VOICE(102'7'gk_random_2'gk_line_seg_1'gk_tabrand_2'gk_tabrand_8')
$VOICE(103'7'gk_random_3'gk_line_seg_1'gk_tabrand_3'gk_tabrand_9')
$VOICE(104'6'gk_random_4'gk_line_seg_2'gk_tabrand_3'gk_tabrand_9')
$VOICE(105'8'gk_random_5'gk_line_seg_3'gk_tabrand_3'gk_tabrand_9')
$VOICE(106'8'gk_random_6'gk_line_seg_3'gk_tabrand_3'gk_tabrand_9')


</CsInstruments>
<CsScore>
 
#define HIST_1 #i1#
#define HIST_2 #i2#
#define HIST_3 #i3#
#define HIST_4 #i4#
#define HIST_5 #i5#
#define HIST_6 #i6#

#define HIST_7 #i7#
#define HIST_8 #i8#
#define HIST_9 #i9#
#define HIST_10 #i10#
#define HIST_11 #i11#
#define HIST_12 #i12#

#define RANDOM_1 #i13#
#define RANDOM_2 #i14#
#define RANDOM_3 #i15#
#define RANDOM_4 #i16#
#define RANDOM_5 #i17#
#define RANDOM_6 #i18#

#define RANDOM_7 #i19#
#define RANDOM_8 #i20#
#define RANDOM_9 #i21#
#define RANDOM_10 #i22#
#define RANDOM_11 #i23#
#define RANDOM_12 #i24#

#define TABRAND_1 #i25#
#define TABRAND_2 #i26#
#define TABRAND_3 #i27#
#define TABRAND_4 #i28#
#define TABRAND_5 #i29#
#define TABRAND_6 #i30#

#define TABRAND_7 #i31#
#define TABRAND_8 #i32#
#define TABRAND_9 #i33#
#define TABRAND_10 #i34#
#define TABRAND_11 #i35#
#define TABRAND_12 #i36#

#define LINESEG_1 #i37#
#define LINESEG_2 #i38#
#define LINESEG_3 #i39#
#define LINESEG_4 #i40#
#define LINESEG_5 #i41#
#define LINESEG_6 #i42#


;;------- DUR_HISTOGRAMS------------- 				$HIST_x 1- 6
$HIST_1. 0 15     .1 .125 .7   .125 .167 .3   0 0 0
$HIST_2. 0 15     .1 .125 .4   .125 .5 .3   .333 .5 .3
$HIST_3. 0 15     .1 .125 .2   .25 .5 .3   .5 1 .4

;;------- VEL_HISTOGRAMS----------					$HIST_x 7- 12
$HIST_7. 0 15     0 0 .8   .125 .125 .2    0 0 0
$HIST_8. 0 15     0 0 .6   .125 .25  .3    .25 .333 .1
$HIST_9. 0 15     0 0 .5   .25  .5  .3     .5 .1 .2

;;-------- CHN_HISTOGRAMS -------------




;;----- FREQUENCY BANDWIDTH----------				$RANDOM_x
$RANDOM_1. 0 15     25 30 40 60 	2 5
$RANDOM_2. 0 15     66 70 80 95 	2 5
$RANDOM_3. 0 15     96 100 101 108 	2 5
$RANDOM_4. 0 15     40 55  56  90 		2 5
$RANDOM_5. 0 15     45 48  49  52 		5 1
$RANDOM_6. 0 15     64 55  56  80 		5 1

;;------ VELOCITY BANDWIDTH----------		

;;------ VELOCITY LINE SEG ------------				$LINESEG_x

$LINESEG_1. 0 15     96  85  75  48
$LINESEG_2. 0 15     45  50  75  100
$LINESEG_3. 0 15     30  45  65  70


;;------ DURATION RAND----------					$TABRAND_1 - 6
$TABRAND_1. 0 15    1
$TABRAND_2. 0 15    2
$TABRAND_3. 0 15    3

;;-------- SILENCE RAND----------			$TABRAND_7 - 12
$TABRAND_7. 0 15    7
$TABRAND_8. 0 15    8
$TABRAND_9. 0 15    8

;;-------- CHN. RAND ----------





;-------------------
;----VOICES---------
i101 0  3.5  
i102 1.5  4 
i103 4 6 
i104 2 10
i105 6 6
i106 6.1 6

f 0 10

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
  <uuid>{952d6731-2b7e-42d9-a9ae-da2348b729f2}</uuid>
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
