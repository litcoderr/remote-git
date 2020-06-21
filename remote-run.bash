ROOT_DIR=""
BRANCH=""
SCRIPT=""

# Extract Argument
while getopts r:b:s: flag
do
	case "${flag}" in
		r) ROOT_DIR=${OPTARG};;
		b) BRANCH=${OPTARG};;
		s) SCRIPT=${OPTARG};;
	esac
done 

if [ "$ROOT_DIR" == "" ] || [ "$BRANCH" == "" ] || [ "$SCRIPT" == "" ]; then
	echo Set -r -b -s
else
	echo --------------------------------
	echo Root Directory: $ROOT_DIR
	echo Branch: $BRANCH
	echo Script: $SCRIPT

	TOOL_DIR="${PWD}";
	cd $ROOT_DIR
	# git pull from remote github server
	git pull origin $BRANCH
	# run script
	echo ""
	echo RUN: $SCRIPT
	echo --------------------------------
	$SCRIPT
	cd $TOOL_DIR
fi
