# vdelayfb
A CSound opcode that implements variable delay with optional feedback. The opcode is implemented using [Victor Lazzarini's](https://github.com/vlazzarini) CSound Plugin Opcode Framework (CPOF)[[1]](http://smc2017.aalto.fi/media/materials/proceedings/SMC17_p267.pdf) [[2]](http://www.mdpi.com/2076-3417/7/10/970) and is based on the built-in csound *vdelay* opcode algorithm implemented in C by Paris Smaragdis, Richard Karpen, Rasmus Ekman and John ffitch incoporporating feedback as in Gabriel Maldonado's very similar built-in *flanger* implementation.

This is designed for a-rate delay input only. The convenience of a feedback parameter means that we can for example create chorus effects either directly in an instrument or as a UDO an easily apply a feedback component easily to get a chorus/flanging effect. In addition this is a nice example of how the CPOF greatly simplifies opcode development through code reuse allowing the developer to focus on the business end of the opcode.


## Building
This project was built using JetBrains CLion IDE which is cmake based. However we only need to include CSound headers when building plugins with CPOF so you could build the dynamic library/.so from the command line as follows:


### Mac
```
c++ -dynamiclib  -std=c++11 -o plug.dylib vdelayfb.cpp -I /Library/Frameworks/CsoundLib64.framework/Headers
```

### Ubuntu/Linux
```
gcc -O2 -shared -o libvdelayfb.so -fPIC vdelayfb.cpp -I/usr/local/include/csound
```

### Parameters
```
aDel vdelayfb aIn adel imaxdel kfeedback
```
### Initialization 
imaxdel -- Maximum value of delay in milliseconds. If adel gains a value greater than imaxdel it is folded around imaxdel. This should not happen. 

### Performance 
asig -- Input signal.

adel -- Current value of delay in milliseconds. Note that linear functions have no pitch change effects. Fast changing values of adel will cause discontinuities in the waveform resulting noise. 

kFeedback - Current value of the feedback ratio ranging from 0 to 1. If kFeedback is greater than 1 it will remain at 1. If it is less than 0 it will remain at 0.


Please see the sample .csd files included in this project for opcode usage.
### Example of the vdelayfb opcode
```
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

;The delay time is varied using randomi to generate values 
adel randomi 0.5,5,3 

;Max delay time set to thirty seconds
imax = 30 

aDel vdelayfb aSigIn,adel,imax,0.1

;Dry signal is mixed with the delayed signal
aMix = aDel+aSigIn

   outs aMix,aMix ;Stereo out

endin


</CsInstruments>
<CsScore>
i 1 0 20
</CsScore>
</CsoundSynthesizer>
```



