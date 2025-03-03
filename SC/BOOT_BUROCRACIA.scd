(
s = s ? Server.default;

s.options.memSize = 8192*48;
s.options.numWireBufs = 256*6;
s.options.numBuffers = 1024*32;
s.options.blockSize = 32;
s.options.numOutputBusChannels = 4;

~samplesPath = PathName.new("/path/to/samples/*"); // change me!
~synthPath = PathName.new("/path/to/synthdefs/*");

s.waitForBoot {

	~dirt.free;
	~dirt = SuperDirt.new(2, s);
	~numberOfOrbits = 10;
	~mainbus = Bus.audio(s,2);

	s.sync;

	~dirt.doNotReadYet = true;

	// SAMPLE LOADING
	~nameFunc  = { |x| x.basename.replace("-","")};
	~dirt.loadSoundFiles(path.fullPath, false, ~nameFunc);

	~synthPath.asAbsolutePath.loadPaths;

	s.sync;

	~dirt.start(57120, (~mainbus!~numberOfOrbits));
	~compre = Synth(\soundgood_3,[\in,~mainbus,\out,0,\wet,0.28,\leq,0,\meq,0.1,\heq,0.3],~dirt.group,\addAfter);
};
);
