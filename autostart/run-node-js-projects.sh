#!/usr/bin/env bash
#
# This is a generic example to startup your NodeJS projects with
# pm2 (https://github.com/Unitech/pm2)
#
#  This will be executed by the user account "devpod"
#



# Add the full paths of your Nodejs projects startup files into this array
# Each project separated by a newline and enclosed in double quotes. (No commas!)
# Paths are internal paths inside the PHP container.
NODE_PROJECTS=(
	#"/shared/httpd/my-rhost/js/index.js"
	#"/shared/httpd/my-node-hello-world/name/run.js"
	#"/shared/httpd/another-node-project/javascript/run.js"
)


# Check if any projects have been defined
if [ ${#NODE_PROJECTS[@]} -eq 0 ]; then
	echo "No projects defined. Exiting."
	exit 0
fi


# This loops over the paths, separates base directory and filename and will run it in the background
# as the user devilbox. There shouldn't be any need to change anything here.
for item in ${NODE_PROJECTS[*]}; do
	NODE_PATH="$( dirname "${item}" )"
	NODE_FILE="$( basename "${item}" )"

	if [ ! -d "${NODE_PATH}" ]; then
		>&2 echo "[Warning], skipping startup, directory does not exist: ${NODE_PATH}"
		continue;
	fi
	if [ ! -f "${NODE_PATH}/${NODE_FILE}" ]; then
		>&2 echo "[Warning], skipping startup, file does not exist: ${NODE_PATH}/${NODE_FILE}"
		continue;
	fi

	echo "su -c \"cd ${NODE_PATH}; pm2 start ${NODE_FILE}\" -l devpod"
	su -c "cd ${NODE_PATH}; pm2 start ${NODE_FILE}" -l devpod
done
