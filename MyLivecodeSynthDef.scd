

(
SynthDef(\buffy, {
	arg buf = 0, loop = 0, out = 0, pan = 0, rate = 1, startPos= 0, trigger = 1, atk = 0, sus = 0, rel = 0.5;
	var sig, env;
	env = EnvGen.ar(Env.perc(atk, rel, curve: -15));
	sig = PlayBuf.ar(2, buf,rate*BufRateScale.kr(buf), startPos: startPos, loop: loop, doneAction: 2);
	sig = LPF.ar(sig, 400);
	sig = FreeVerb.ar(sig, 0.55, 2, 0.1);
	sig = Pan2.ar(sig  * env, pan);
	Out.ar(out, sig);
}).add;

SynthDef(\bpfbuf, {
		arg atk=0, sus=0, rel=3, c1=1, c2=(-1),
		buf=0, rate=1, spos=0, freq=440, rq=1, bpfmix=0,
		pan=0, amp=1, out=0;
		var sig, env;
		env = EnvGen.kr(Env([0,1,1,0],[atk,sus,rel],[c1,0,c2]),doneAction:2);
		sig = PlayBuf.ar(2, buf, rate*BufRateScale.kr(buf),startPos:spos);
		sig = XFade2.ar(sig, BPF.ar(sig, freq, rq, 1/rq.sqrt), bpfmix*2-1);
		sig = sig * env;
		sig = Pan2.ar(sig, pan, amp);
		Out.ar(out, sig);
	}).add;

SynthDef(\buz,{
	arg out = 0, freq = 440, amp=1, bfreq = 800, pan = 0, dur = 1;
	var sig, env, sig2;
	sig = FreeVerb.ar(Saw.ar(freq * SinOsc.kr(XLine.kr(2, 20, 4))) + SinOsc.ar(freq), 0.3 ,1, 2, 0.4);
	env = EnvGen.ar(Env.new([0,1,0.6,0],[0.8, 0.2, 3]), doneAction: 2);
	sig = Pan2.ar(sig * env * amp, pan);
	Out.ar(out,sig);
	}).add;



SynthDef(\pir, {
	arg out = 0, pan = 0, freq = 440, amp= 1;
	var sig, env;
	sig = SinOsc.ar(freq, XLine.kr(0.5, 4, 2), LFNoise0.kr(2000).range(0.2, 1)) * Saw.kr(20);
	env = EnvGen.ar(Env([0,1,1,0],[0.4, 0.6, 2]), doneAction: 2);
	sig = Pan2.ar(sig * env * amp, pan);
	Out.ar(out, sig);
}).add;

SynthDef(\bas, {
	arg freq= 440, out= 0, pan= 0, dur = 1, amp = 1;
	var sig, env, sig2;
	env = EnvGen.ar(Env.new([0,1,0],[0.5, 0.5]), doneAction: 2);
	sig = SinOsc.ar(freq * LFTri.kr(80), mul: 0.5);
	sig2 = SinOsc.ar(freq * Saw.kr(100), mul: 0.5);
	sig = Pan2.ar(Mix.ar([sig + sig2]) * env * amp, pan) ;
	Out.ar(out, sig);
}).add;

SynthDef(\boh, {
	arg freq=440, out=0, pan=0, dur = 1, amp = 1, ;
	var sig, env;
	env = EnvGen.ar(Env.new([0,1,0],[1,2]), doneAction: 2);
	sig = SinOsc.ar(freq * Impulse.kr(XLine.kr(20, 1200, 3)));
	sig = Pan2.ar(sig * env * amp, pan);
	Out.ar(out,sig);
}).add;

SynthDef(\wer, {
	arg freq = 440, out = 0, pan = 0, dur = 1, amp = 1, en = 8;
	var env, sig, sig2;
	env = EnvGen.ar(Env.sine(en), doneAction: 2);
	sig = PinkNoise.ar(0.03);
	sig2 = WhiteNoise.ar(0.02).range(0.01, 2);
	sig = Mix.ar([sig, sig2]);
	sig = Pan2.ar(sig * env * amp, pan);
	Out.ar(out, sig);
}).add;

SynthDef(\nio,{
	arg out=0, pan=0, freq= 440, dur = 1, amp = 1;
	var sig, env, sigm;
	sigm = Saw.kr(40).exprange(200, 6000);
	sig = SinOsc.ar(freq * sigm, mul:0.1);
	env = EnvGen.ar(Env.new([0,1,0.3,0.2,0],[1, 0.2,0.3,0.5]), doneAction: 2);
	sig = Pan2.ar(sig * env * amp, pan);
	Out.ar(out, sig);
}).add;

SynthDef(\buffyy, {
	arg bufnum = 0, loop = 0, out = 0, pan = 0, rate = 0, trigger = 1, startPos = 0;
	var sig, start;
	start = SinOsc.kr(16).range(-1, 1);
	sig = PlayBuf.ar(2, bufnum,BufRateScale.kr(bufnum), trigger: start, startPos: startPos, loop: loop, doneAction: 2);
	sig = LPF.ar(sig, LFTri.kr(10).range(80,500));
	sig = BPF.ar(sig, SinOsc.kr(1).range(80,1200), 0.5);
	sig = Pan2.ar(sig);
	Out.ar(out, sig, pan);
}).add;

SynthDef(\bd1,{ |out = 0, freq = 440, amp = 1, pan=0, dur = 1|
	var sig, env;
	sig = FreeVerb.ar(SinOsc.ar(freq  * Saw.ar(1).range(2, 10), 0, amp), 0.55, 0.8);
	env = EnvGen.ar(Env.new([0,1,0.4,0],[0.3, 0.7, 2]), doneAction: 2);
	sig = Pan2.ar(sig * env);
	Out.ar(out,sig, pan);
	}).add;

SynthDef(\rem, {
	arg out = 0, pan = 0, freq = 440, amp= 1, en = 8;
	var sig, env;
	sig = SinOsc.ar(freq, XLine.kr(0.5, 12, 0.5), LFTri.kr(30).range(0.3, 1)) * LFNoise0.kr(300);
	env = EnvGen.ar(Env.sine(en), doneAction: 2);
	sig = Pan2.ar(sig * env * amp, pan);
	Out.ar(out, sig);
}).add;

SynthDef(\stb, {
	arg freq= 440, amp = 1, pan = 0, out = 0;
	var env, sig, sig1, sig2, mix, eff, fan;
	env = EnvGen.ar(Env.new([0,1,1,0],[0.1, 0.9, 2], curve: \sin), doneAction: 2);
	sig =  Impulse.ar(freq) * SinOsc.kr(1140);
	sig1 = Impulse.ar(freq) * SinOsc.kr(1140 + 1.5);
	sig2 = Impulse.ar(freq) * SinOsc.kr(1140 + 0.5);
	mix = Mix.ar([sig, sig1, sig2]);
	eff = CombC.ar(mix, 0.1, 0.3);
	eff = LPF.ar(eff, 1000);
	fan = Pan2.ar(eff * env * amp, pan);
	Out.ar(out, fan);
}).add;

SynthDef(\sud, {
	arg freq= 440, amp = 1, pan = 0, out = 0, en = 8;
	var env, sig;
	env = EnvGen.ar(Env.sine(en), doneAction: 2);
	sig = SinOsc.ar(XLine.kr(100, freq, 0.2) * LFTri.kr(8));
	sig = HPF.ar(sig, 1200);
	sig = Pan2.ar(sig * env * amp, pan);
	Out.ar(out, sig );
}).add;

SynthDef(\geg, {
	arg freq= 440, amp = 1, pan = 0, out = 0, en = 4;
	var env, sig;
	env = EnvGen.ar(Env.sine(en), doneAction: 2);
	sig = LFTri.ar(XLine.kr(freq, freq*1.1, 0.8) * Impulse.kr(80));
	sig = LPF.ar(sig, 400);
	sig = Pan2.ar(sig * env * amp, pan);
	Out.ar(out, sig);
}).add;

SynthDef(\swe, {
	arg  freq = 440, amp = 1, pan = 0, out = 0, en = 8 ;
	var env, sig;
	env = EnvGen.ar(Env.sine(en), doneAction: 2);
	sig = HPF.ar(SinOsc.ar(freq * WhiteNoise.kr(0.5).range(10, 20), mul: 0.5), 4000, 0.5);
	sig = Pan2.ar(sig * env * amp, pan);
	Out.ar(out, sig );
}).add;

SynthDef(\sin, {
	arg  freq = 440, amp = 1, pan = 0, out = 0, en = 8;
	var env, sig;
	env = EnvGen.ar(Env.sine(en), doneAction: 2);
	sig = SinOsc.ar(freq,XLine.kr(0,1,4),LFTri.kr(8).range(0.1,1));
	sig = Pan2.ar(sig * env* amp, pan);
	Out.ar(out, sig );
}).add;

SynthDef(\for, {
	arg  freq = 440, amp = 1, pan = 0, out = 0, en = 8;
	var env, sig;
	env = EnvGen.ar(Env.sine(en), doneAction: 2);
	sig = Formant.ar(freq, XLine.kr(20, 8000, 2) , XLine.kr(20, 8000, 4));
	sig = Pan2.ar(sig * env * amp, pan);
	Out.ar(out, sig);
}).add;

)





