#include "zinc.h"
extern "C" {
void firstLog();
}
void firstLog() {

KFS_LOG_APP_PRIORITY("GMAIL",KFS::ZincLogger::kLogLevelDEBUG,"GMAIL:logs", "File was accessed!");

}
