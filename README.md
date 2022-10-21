# faustdocker

A minimal docker image embedding the Faust compiler.
- Use `make` to build the image `grame/faust`.
- Use `docker run grame/faust -h` for help, 
- or create a file `toto.dsp` in the current directory and run:
  
	docker run -v `pwd`:/tmp ghcr.io/orlarey/faust:latest -svg toto.dsp

to compile `foo.dsp` in the current directory. 

All Faust options are available, as well as the Faust libraries and the faust architectures. But note that the `faust2xxx` tools are no available and that you *can't* use this docker image to generate any binaries. Only source code compilation is available.
