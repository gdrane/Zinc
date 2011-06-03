#!/bin/bash
cd ../build
gmake
gmake install
cd ../scripts
python kfslaunch.py -f machines.cfg --stop
echo "Deleting old installations"
rm -rf /home/gauresh/spring2011/cloud/project/meta
rm -rf /home/gauresh/spring2011/cloud/project/chunk1
python kfssetup.py -f machines.cfg -b ../build -w ../webui
python kfslaunch.py -f machines.cfg --start
