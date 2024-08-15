podman stop frontend_container
podman rm frontend_container

podman rmi frontend_image

subuidSize=$(( $(podman info --format "{{ range \
   .Host.IDMappings.UIDMap }}+{{.Size }}{{end }}" ) - 1 ))
subgidSize=$(( $(podman info --format "{{ range \
   .Host.IDMappings.GIDMap }}+{{.Size }}{{end }}" ) - 1 ))

uid=${ENV_UID}
gid=${ENV_GID}

podman build \
--ulimit=nofile=4096:4096 \
--build-arg=BUILD_ENV_UID=${ENV_UID} \
--build-arg=BUILD_ENV_USERNAME=${ENV_USERNAME} \
--build-arg=BUILD_ENV_GID=${ENV_GID} \
--build-arg=BUILD_ENV_GROUPNAME=${ENV_GROUPNAME} \
-f Dockerfile -t frontend_image

## podman create \
## --name frontend_container \
## --user $uid:$gid \
## --log-opt max-size=10mb \
##  -p 3000:3000  \
## localhost/frontend_image:latest
