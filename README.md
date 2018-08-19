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

Please see the sample .csd files included in this project for opcode usage.
+