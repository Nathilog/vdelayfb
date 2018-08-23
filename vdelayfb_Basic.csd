<CsoundSynthesizer>
<CsOptions>

--opcode-lib=vdelayfb.dylib

; Select audio/midi flags here according to platform
-odac  ;;;realtime audio out

;-iadc    ;;;uncomment -iadc if realtime audio input is needed too

; For Non-realtime ouput leave only the line below:

</CsOptions>
<CsInstruments>

sr   = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

opcode Choral,a,akkik

 aInput,krate,kdepth,imax,kFeedback xin ;imax must be in milliseconds
 
 adel poscil kdepth,krate
 
 adel += kdepth+0.05

 aOut vdelayfb aInput,adel*1000,imax,kFeedback
 
 aOut clip aOut,1,1
 
 aMix = aInput+aOut
 
xout aMix

endop


instr 1 
kFeedback = invalue:k("Feedback")

ims  = 10			;maximum delay time in msec
aout vco2 0.5, 150			;make a signal
;adel   poscil3 ims/2, 1/p3, 1		;make an LFO
;adel   = adel + ims/2 			;offset the LFO so that it is positive

krate = invalue: k("Rate")

kdepth = invalue:k("Depth")

asig Choral aout,krate,kdepth,ims,kFeedback 		;use the LFO to control delay t

;aMix = asig + aout

asig dcblock2 asig
aMix = asig+aout

     outs  (aMix)*0.1,(aMix)*0.1

endin
</CsInstruments>
<CsScore>
;f1 0 8192 10 1; sine wave

i 1 0 20


</CsScore>
</CsoundSynthesizer>  
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>233</width>
 <height>325</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
 <bsbObject type="BSBKnob" version="2">
  <objectName>Rate</objectName>
  <x>58</x>
  <y>92</y>
  <width>68</width>
  <height>69</height>
  <uuid>{bc526cc0-ce4d-4306-bbfb-6051c7662133}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.01000000</minimum>
  <maximum>0.80000000</maximum>
  <value>0.70520000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>70</x>
  <y>64</y>
  <width>45</width>
  <height>27</height>
  <uuid>{45faba56-3429-4813-bcee-c3b45ee574fc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Rate</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBKnob" version="2">
  <objectName>Feedback</objectName>
  <x>154</x>
  <y>93</y>
  <width>71</width>
  <height>69</height>
  <uuid>{4e63a62f-8b97-4522-bf06-2bc2fcb7a1b1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.94000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>153</x>
  <y>64</y>
  <width>80</width>
  <height>25</height>
  <uuid>{95979fd0-4f0b-4ae6-8623-8783e412cc07}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Feedback</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>Rate</objectName>
  <x>54</x>
  <y>162</y>
  <width>80</width>
  <height>25</height>
  <uuid>{a20fba9e-cd74-4083-9790-fd6faf2e0aae}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.705</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>Feedback</objectName>
  <x>153</x>
  <y>164</y>
  <width>80</width>
  <height>25</height>
  <uuid>{dcfe8fc9-bd32-4795-847c-e47d25d636be}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.940</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>66</x>
  <y>210</y>
  <width>57</width>
  <height>27</height>
  <uuid>{4859d76e-fa11-4477-a1d2-8818bc001e81}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Depth</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBKnob" version="2">
  <objectName>Depth</objectName>
  <x>59</x>
  <y>233</y>
  <width>65</width>
  <height>64</height>
  <uuid>{88c8fa1a-be72-44ca-9d58-aede3820873e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00100000</minimum>
  <maximum>0.00800000</maximum>
  <value>0.00632000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>Depth</objectName>
  <x>54</x>
  <y>300</y>
  <width>80</width>
  <height>25</height>
  <uuid>{6ddd99d4-2542-469f-92f7-a6239d744346}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.006</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
