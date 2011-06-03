CXX=g++
DEBUG = -g
CPPFLAGS= -c -I../src/cc -I/usr/local/boost_1_46_1 -Wall $(DEBUG)
LDFLAGS= -L../build/lib/static/ -lcrypto -lz -lrt -lpthread -lkfsClient -lkfsCommon -lkfsIO -lkfsMeta -lqcdio -ltools -lkfsEmulator 
SOURCES=KfsSample_main_optional_handler.cc
OBJECTS=$(SOURCES:.cc=.o)
EXECUTABLE=KfsSample_main_optional_handler

all:	$(SOURCES)	$(EXECUTABLE)

clean:	
	rm *.o KfsSample_main_optional_handler

$(EXECUTABLE): $(OBJECTS)
	$(CXX) $(OBJECTS) $(LDFLAGS) $(DEBUG) -o $(EXECUTABLE)

$(OBJECTS):	
	$(CXX)	$(CPPFLAGS) $(SOURCES)
