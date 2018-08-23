<CsoundSynthesizer>
<CsOptions>
--opcode-lib=vdelayfb.dylib
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 128
nchnls = 2
0dbfs = 1.0

instr 1

;aSigIn diskin "Ping.wav",1,0,1
aSigIn vco2 0.3,440

adel randomi 0.5,5,12

imax = 30

aDel vdelayfb aSigIn,adel,imax,0.1

aMix = aDel+aSigIn

   outs aMix,aMix

endin


</CsInstruments>
<CsScore>
i 1 0 20
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
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
