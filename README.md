# REMOTE-GIT
> Push, Pull and Run your code on remote server in a breeze

## For Whom
This script is for those who are sick of integrating code between local and test server. You will be able to upload local changes and run it on a remote server with just 2 simple commands.

## Installation

1. Run following script
	- **.bashrc** users

	```bash
	cd ~/ ; git clone https://github.com/litcoderr/remote-git.git ; cd remote-git ; echo -e 'export PATH=$PATH:'$PWD'\nalias remote-run="remote-run.bash"\nalias remote-upload="remote-upload.bash"' >> ~/.bashrc ; cd ~/ ; source ~/.bashrc
	```
	
	- **.zshrc** users

	```bash
	cd ~/ ; git clone https://github.com/litcoderr/remote-git.git ; cd remote-git ; echo 'export PATH=$PATH:'$PWD'\nalias remote-run="remote-run.bash"\nalias remote-upload="remote-upload.bash"' >> ~/.zshrc ; cd ~/ ; source ~/.zshrc
	```

## Usage

1. Upload your changes to github server using the command below.
	
	```bash
	remote-upload -r [YOUR_PROJECT_ROOT] -b [BRANCH_NAME] -c [COMMENT]
	```
	- ```-r``` : (Essential) Project root directory consisting git configuration
	- ```-b``` : (Essential) Branch to deploy to
	- ```-c``` : Comment for git commit. Default) "dev: upload to test server"

2. Run your code using the command below via ssh

	```bash
	remote-run -r [YOUR_PROJECT_ROOT] -b [BRANCH_NAME] -s [SCRIPT]
	```
	- ```-r``` : (Essential) Project root directory consisting git configuration
	- ```-b``` : (Essential) Branch to deploy to
	- ```-s``` : (Essential) Script to run

