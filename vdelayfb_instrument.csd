<CsoundSynthesizer>
<CsOptions>
--opcode-lib=vdelayfb.dylib
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 128
nchnls = 2
0dbfs = 1.0
;This is one of the examples of the vdelayfb plugin having certain parameters being controlled by QT widgets 

;Here there are two separate signals being generated for the left and right channel. Both are being put through a separate instance of vdelayfb 

;The parameters being controlled are the delay time and the feedback ratios for each instance of vdelayfb 




instr 1
;Input Signals for the left and right channels
aInL vco2 0.2,invalue:k("Freq 1")
aInR vco2 0.1,invalue:k("Freq 2")

imax = 20

;Inputs for the delay time parameter of vdelayfb with frequency control
adel_1 poscil 0.2,invalue:k("Rate 1")
adel_2 poscil 0.1,invalue:k("Rate 2")

;Left and right delays with feedback control
aDel_1 vdelayfb aInL,adel_1*1000,imax,invalue:k("Feedback 1")
aDel_2 vdelayfb aInR,adel_2*1000,imax,invalue:k("Feedback 2")

;Mixdowns for the left and right channel 
aMix_1 = (aInL+aDel_1)
aMix_2 = (aInR+aDel_2)

;Prevents DC related issues
aMix_1 dcblock2 aMix_1 
aMix_2 dcblock2 aMix_2

        outs aMix_1*0.5,aMix_2*0.5
endin


</CsInstruments>
<CsScore>
i 1 0 25
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
 <bsbObject type="BSBKnob" version="2">
  <objectName>Rate 1</objectName>
  <x>45</x>
  <y>218</y>
  <width>72</width>
  <height>73</height>
  <uuid>{308b77aa-adc8-4245-820b-228c555daaa4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.01000000</minimum>
  <maximum>0.30000000</maximum>
  <value>0.02450000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>40</x>
  <y>193</y>
  <width>95</width>
  <height>28</height>
  <uuid>{478b1386-618f-42bd-81b3-fbe5bdf7b34b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Delay Rate 1</label>
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
  <objectName>Rate 1</objectName>
  <x>44</x>
  <y>294</y>
  <width>80</width>
  <height>25</height>
  <uuid>{473f457e-3692-41b0-a476-d22bb8e72fc8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.025</label>
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
 <bsbObject type="BSBKnob" version="2">
  <objectName>Rate 2</objectName>
  <x>173</x>
  <y>220</y>
  <width>77</width>
  <height>74</height>
  <uuid>{0a8819e6-70c1-4797-9fa7-0e884653668b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.01000000</minimum>
  <maximum>0.30000000</maximum>
  <value>0.16950000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>165</x>
  <y>194</y>
  <width>96</width>
  <height>26</height>
  <uuid>{c8c5d5f4-9644-4b0c-8b35-17a0aff2d92e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Delay Rate 2</label>
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
  <objectName>Rate 2</objectName>
  <x>172</x>
  <y>294</y>
  <width>80</width>
  <height>25</height>
  <uuid>{a917efc2-8cb9-410c-9866-be34964690b6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.170</label>
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
 <bsbObject type="BSBKnob" version="2">
  <objectName>Feedback 1</objectName>
  <x>42</x>
  <y>356</y>
  <width>68</width>
  <height>75</height>
  <uuid>{09228cd6-290d-4f06-905a-fd27d3eac5be}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.05000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBKnob" version="2">
  <objectName>Feedback 2</objectName>
  <x>181</x>
  <y>356</y>
  <width>68</width>
  <height>72</height>
  <uuid>{f04ada6d-c80a-490c-b26e-7453bf7a6031}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.14000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>36</x>
  <y>329</y>
  <width>93</width>
  <height>26</height>
  <uuid>{b9837a7c-a8d9-4f27-955e-92e5da8a05c2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Feedback 1</label>
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
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>173</x>
  <y>332</y>
  <width>90</width>
  <height>27</height>
  <uuid>{fd902115-38f8-4630-b766-07e926b6e4f6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Feedback 2</label>
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
  <objectName>Feedback 1</objectName>
  <x>37</x>
  <y>432</y>
  <width>79</width>
  <height>25</height>
  <uuid>{3ef2e1d9-2533-4cc7-83f7-7627cc935e5d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.050</label>
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
  <objectName>Feedback 2</objectName>
  <x>176</x>
  <y>432</y>
  <width>80</width>
  <height>25</height>
  <uuid>{1c5249d7-57c7-411f-82f7-4a07b1007ad6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.140</label>
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
 <bsbObject type="BSBKnob" version="2">
  <objectName>Freq 1</objectName>
  <x>61</x>
  <y>58</y>
  <width>65</width>
  <height>66</height>
  <uuid>{e432e7d6-5c4a-4022-9987-e2c06319f201}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>50.00000000</minimum>
  <maximum>670.00000000</maximum>
  <value>118.20000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBKnob" version="2">
  <objectName>Freq 2</objectName>
  <x>183</x>
  <y>60</y>
  <width>62</width>
  <height>66</height>
  <uuid>{7469740b-2abe-4791-a971-04ed70e681fa}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>100.00000000</minimum>
  <maximum>800.00000000</maximum>
  <value>590.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>Freq 1</objectName>
  <x>65</x>
  <y>127</y>
  <width>60</width>
  <height>26</height>
  <uuid>{9ee2ef6d-889d-4c26-b207-f3f96a43cb7e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>118.200</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <objectName>Freq 2</objectName>
  <x>185</x>
  <y>129</y>
  <width>63</width>
  <height>27</height>
  <uuid>{2b6c22de-1625-431c-8cd1-fd491a7a31c0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>590.000</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <x>52</x>
  <y>36</y>
  <width>94</width>
  <height>26</height>
  <uuid>{30297e76-9e3c-4eb2-b6ea-e549591d9897}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Frequency 1</label>
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
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>172</x>
  <y>37</y>
  <width>96</width>
  <height>27</height>
  <uuid>{55c63119-dbc8-4203-8f9d-e8cf369d99d2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Frequency 2</label>
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
</bsbPanel>
<bsbPresets>
</bsbPresets>
