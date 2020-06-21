
ROOT_DIR=""
BRANCH=""
COMMENT="dev: upload to test server"

# Extract Argument
while getopts r:b:c: flag
do
	case "${flag}" in
		r) ROOT_DIR=${OPTARG};;
		b) BRANCH=${OPTARG};;
		c) COMMENT=${OPTARG};;
	esac
done 

if [ "$ROOT_DIR" == "" ] || [ "$BRANCH" == "" ]; then
	echo Set Arguments
	echo "    -r: project root diretory"
	echo "    -b: git branch to upload to"
	echo "    -c: git commit comment. default) dev: upload to test server"
else
	echo --------------------------------
	echo Root Directory: $ROOT_DIR
	echo Branch: $BRANCH
	echo Comment: $COMMENT
	echo --------------------------------

	TOOL_DIR="${PWD}";
	cd $ROOT_DIR
	# git commit current changes
	git add .
	git status
	git commit -m "$COMMENT"
	# git pull first
	git pull origin $BRANCH
	# git push
	git push origin $BRANCH
	cd $TOOL_DIR
fi
