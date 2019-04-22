#!/bin/bash
# ---------------------------------------------------------------------------
#  Copyright (c) 2019, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

read -p "Please enter Ballerina home: "  ballerina_home

if [ ! -e "$ballerina_home/bin/ballerina" ]
then
    echo "Incorrect Ballerina Home provided!"
    exit 1
fi

ballerina_lib_location=$ballerina_home/bre/lib/
ballerina_balo_location=$ballerina_home/lib/repo/
version=${project.version}
module_name=utils

if [ -e "$ballerina_lib_location/$module_name-module-$version.jar" ]
then
    if [ ! -e temp ]
    then mkdir temp
    cp $ballerina_lib_location/$module_name-module-$version.jar temp/
    fi
fi

cp dependencies/ballerina-$module_name-module-$version.jar $ballerina_lib_location

if [ $? -ne 0 ]
then
    echo "Error occurred while copying dependencies to $ballerina_lib_location"
    if [ -e temp ]
    then rm -r temp
    fi
    echo "You can install the module by manually copying"
    echo 1. "dependencies/ballerina-$module_name-module-$version.jar to $ballerina_lib_location"
    echo 2. "Contents of balo directory to $ballerina_balo_location".
    exit 2
fi

cp -r balo/* $ballerina_balo_location/

if [ $? -ne 0 ]; then
    echo "Error occurred while copying $module_name balo to $ballerina_balo_location. Reverting the changes"
    if [ -e temp/$module_name-module-$version.jar ]
    then cp temp/$module_name-module-$version.jar $ballerina_lib_location/
    rm -r temp
    else rm $ballerina_lib_location/$module_name-module-$version.jar
    fi
    echo "You can install the module by manually copying"
    echo 1. "dependencies/$module_name-module-$version.jar to $ballerina_lib_location"
    echo 2. "Contents of balo directory to $ballerina_balo_location"
    exit 3
else
    if [ -e "temp/$module_name-module-$version.jar" ]
    then rm -r temp
    fi
    echo "Successfully installed Ballerina Utils module!"
fi
