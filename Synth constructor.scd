(
SynthDef(\buffo, {
	arg out = 0, pan = 0, freq = 440, amp= 1, buf = 0;
	var sig;
	sig = PlayBuf.ar(2, buf, BufRateScale.kr(buf), loop: 0, doneAction: 2);
	sig = FreeVerb.ar(sig, 0.55, LFTri.kr(1/4).range(0.3, 2));
	Pan2.ar(sig * amp);
	Out.ar(out, sig);
}).add;
)

Synth(\rem, [\freq, 1240])


(
SynthDef(\for, {
	arg  freq = 440, amp = 1, pan = 0, out = 0;
	var env, sig;
	env = EnvGen.ar(Env.sine(8), doneAction: 2);
	sig = Formant.ar(freq, XLine.kr(20, 8000, 2) , XLine.kr(20, 8000, 4));
	sig = Pan2.ar(sig * env * amp, pan);
	Out.ar(out, sig);
}).add;
)

x = {Pulse.ar(440 * Pulse.kr(22, 0.1) , 0.1 ,mul: 0.1)}.play;

Synth(\try, [\freq, 40])

(
r = Dictionary.new;

r.add(\a -> Prewrite(0.5,
	(
	0.5: #[0.25, 0.1, 0.1],
	0.25: #[2, 0.1, 0.25],
	0.1: #[0.25, 0.25, 0.5]
), 30)
).postln;
)

s.boot;


(
SynthDef(\tir, {
	arg freq = 440, out = 0, pan = 0, en = 8, amp = 1;
	var sig, env, sig1, sig2;
	env = EnvGen.ar(Env.sine(en), doneAction: 2);
	sig = SinOsc.ar(freq + LFNoise2.ar(freq).range(120, 180));
	sig1 = SinOsc.ar(freq + LFTri.ar(freq, 0.3).range(10,200));
	sig2 = SinOsc.ar(freq + LFSaw.ar(freq, 0.6).range(20,80));
	sig = FreeVerb.ar(Mix.ar([sig, sig1, sig2]), 0.4, 0.6, 0.2);
	sig = Pan2.ar(sig * env  * amp, pan);
	Out.ar(out, sig);
}).add;
)

~t = Pbind(\instrument, \test, \degree, Pseq([0,1,2,3,4],inf), \dur, 1, \en, 1, \pan,Prand([1,-1],inf))
~t.play;


(
SynthDef(\test2, {
	arg out = 0, pan = 0 , en = 8 , amp = 1 ;
	var sig, env, sig1;
	env = EnvGen.ar(Env.sine(en), doneAction: 2);
	sig  = WhiteNoise.ar(1);
	sig1 = PinkNoise.ar(1);
	sig = Mix.ar([sig, sig1]);
	sig = LPF.ar(sig, 300);
	sig = FreeVerb.ar(sig, 0.5, 0.8);
	sig = Pan2.ar(sig * env *amp, pan);
	Out.ar(out, sig);
}).add;
)

