@ECHO OFF
setlocal

set PROJECT_HOME=%~dp0
set DEMO=Business Resource Planner Workshop
set AUTHORS=Geoffrey de Smet, Eric D. Schabell
set PROJECT=git@github.com:eschabell/business-resource-planner-workshop.git
set PRODUCT=Business Resource Planner
set JBOSS_HOME=%PROJECT_HOME%target
set SUPPORT_DIR=%PROJECT_HOME%support
set SRC_DIR=%PROJECT_HOME%installs
set PRJ_DIR=%PROJECT_HOME%projects
set WORKSHOP_DIR=%PRJ_DIR%business-resource-planner-workshop
set SOURCE=jboss-bpms-brms-6.0.3.GA-redhat-1-optaplanner.zip
set VERSION=6.0.3

REM wipe screen.
cls

echo.
echo ##########################################################
echo ##                                                      ##   
echo ##  Setting up the                                      ##
echo ##                                                      ##   
echo ##   ${DEMO}      ##
echo ##                                                      ##
echo ##                                                      ##   
echo ##   ####   #       ###   #   #  #   #  #####  ####     ##
echo ##   #   #  #      #   #  ##  #  ##  #  #      #   #    ##
echo ##   ####   #      #####  # # #  # # #  ####   ####     ##
echo ##   #      #      #   #  #  ##  #  ##  #      #  #     ##
echo ##   #      #####  #   #  #   #  #   #  #####  #   #    ##
echo ##                                                      ##   
echo ##                                                      ##   
echo ##  brought to you by,                                  ##   
echo ##        ${AUTHORS}            ##
echo ##                                                      ##
echo ##########################################################
echo.

REM make some checks first before proceeding. 
if exist %SRC_DIR%\%SOURCE% (
	echo JBoss product sources, %SOURCE% present...
	echo.
) else (
	echo Need to download %SOURCE% package from the Customer Support Portal and place it in the %SRC_DIR% directory to proceed...
	echo.
	GOTO :EOF
)

REM Remove the old JBoss instance, if it exists.
if exist %JBOSS_HOME% (
	echo - existing JBoss product install detected and removed...
	echo.

	rmdir /s /q "%PROJECT_HOME%\target"
)

REM Install product.
echo Installing planner...
echo.
call unzip -q -d %JBOSS_HOME%  %SRC_DIR%\%SOURCE% 


REM Install workshop.
echo.
echo Installing workshop...
call mvn clean install -f %WORKSHOP_DIR%\pom.xml
echo.
echo.
echo %PRODUCT% can be found in %JBOSS_HOME%...
echo.

echo %DEMO% %VERSION% Setup Complete.
echo.
