#include "zinc.h"
#include <stdio.h>
#include <limits>
#include "BufferedLogWriter.h"

namespace KFS {

ZincLogger :: ZincLogger(std::string a, BufferedLogWriter::LogLevel l, std::string f) : BufferedLogWriter(fileno(stderr), fileName.c_str()),  appName(a), logLevel(l), fileName(f) {
	
	fileName = fileName.empty() ? appName : fileName;
	BufferedLogWriter::SetLogLevel(logLevel);
	BufferedLogWriter::SetMaxLogWaitTime(std::numeric_limits<int>::max());
}

ZincLogger::~ZincLogger()
{
}


void
ZincLogger::Stop()
{
        this->BufferedLogWriter::Stop();
}

bool ZincLoggerFactory::instanceFlag = false;

ZincLoggerFactory* ZincLoggerFactory::zincLoggerFactory = NULL;

ZincLoggerFactory*
ZincLoggerFactory::getInstance()
{
	if(zincLoggerFactory == NULL) {
		zincLoggerFactory = new ZincLoggerFactory();
	}
	return zincLoggerFactory;
}

ZincLoggerFactory :: ZincLoggerFactory() {
}

ZincLoggerFactory :: ~ZincLoggerFactory(){
}

ZincLogger*
ZincLoggerFactory :: getZincLogger(std::string appName, BufferedLogWriter::LogLevel logLevel, std::string fileName) {
	if(mApps.find(appName) == mApps.end()) {
		mApps.insert(std::pair<std::string, ZincLogger*>(appName,new ZincLogger(appName, logLevel, fileName)));
	}
	return mApps[appName];
	
}

}

