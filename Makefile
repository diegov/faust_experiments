FAUST_INCLUDE = /usr/share/faust/code/

all: simple~.pd_linux

clean:
	rm simple~.pd_linux

%.cpp: %.dsp
	faust -I $(FAUST_INCLUDE) -a $(FAUST_INCLUDE)/puredata.cpp -cn $* -o $*.cpp $*.dsp

%~.pd_linux: %.cpp
	g++ -fpic -shared `pkg-config --cflags pd` $*.cpp -std=c++11 -o $*~.pd_linux
