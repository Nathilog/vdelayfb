<CsoundSynthesizer>
<CsOptions>
--opcode-lib=vdelayfb.dylib
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 128
nchnls = 2
0dbfs = 1.0

;A simple csd that generates random values for the delay time 

instr 1

aSigIn vco2 0.3,440 ;Simple sawtooth wave

adel randomi 0.5,5,3 ;The delay time is varied using randomi to generate values 

imax = 30 ;Max delay time set to thirty seconds

aDel vdelayfb aSigIn,adel,imax,0.1

aMix = aDel+aSigIn ;Dry signal is mixed with the delayed signal

   outs aMix,aMix ;Stereo out

endin


</CsInstruments>
<CsScore>
i 1 0 20
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>0</width>
 <height>0</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
