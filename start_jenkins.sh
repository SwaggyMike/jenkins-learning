#!/bin/bash

# Directory variables
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
jenkins_dir="${script_dir}/jenkins"

# Name of the Jenkins container and image
container_name="jenkins-lts"
image_name="my-custom-jenkins"

# Function to display usage
usage() {
    echo "Usage: $0 [-u <username>] [-p <password>]" 1>&2
    exit 1
}

# Parse command-line options
while getopts ":u:p:" opt; do
    case ${opt} in
        u)
            ADMIN_USER=$OPTARG
            ;;
        p)
            ADMIN_PASSWORD=$OPTARG
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND -1))

# If username or password is not provided, display usage and exit
if [[ -z $ADMIN_USER || -z $ADMIN_PASSWORD ]]; then
    usage
fi

# Stop and remove existing Jenkins container
exists=$(podman ps -a --filter "name=$container_name" --format "{{.Names}}")
if [ ! -z "$exists" ]; then
    echo "Stopping existing Jenkins container..."
    podman stop $container_name
    echo "Removing existing Jenkins container..."
    podman rm $container_name
fi

# Build the custom Jenkins image with JCasC and plugins
echo "Building custom Jenkins image..."
podman build -t $image_name "$jenkins_dir"

# Start a new Jenkins container with the custom image
echo "Starting a new Jenkins container on port 8090..."
podman run --name $container_name -p 8090:8080 -p 50000:50000 -e ADMIN_USER=$ADMIN_USER -e ADMIN_PASSWORD=$ADMIN_PASSWORD $image_name

echo "Jenkins is starting up on port 8090. Access it at http://localhost:8090."

