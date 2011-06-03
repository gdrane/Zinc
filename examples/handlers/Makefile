	#gcc -Wall -fPIC -I../../src/cc/common -c logHandler.cc
	#gcc -shared -Wl,-soname,GMAIL.so -o GMAIL.so logHandler.o
CXX=g++
DEBUG = -g
CPPFLAGS= -c -I../../src/cc/meta -I/usr/local/boost_1_46_1 -Wall $(DEBUG)
LDFLAGS= -L../../build/lib/static/ -lcrypto -lz -lrt -lpthread -lkfsClient -lkfsCommon -lkfsIO -lkfsMeta -lqcdio -ltools -lkfsEmulator -ldl 
SOURCES=run_example.cc
OBJECTS=$(SOURCES:.cc=.o)
EXECUTABLE=run

all:	$(SOURCES)	$(EXECUTABLE)

clean:	
	rm *.o run

$(EXECUTABLE): $(OBJECTS)
	$(CXX) $(OBJECTS) $(LDFLAGS) $(DEBUG) -o $(EXECUTABLE)

$(OBJECTS):	
	$(CXX)	$(CPPFLAGS) $(SOURCES)
