#!/bin/bash

###
#
#     Name:  CleanSPSS.sh
#     Description:
#     Cleans all SPSS versions before installing new version
#     Author:  Thijs v Vught
#     Created:  2011-04-22
#     Last Modified:  2023-01-03
#     Version:  1.0
#     Source: https://www.ibm.com/support/pages/script-completely-remove-uninstall-spss-statistics-macos
#
###

# Clean out list of installed versions
rm -fr /Library/Preferences/.com.zerog.registry.xml

# Clean out global preferences for Statistics
rm -fr /Library/Preferences/com.spss*
rm -fr /Library/Preferences/com.ibm.spss*

# Clean out user preferences for Statistics
rm -fr ~/Library/Preferences/com.spss*
rm -fr ~/Library/Preferences/com.ibm.spss*

# Clean out extensions and custom dialogs
rm -fr /Library/Application\ Support/IBM/SPSS

# Clean ~/Library/Application Support/IBM & /SPSSInc
rm -fr ~/Library/Application\ Support/IBM/SPSS
rm -fr ~/Library/Application\ Support/SPSSInce

#Remove SPSS Application
rm -rf /Applications/IBM*

# Clean out Python Plug-Ins if needed
rm -fr /Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/Spss*
rm -fr /Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/spss*

# Finally, restart cfprefsd daemon to flush cache
killall cfprefsd