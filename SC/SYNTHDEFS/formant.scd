(
~formantModule = DirtModule('formant', { |dirtEvent|
	dirtEvent.sendSynth('formant' ++ 2)},
{ ~formant.notNil or: ~pitch.notNil });
~dirt.modules.insert(1, ~formantModule);

SynthDef("formant" ++ 2, { |out, formant = 1, pitch = 1, sustain|
	var signal = In.ar(out, 2);
	var mono = (signal[0] + signal[1]) * 0.5;
	var outsignal = PitchShiftPA.ar(
		in: signal,
		freq: Pitch.kr(
			LPF.ar(mono,2000),
			initFreq: 220,
			minFreq: 120,
			maxFreq: 3000,
			maxBinsPerOctave:16,
			median: 3.5,
			ampThreshold: 0.05,
			downSample: 2
		)[0],
		pitchRatio: pitch,
		formantRatio: formant,
		minFreq: 120,
		maxFormantRatio: 4,
		grainsPeriod: 2,
		//timeDispersion: 1
	);
	ReplaceOut.ar(out, outsignal);
}).add;
);