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

#Change this PATH to your PKG location!
INSTALLERPATH="/Users/mvught/Downloads/SPSSSC_29.0.0.0_Mac.pkg"
#License prefs
SERVERPATH="licenseserver.github.nl"
ACTIVATIONPATH="/Applications/IBM*/Resources/Activation"

#Run Installer-PKG
sudo installer -pkg $INSTALLERPATH -target /Applications/ 

#Go to PATH
cd $ACTIVATIONPATH
sudo ./licenseactivator LSHOST=$SERVERPATH COMMUTE_MAX_LIFE=30

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