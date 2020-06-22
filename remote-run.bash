ROOT_DIR=""
BRANCH=""
SCRIPT=""
WD=""

# Extract Argument
while getopts r:w:b:s: flag
do
	case "${flag}" in
		r) ROOT_DIR=${OPTARG};;
		w) WD=${OPTARG};;
		b) BRANCH=${OPTARG};;
		s) SCRIPT=${OPTARG};;
	esac
done 

if [ "$ROOT_DIR" == "" ] || [ "$BRANCH" == "" ] || [ "$SCRIPT" == "" ]; then
	echo Set Arguments
	echo "    -r: (Essential) Project root directory consisting git configuration"
	echo "    -w: Working Directory (Relative to ROOT_DIR) Default: Same as ROOT_DIR"
	echo "    -b: (Essential) Branch to deploy to"
	echo "    -s: (Essential) Script to run"
else
	echo --------------------------------
	echo Root Directory: $ROOT_DIR
	echo Branch: $BRANCH
	echo Script: $SCRIPT

	if [ "$WD" == "" ]; then
		WD="${ROOT_DIR}";
	fi

	TOOL_DIR="${PWD}";
	cd $ROOT_DIR
	# git pull from remote github server
	git pull origin $BRANCH
	# run script
	echo ""
	echo RUN: $SCRIPT
	echo --------------------------------
	cd $WD  
	$SCRIPT
	cd $TOOL_DIR
fi
