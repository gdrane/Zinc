#include <stdio.h>
#include <fstream>
#include "zinc.h"
extern "C"{
void firstLog();
}
void firstLog() {

printf("File was accessed\r\n");
//KFS_LOG_APP_PRIORITY("GMAIL",KFS::ZincLogger::kLogLevelINFO,"GMAIL-logs", "File was accessed!");
std::ofstream myFile;
myFile.open("logger.txt");
myFile << "File was accessed";
myFile.close();

}
