(
~dirt.addModule('lpfrel', { |dirtEvent|
	dirtEvent.sendSynth('lpfrel' ++ 2)
}, { ~lpfrel.notNil });

SynthDef("lpfrel" ++ 2, { |out, lpfrel = 1, lpfcurve=(-4), sustain|
	var signal, env, outsignal;
	signal = In.ar(out, 2);
	env = EnvGen.kr(Env.perc(0.05,lpfrel,1,lpfcurve), doneAction: 14);
	env = LinLin.kr(env, 0, 1, 60, 20000);
	outsignal = LPF.ar(signal, env);
	ReplaceOut.ar(out, outsignal);
}).add;
);

//

(
~dirt.addModule('prel', { |dirtEvent|
	dirtEvent.sendSynth('prel' ++ 2)
}, { ~prel.notNil });

SynthDef("prel" ++ 2, { |out, prel = 1, prelcurve =(-4), sustain|
	var signal, env, outsignal;
	signal = In.ar(out, 2);
	env = EnvGen.kr(Env.perc(0.05,prel,1,prelcurve), doneAction: 14);
	outsignal = signal*env;
	ReplaceOut.ar(out, outsignal);
}).add;
);