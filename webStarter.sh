#! /bin/sh

#Script parameters
#First script param: project name (if non specified it wil be asked before creating folder tree)

#Web project starter

PROJECT_NAME=""
FRAMEWORK_FOLDER="/Users/Andrea/Documents/Andrea/Programmazione/shell/WebProjectInit/WebStarter/framework/"
PROJECT_STRUCTURE="${FRAMEWORK_FOLDER}project_structure/"

echo "==> Starting a new web project..."

#-------------------------------------------------------
#Check if a project name is specified in the first parameter of the script
if [ "$1" == "" ]; then
	echo "Insert a name for the project:"
	read PROJECT_NAME
else
	PROJECT_NAME=$1
	echo "Making a new project tree with name ${PROJECT_NAME} confirm? (y/n)"
	read CONFIRM
	if [ "$CONFIRM" == "y" ]; then 
		echo "Start creation..."
	else
		echo "Insert a new name for the project:"
		read PROJECT_NAME	
	fi
fi
echo "==> Creating "${PROJECT_NAME}

#---------------------------------------------------------
#Making root project directory
mkdir ${PROJECT_NAME}

#---------------------------------------------------------
#Copying framework folder
cp -R ${PROJECT_STRUCTURE} ${PROJECT_NAME}
echo "==> Making project tree..."

#---------------------------------------------------------
#Database PHP connection
echo "Do you want include a database connection into ${PROJECT_NAME} project? (y/n)"
read CONFIRM
if [ "$CONFIRM" == "y" ]; then
	DB="${FRAMEWORK_FOLDER}add-on/db"
	cd ${PROJECT_NAME}/include
	echo "Including database connection scripts..."
	cp -R $DB db
	echo "Database module included"
fi

#---------------------------------------------------------
echo ">>> Project tree creation done with success!! <<<"
