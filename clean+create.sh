podman stop publish_dash_component_container
podman rm publish_dash_component_container

podman rmi publish_dash_component_image

podman build \
--ulimit=nofile=4096:4096 \
-f Dockerfile -t publish_dash_component_image

podman create \
--name frontend_container \
--log-opt max-size=10mb \
localhost/publish_dash_component_image:latest

