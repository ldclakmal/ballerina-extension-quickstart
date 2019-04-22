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

read -p "Enter Ballerina home: "  ballerina_home

if [ ! -e "$ballerina_home/bin/ballerina" ]
then
    echo "Incorrect Ballerina Home provided!"
    exit 1
fi

ballerina_lib_location=$ballerina_home/bre/lib/
ballerina_balo_location=$ballerina_home/lib/repo/
version=${project.version}
module_name=ballerina-utils

if [ ! -e "$ballerina_lib_location/wso2-$module_name-module-$version.jar" ]
then
   if [ ! -e "$ballerina_balo_location/wso2/$module_name/0.0.0/$module_name.zip" ]
   then
   echo "Ballerina Utils module is not installed!"
   exit 0
   fi
fi

rm $ballerina_lib_location/wso2-$module_name-module-$version.jar

if [ -e "$ballerina_lib_location/wso2-$module_name-module-$version.jar" ]; then
    echo "Error occurred while deleting dependencies from $ballerina_lib_location"
    echo "Please manually delete $ballerina_lib_location/wso2-$module_name-module-$version.jar and $ballerina_balo_location/wso2/$module_name/0.0.0/$module_name.zip"
    exit 1
fi

rm -r $ballerina_balo_location/wso2/$module_name/0.0.0

if [ -e "$ballerina_balo_location/wso2/$module_name/0.0.0/$module_name.zip" ]; then
    echo "Error occurred while deleting $module_name balo from $ballerina_balo_location"
    echo "Please manually delete $ballerina_balo_location/wso2/$module_name/0.0.0 directory"
    exit 2
else
    echo "Successfully uninstalled Ballerina Utils module!"
fi
