	#gcc -Wall -fPIC -I../../src/cc/common -c logHandler.cc
	#gcc -shared -Wl,-soname,GMAIL.so -o GMAIL.so logHandler.o
CXX=g++
DEBUG = -g
CPPFLAGS= -c -I../../src/cc/meta -I../../src/cc/common -I../../src/cc -I/usr/local/boost_1_46_1 -Wall $(DEBUG)
LDFLAGS= -L../../build/lib/static/ -lcrypto -lz -lrt -lpthread -lkfsClient -lkfsCommon -lkfsIO -lkfsMeta -lqcdio -ltools -lkfsEmulator -ldl 
SOURCES=run_example.cc
OBJECTS=$(SOURCES:.cc=.o)
EXECUTABLE=run

all: handler $(SOURCES)	$(EXECUTABLE)

handler:
	gcc -g -Wall -fPIC -I../../src/cc/common -I../../src/cc -I/usr/local/boost_1_46_1 -c ../../src/cc/common/BufferedLogWriter.cc
	gcc -g -Wall -fPIC -I../../src/cc/common -I../../src/cc -I/usr/local/boost_1_46_1 -c ../../src/cc/common/zinc.cc
	gcc -g -Wall -fPIC -I../../src/cc/common -I../../src/cc -I/usr/local/boost_1_46_1 -c ../../src/cc/qcdio/qcmutex.cpp
	gcc -g -Wall -fPIC -I../../src/cc/common -I../../src/cc -I/usr/local/boost_1_46_1 -c ../../src/cc/qcdio/qcthread.cpp
	gcc -g -Wall -fPIC -I../../src/cc -I../../src/cc/common -c logHandler.cc 
	gcc -g -shared -Wl,-soname,GMAIL.so -o GMAIL.so BufferedLogWriter.o zinc.o qcmutex.o qcthread.o logHandler.o

clean:	
	rm *.o *.so run

$(EXECUTABLE): $(OBJECTS)
	$(CXX) $(OBJECTS) $(LDFLAGS) $(DEBUG) -o $(EXECUTABLE)

$(OBJECTS):	
	$(CXX)	$(CPPFLAGS) $(SOURCES)
