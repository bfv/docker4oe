#!/bin/bash

# this script makes it possible to have multiple installer next to the Dockerfile
# The versions which are not used are place in a temporary .dockerignore file

scriptpath=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

source ${scriptpath}/build.properties

latest=$LATEST
if [ "$1" != "" ]; then
    version=$1
else
    version=$latest
fi

# since the root can contain more than one (big!) .tar.gz file
# we create a .dockerignore on the fly to prevent the 
# (docker daemon) context to get too big.
createDockerIgnore () {

    if [ ! -f ${scriptpath}/.dockerignore ]; then
        touch ${scriptpath}/.dockerignore
    fi

    cp ${scriptpath}/.dockerignore ${scriptpath}/.dockerignore.save
    printf "\n\n#generated entries\n" >> ${scriptpath}/.dockerignore
    for entry in "$scriptpath"/*.tar.gz
    do
        filename="$(basename -- $entry)"
        if [ $filename != "PROGRESS_OE_${version}_LNX_64.tar.gz" ]; then
            echo $filename >> ${scriptpath}/.dockerignore
        fi
    done
}

restoreDockerIgnore () {
    rm ${scriptpath}/.dockerignore
    mv ${scriptpath}/.dockerignore.save ${scriptpath}/.dockerignore
}

if [ ! -f ${scriptpath}/PROGRESS_OE_${version}_LNX_64.tar.gz ]; then
    echo openedge ${version} installer not found
    exit 1;
fi
installer_file=PROGRESS_OE_${version}_LNX_64.tar.gz

# if more properties needed:
# if [ ! -f ${scriptpath}/config-${version}.properties ]; then 
#     echo config-${version}.properties not found
#     exit 2
# fi
# source ${scriptpath}/config-${version}.properties

echo building openedge-db image for $version

# create copy of template and replace version
dockerfile=${scriptpath}/Dockerfile-${version}
cp ${scriptpath}/Dockerfile ${dockerfile}
sed -i "s/\${OE_VERSION}/${version}/" ${dockerfile}

image_name=${IMAGE_BASENAME}:${version}

createDockerIgnore

docker build -f ${dockerfile} \
    --rm \
    -t ${image_name} \
    -t ${IMAGE_BASENAME}:latest \
    ${scriptpath} 

if [ "$?" != "0" ]; then
    echo build failed
else
    echo ${image_name}
fi

restoreDockerIgnore

rm ${dockerfile}

