#include "common/BufferedLogWriter.h"
#include "qcdio/qcutils.h"
#include "common/properties.h"

#include <iostream>
#include <string>
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#include <sys/time.h>
#include <errno.h>

using namespace KFS;
using namespace std;

static uint64_t Now()
{
    struct timeval theTime;
    if (gettimeofday(&theTime, 0)) {
        QCUtils::FatalError("gettimeofday", errno);
    }
    return (int64_t(theTime.tv_sec) * 1000000 + theTime.tv_usec);
}

int main(int argc, char** argv)
{
    BufferedLogWriter theLogWriter(fileno(stderr), 0, 1 << 20);
    if (argc > 1) {
        Properties theProps;
        if (theProps.loadProperties(argv[1], '=', true) != 0) {
            return 1;
        }
        theLogWriter.SetParameters(theProps, "logWriter.");
    }
    if (argc > 2) {
        int theMax = (int)atof(argv[2]);
        uint64_t theStart = Now();
        uint64_t thePrev  = theStart;
        for (int i = 1; i <= theMax; i++) {
            theLogWriter.Append(BufferedLogWriter::kLogLevelDEBUG, "%d", i);
            if ((i & 0xFFFFF) == 0) {
                const uint64_t theNow = Now();
                cout << i * 1e6 / (double(theNow - theStart) + 1e-7) <<
                    " rec/sec avg " << 
                    1e6 * 0xFFFFF / (double(theNow - thePrev) + 1e-7) <<
                    " rec/sec\n";
                thePrev = theNow;
            }
        }
    } else {
        string theLine;
        while (getline(cin, theLine)) {
            theLogWriter.Append(BufferedLogWriter::kLogLevelDEBUG,
                "%s", theLine.c_str());
        }
    }
    return 0;
}
