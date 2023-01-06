#!/bin/bash

###
#
#     Name:  SPSS Universal Activator.sh
#     Description:
#     This script can run for every SPSS version.
#     Author:  Thijs v Vught
#     Created:  2021-10-18
#     Last Modified:  2023-01-03
#     Version:  1.1
#   
#
###

#####Change this PATH to your PKG location!!
INSTALLERPATH="/Users/mvught/Downloads/SPSSSC_29.0.0.0_Mac.pkg"
#####Change licenseserver to yours!!
SERVERPATH="licenseserver.github.nl"
#####Change from 0 to max 30 days!!
DAYS="30"

#Run Installer-PKG
sudo installer -pkg $INSTALLERPATH -target /Applications/ 

#Go to PATH
ACTIVATIONPATH="/Applications/IBM*/Resources/Activation"
cd $ACTIVATIONPATH
sudo ./licenseactivator LSHOST=$SERVERPATH COMMUTE_MAX_LIFE=$DAYS

#Check if dockutil is installed
if [[ -x "/usr/local/bin/dockutil" ]]; then
    dockutil="/usr/local/bin/dockutil"
    #Version dockutil
    dockutilVersion=$(${dockutil} --version)
    echo "Dockutil version = ${dockutilVersion}"
else
    echo "dockutil not installed in /usr/local/bin, exiting"
    exit 1
fi

#Add dock icon for SPSS
$dockutil --add /Applications/IBM\ SPSS\ Statistics*/SPSS\ Statistics.app 'SPSSStatistics' --allhomes

#Kill dock to use new settings
killall -KILL Dock
echo "Restarted the Dock"

echo "Finished creating default Dock"
