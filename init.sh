#!/bin/sh 
DEMO="JBoss BRMS Business Resource Planner Workshop"
AUTHORS="Geoffrey de Smet, Eric D. Schabell"
PROJECT="git@github.com:eschabell/business-resource-planner-workshop.git"
PRODUCT="JBoss Business Resource Planner"
JBOSS_HOME=./target
SUPPORT_DIR=./support
SRC_DIR=./installs
PRJ_DIR=./projects
SOURCE=jboss-bpms-brms-6.0.3.GA-redhat-1-optaplanner.zip
VERSION=6.0.3

# wipe screen.
clear 

echo
echo "##########################################################"
echo "##                                                      ##"   
echo "##  Setting up the                                      ##"
echo "##                                                      ##"   
echo "##   ${DEMO}      ##"
echo "##                                                      ##"   
echo "##                                                      ##"   
echo "##   ####   #       ###   #   #  #   #  #####  ####     ##"
echo "##   #   #  #      #   #  ##  #  ##  #  #      #   #    ##"
echo "##   ####   #      #####  # # #  # # #  ####   ####     ##"
echo "##   #      #      #   #  #  ##  #  ##  #      #  #     ##"
echo "##   #      #####  #   #  #   #  #   #  #####  #   #    ##"
echo "##                                                      ##"   
echo "##                                                      ##"   
echo "##  brought to you by,                                  ##"   
echo "##        ${AUTHORS}            ##"
echo "##                                                      ##"   
echo "##########################################################"
echo

command -v mvn -q >/dev/null 2>&1 || { echo >&2 "Maven is required but not installed yet... aborting."; exit 1; }

# make some checks first before proceeding.	
if [ -r $SRC_DIR/$SOURCE ] || [ -L $SRC_DIR/$SOURCE ]; then
	echo JBoss product sources, $BRMS present...
	echo
else
	echo Need to download $SOURCE package from the Customer Portal 
	echo and place it in the $SRC_DIR directory to proceed...
	echo
	exit
fi


# Remove old instance if found.
if [ -x $JBOSS_HOME ]; then
	echo "  - existing install detected and removed..."
	echo
	rm -rf ./target
fi

# Install product.
echo "Installing workshop..."
echo
unzip -q -d $JBOSS_HOME $SRC_DIR/$SOURCE

echo "$PRODUCT can be found in $JBOSS_HOME..."
echo 
echo "$PRODUCT $VERSION $DEMO Setup Complete."
echo

