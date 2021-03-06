#!/bin/bash
# Sort Domain into a plain text file with domain names only
# Created by: Mitchell Krog (mitchellkrog@gmail.com)
# Copyright: Mitchell Krog - https://github.com/mitchellkrogza
# Repo Url: https://github.com/mitchellkrogza/The-Big-List-of-Hacked-Malware-Web-Sites

#Specify Input and Output File
# ****************************
_input=$TRAVIS_BUILD_DIR/_generator_lists/bad-user-agents.list
_output=$TRAVIS_BUILD_DIR/.dev-tools/_robots_input/robots-input.txt

# Truncate our file
# *****************
sudo truncate -s 0 $_output

# Use sed to strip the \ out of the input file
# ***************************************************
sed 's/\\ / /g' $_input > $_output

# Use cut to strip the domains out of the url strings
# ***************************************************
#cut -d'\' -f3 $_input > $_output

# Sort our output file and remove dupes
# *************************************
sort -u $_output -o $_output
