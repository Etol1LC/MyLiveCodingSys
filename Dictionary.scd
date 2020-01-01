
("/Users/claudiodonaggio/Desktop/Gio/protostart.scd").load;

p.makeTempoClock;
p.clock.tempo = 1;


s.quit;

(
~rbuf = {FreeVerb.ar(PlayBuf.ar(2, b[\jo].choose, loop: 0), 0.45, LFTri.kr(2).range(0.1, 4), mul: 1)};
~rbuf.play;
)

~bs = Pbind(\instrument, \buffy, \buf, b[\hh][9], \dur, d[\d]);
~hh =Pbind(\instrument, \bpfbuf, \buf, b[\hh][2], \dur, d[\a]*1.2);
~tt = Pbind(\instrument, \buffy, \buf, Prand([b[\kk].flat, b[\hh].flat, b[\sn].flat].flat, inf),\dur, d[\a]);

~bd  = Pbind(\instrument,\bd1,\degree,\dur,)
~wer = Pbind(\instrument,\wer,\degree,\dur,\en,)
~bas = Pbind(\instrument,\bas,\degree,\dur,\en,)
~buz = Pbind(\instrument,\buz,\degree,\dur,\en,)
~boh = Pbind(\instrument,\boh,\degree,\dur,\en,)
~pir = Pbind(\instrument,\pir,\degree,\dur,\en,)
~rem = Pbind(\instrument,\rem,\degree,\dur,\en,)
~stb = Pbind(\instrument,\stb,\degree,\dur,\en,)
~sud = Pbind(\instrument,\sud,\degree,\dur,\en,)
~geg = Pbind(\instrument,\geg,\degree,\dur,\en,)
~swe = Pbind(\instrument,\swe,\degree,\dur,\en,)
~sin = Pbind(\instrument,\sin,\degree,\dur,\en,)
~for = Pbind(\instrument,\for,\degree,\dur,\en,)

