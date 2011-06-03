#ifndef _INC_ZINC_H_
#define _INC_ZINC_H_

#include "log.h"
#include "BufferedLogWriter.h"
#include <string>
#include <map>
#include <sstream>
#include <libgen.h>

namespace KFS {

class ZincLogger : public BufferedLogWriter
   {
   
    private:
	std::string appName; 
	LogLevel logLevel;
	std::string fileName;
    public:
        ZincLogger(std::string a, LogLevel l = 
		#ifndef NDEBUG
			kLogLevelINFO
		#else
			kLogLevelDEBUG
		#endif
		, std::string f = ""); 
        ~ZincLogger();
        inline ZincLogger(const ZincLogger &other) {
		this->appName = other.appName;
		this->logLevel = other.logLevel;
		this->fileName = other.fileName;	
	}
        void Stop();
        void SetLevel(LogLevel logLevel) {
		this->logLevel = logLevel;
        }
    };


class ZincLoggerFactory {
	
	private:
		

		ZincLoggerFactory();
		~ZincLoggerFactory();
		
		std::map<std::string,ZincLogger*> mApps;
		static bool instanceFlag;
		static ZincLoggerFactory* zincLoggerFactory;
	public:
		static ZincLoggerFactory* getInstance();
		ZincLogger* getZincLogger(std::string appname, BufferedLogWriter::LogLevel l = 
					#ifndef NDEBUG
						ZincLogger::kLogLevelINFO
					#else
						ZincLogger::kLogLevelDEBUG
					#endif
					, std::string f = "");


		void Stop();
		
	};

#ifndef THIS_FILE
#define THIS_FILE basename((char *) __FILE__)  
#endif

#ifndef KFS_LOG_VA_APP_PRIORITY
#   define KFS_LOG_VA_APP_PRIORITY(appName,logLevel,fileName, msg, ...) \
            ZincLoggerFactory::getInstance()->getZincLogger(appName,logLevel,fileName)->Append(logLevel, "(%s:%d) " \
                msg, THIS_FILE, __LINE__, __VA_ARGS__)

#endif

#ifndef KFS_LOG_APP_PRIORITY
#   define KFS_LOG_APP_PRIORITY(appName, logLevel, fileName, msg) \
        KFS_LOG_VA_APP_PRIORITY(appName, logLevel, fileName, "%s", msg)
#endif

#ifndef KFS_LOG_APP_DEBUG
#   define KFS_LOG_APP_DEBUG(appName,fileName,msg) \
        KFS_LOG_PRIORITY(appName,ZincLogger::kLogLevelDEBUG, fileName, msg)
#endif
#ifndef KFS_LOG_VA_APP_DEBUG
#   define KFS_LOG_VA_APP_DEBUG(appName, fileName, msg, ...) \
        KFS_LOG_VA_APP_PRIORITY(appName, ZincLogger::kLogLevelDEBUG, fileName, msg, __VA_ARGS__)
#endif


#ifndef KFS_LOG_APP_INFO
#   define KFS_LOG_APP_INFO(appName, fileName,  msg) \
        KFS_LOG_APP_PRIORITY(appName, ZincLogger::kLogLevelINFO, fileName, msg)
#endif
#ifndef KFS_LOG_VA_APP_APP_INFO
#   define KFS_LOG_VA_APP_INFO(appName, fileName, msg, ...) \
        KFS_LOG_VA_APP_PRIORITY(appName, ZincLogger::kLogLevelINFO, fileName, msg, __VA_ARGS__)
#endif

#ifndef KFS_LOG_APP_WARN
#   define KFS_LOG_APP_WARN(appName, fileName, msg) \
        KFS_LOG_APP_PRIORITY(appName, ZincLogger::kLogLevelWARN, fileName, msg)
#endif
#ifndef KFS_LOG_VA_APP_WARN
#   define KFS_LOG_VA_APP_WARN(appName, fileName,  msg, ...) \
        KFS_LOG_VA_APP_PRIORITY(appName, ZincLogger::kLogLevelWARN, fileName, msg, __VA_ARGS__)
#endif

#ifndef KFS_LOG_APP_ERROR
#   define KFS_LOG_APP_ERROR(appName, fileName, msg) \
        KFS_LOG_APP_PRIORITY(appName, ZincLogger::kLogLevelERROR, fileName, msg)
#endif
#ifndef KFS_LOG_VA_APP_ERROR
#   define KFS_LOG_VA_APP_ERROR(appName, fileName,msg, ...) \
        KFS_LOG_VA_APP_PRIORITY(appName, ZincLogger::kLogLevelERROR, fileName, msg, __VA_ARGS__)
#endif

#ifndef KFS_LOG_APP_FATAL
#   define KFS_LOG_APP_FATAL(appName, fileName, msg) \
        KFS_LOG_APP_PRIORITY(appName, ZincLogger::kLogLevelFATAL, fileName, msg)
#endif
#ifndef KFS_LOG_VA_APP_FATAL
#   define KFS_LOG_VA_APP_FATAL(appName, fileName, msg, ...) \
        KFS_LOG_VA_APP_PRIORITY(appName, ZincLogger::kLogLevelFATAL, fileName, msg, __VA_ARGS__)
#endif

}

#endif // _INC_ZINC_H_

