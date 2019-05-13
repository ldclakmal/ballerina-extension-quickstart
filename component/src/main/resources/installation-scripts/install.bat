@echo off
rem ----------------------------------------------------------------------
rem Copyright (c) 2019, WSO2 Inc. (http:www.wso2.org) All Rights Reserved.
rem
rem WSO2 Inc. licenses this file to you under the Apache License,
rem Version 2.0 (the "License"); you may not use this file except
rem in compliance with the License.
rem You may obtain a copy of the License at
rem
rem     http:www.apache.orglicensesLICENSE-2.0
rem
rem Unless required by applicable law or agreed to in writing,
rem software distributed under the License is distributed on an
rem "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
rem KIND, either express or implied.  See the License for the
rem specific language governing permissions and limitations
rem under the License.
rem

SETLOCAL
SET /P ballerina_home=Please enter Ballerina home:

IF NOT EXIST "%ballerina_home%/bin/ballerina.bat" (
    ECHO "Incorrect Ballerina Home provided!"
    GOTO :END
)

SET ballerina_lib_location=%ballerina_home%\bre\lib
SET ballerina_balo_location=%ballerina_home%\lib\repo
SET version=${project.version}
SET module_name=extension

IF EXIST "%ballerina_lib_location%\%module_name%-module-%version%.jar" (
    rem Backup if a jar already exists with the same name
    MKDIR temp
	XCOPY "%ballerina_lib_location%\%module_name%-module-%version%.jar" "temp" /y
)

XCOPY ".\dependencies\%module_name%-module-%version%.jar" "%ballerina_lib_location%" /y

IF %ERRORLEVEL% GTR 0 (
    ECHO An error occurred while copying .\dependencies\%module_name%-module-%version%.jar to %ballerina_lib_location%
	ECHO Installation unsuccessful.
	GOTO :FAILED
)

rem Create directory hierarchy for the balo if it doesn't already exist
IF NOT EXIST "%ballerina_balo_location%\wso2\%module_name%\0.0.0" (
    MKDIR "%ballerina_balo_location%\wso2\%module_name%\0.0.0"

	IF ERRORLEVEL 1 (
		ECHO An error occurred while copying .\balo\wso2\%module_name%\0.0.0\%module_name%.zip to %ballerina_balo_location%\wso2\%module_name%\0.0.0
		ECHO Installation unsuccessful. Reverting changes.
		IF EXIST "temp\%module_name%-module-%version%.jar" (
			ECHO Copying backed-up %module_name%-module-%version%.jar to %ballerina_lib_location%
			XCOPY "temp\%module_name%-module-%version%.jar" "%ballerina_lib_location%" /y
		) ELSE (
			DEL "%ballerina_lib_location%\%module_name%-module-%version%.jar"
		)
		GOTO :FAILED
    )
)

rem Copy balo
XCOPY ".\balo\wso2\%module_name%\0.0.0\%module_name%.zip" "%ballerina_balo_location%\wso2\%module_name%\0.0.0" /e /y

IF %ERRORLEVEL% GTR 0 (
    ECHO An error occurred while copying .\balo\wso2\%module_name%\0.0.0\%module_name%.zip to %ballerina_balo_location%\wso2\%module_name%\0.0.0
    ECHO Installation unsuccessful. Reverting changes.
    IF EXIST "temp\%module_name%-module-%version%.jar" (
	    ECHO Copying backed-up %module_name%-module-%version%.jar to %ballerina_lib_location%
	    XCOPY "temp\%module_name%-module-%version%.jar" "%ballerina_lib_location%" /y
	) ELSE (
	    DEL "%ballerina_lib_location%\%module_name%-module-%version%.jar"
	)
	GOTO :FAILED
)

:SUCCESS
ECHO Successfully installed Ballerina-Extension module!
GOTO :END

:FAILED
ECHO You can manually install the module by copying
ECHO 1. dependencies\%module_name%-module-%version%.jar to %ballerina_lib_location%
ECHO 2. balo\wso2\%module_name%\0.0.0\%module_name%.zip to %ballerina_balo_location%\wso2\%module_name%\0.0.0

:END
IF EXIST .\temp (
RD temp /s /q
)
ENDLOCAL
