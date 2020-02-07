
("/Users/claudiodonaggio/Desktop/Gio/protostart.scd").load;

p.makeTempoClock;
p.clock.tempo = 170/60;


s.quit;

(
~scot = {FreeVerb.ar(PlayBuf.ar(2, b[\js].choose, loop: 0), 0.45, LFTri.kr(2).range(0.1, 4), mul: 0.2)};
~scot.play;
)

(
~rbuf = {FreeVerb.ar(PlayBuf.ar(2, b[\jo].choose, loop: 0), 0.45, LFTri.kr(2).range(0.1, 4), mul: 1)};
~rbuf.play;
)




//DRUMS:

~vo  = Pbind(\instrument,\bpfbuf,\buf, Prand([b[\d17]].flat, inf) ,\dur, Prand([1, 0.5], inf), \amp, Pwhite(0.2, 0.4));
~hh  = Pbind(\instrument,\bpfbuf,\buf, Prand([b[\bs]].flat,inf), \dur, Pbjorklund2(7,8));
~km = Pbind(\instrument,\bpfbuf,\buf, b[\hh][0],\dur, Prand([0.25,0.5], inf), \pan, Pwhite(-1, 1))
~sn  = Pbind(\instrument,\bpfbuf,\buf, Prand([b[\sn][4]], inf),\dur, Prand([2, 1, 0.5], inf));
~bs = Pbind(\instrument, \bpfbuf,\buf, Prand([b[\kk][4]],inf),\dur, Prand([1, 0.5, 0.25], inf));
~vo2 = Pbind(\instrument, \bpfbuf, \buf, Prand([b[\al]].flat, inf), \dur, 8);

~bs.play;
~km.play;
~vo.play;
~vo2.stop(2);
//DPLAYERS:

~kk.play;
~hh.play;
~sn.play;


Scale.minor;

//SYNTHS:
u = Scale.minor(\pythagorean);
~bd  = Pbind(\instrument,\bd1,\degree,0, \dur, 4, \en, 6, \octave, 4)
~wer = Pbind(\instrument,\wer,\degree, Pwhite(0, 9), \dur, Prand([2, 5], inf), \en, 1, \octave, 4, \pan, Prand([0.8, -0.8], inf))
~bas = Pbind(\instrument,\bas,\degree, Pwhite(2, 8), \dur,8, \en, 9, \octave, 4, \scale, Scale.minor(\pythagorean))
~buz = Pbind(\instrument,\buz,\degree, 3, \dur, 6, \en, 8, \octave, 5)
~boh = Pbind(\instrument,\boh,\degree,\dur,\en,\octave)
~pir = Pbind(\instrument,\pir,\degree, Pwhite(2,4),\dur,4, \en, 4, \octave, Pwhite(4, 5), \scale, u)
~tir = Pbind(\instrument,\tir,\degree,Prand([2, 4, 8], inf), \dur, Prand([0.5, 0.25, 1], inf),\en, Pwhite(0.25, 1),\octave,Pwhite(4, 6), \scale, u )
~rem = Pbind(\instrument,\rem,\degree,\dur,\en,\octave)
~sud = Pbind(\instrument,\sud,\degree, 5,\dur, 4,\en, 6,\octave, 4)
~geg = Pbind(\instrument,\geg,\degree, Pwhite(2, 8), \dur, d[\c], \en, d[\f], \octave, Pwhite(5,4))
~sin = Pbind(\instrument,\sin,\degree,\dur,\en,\octave)
~for = Pbind(\instrument,\for,\degree, Pwhite(2, 6), \dur, 8, \en, 2, \octave, Pwhite(2, 3))


//SPLAYERS:
~bd.play;
~pir.stop(4);
~rem.stop();
~for.play;
~buz.play;
~swe.play;
~boh.play;
~bas.stop(8);
~sud.play;
~sin.play;
~wer.stop(8);
~geg.stop(4);
~tir.stop(5);
~rem.play;

Tuning.directory;