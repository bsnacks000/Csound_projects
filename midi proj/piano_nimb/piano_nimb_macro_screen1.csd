<CsoundSynthesizer>
<CsOptions>
--displays
</CsOptions>
<CsInstruments>
sr = 44100
ksmps =128
nchnls = 1
0dbfs = 20000

seed 12

#define TABLE(name'number'table_n')#
; histogram for pause paramenter

instr $number 
$name ftgentmp $table_n, 0, -200, -42, 	p4,p5,p6,		p7,p8,p9
endin
#


#define HIST_RND(name'number')#
instr $number
$name duserrnd p4
endin
#


#define MASK(name'number')#
; moving number generator for parameter masking
; controlled by 3 line segs

instr $number
kmin  linseg p4, p3/3, p5 , p3/3, p6, p3/3, p7
kmax  linseg p8, p3/3, p9 , p3/3, p10, p3/3, p11	
kcps =  10
$name randomh kmin, kmax, kcps , 3, 0
endin
#


#define PIANO(number'note'vel'dur'pause')#
; moscil piano controller

instr $number
ichn = 1
knum = $note
kvel = $vel
kdur  = $dur
kpause = $pause
moscil ichn, int(knum), kvel, kdur, kpause
endin
#



instr 201
ichn = 2

knum	randomh p4, p5, p6,  		3,0
kdur	randomh p7, p8, p9,  		3,0
kvel 	randomi 50, 60, .5, 		3,0
kpause randomh 0, 3, .5, 	3,0

moscil ichn, knum, kvel, kdur, kpause

endin



; ---------------instantiation ---------------------;
;----------------------------------------------------;

$TABLE(gi_HIST_1'1'1')

$HIST_RND(gk_tabrand_piano'2')
$HIST_RND(gk_tabrand_noise'3')

$MASK(gk_freq_mask1'10')
$MASK(gk_vel_mask1'11')
$MASK(gk_dur_mask1'12')

$MASK(gk_freq_mask2'13')
$MASK(gk_vel_mask2'14')
$MASK(gk_dur_mask2'15')

$MASK(gk_freq_mask3'16')
$MASK(gk_vel_mask3'17')
$MASK(gk_dur_mask3'18')


$PIANO(101'	gk_freq_mask1' gk_vel_mask1' gk_dur_mask1'gk_tabrand_piano')	
$PIANO(102'	gk_freq_mask2' gk_vel_mask2' gk_dur_mask2'gk_tabrand_piano')	
$PIANO(103'	gk_freq_mask3' gk_vel_mask3' gk_dur_mask3'gk_tabrand_piano')	
	

</CsInstruments>
<CsScore>

#define hist #i1#

#define hist_rnd_piano #i2#
#define hist_rnd_noise #i3#

#define mask_freq1 #i10#
#define mask_vel1 #i11#
#define mask_dur1 #i12#

#define mask_freq2 #i13#
#define mask_vel2 #i14#
#define mask_dur2 #i15#

#define mask_freq3 #i16#
#define mask_vel3 #i17#
#define mask_dur3 #i18#


;--------CLOUD PARAMETERS -------;

$hist. 				0 10		0 0 .9		.0625 .09375 .1

$hist_rnd_piano.	0 10		1	
$hist_rnd_noise. 	0 10		1

;----------------------------min--------------------------max-----;
$mask_freq1.		0 10		105 85 105 75						65 80 65 70 	
$mask_vel1.		0 10		50 35 30 25 						50 50 50 50    
$mask_dur1.		0 10		.0125  .0125 .0125 .0125   		.125 .125 .125 .125    

$mask_freq2.		0 10		105 85 105 75						65 80 65 70	
$mask_vel2.		0 10		50 35 30 25 						50 50 50 50   	
$mask_dur2.		0 10		.0125  .0125 .0125 .0125   		.125 .125 .125 .125    

$mask_freq3.		0 10		105 85 105 75						65 80 65 70 	
$mask_vel3.		0 10		50 35 30 25 						50 50 50 50   	
$mask_dur3.		0 10		.0125  .0125 .0125 .0125   		.125 .125 .125 .125


;--------EVENTS ------------------;

i101				0 3
;i102				0 3
;i103				0 3
  	

</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>4</y>
 <width>398</width>
 <height>168</height>
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
  <uuid>{67199c9f-804d-477f-8734-d763bf3f6df6}</uuid>
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
WindowBounds: -8 4 398 168
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioSlider {5, 5} {20, 100} 0.000000 1.000000 0.000000 slider1
</MacGUI>
