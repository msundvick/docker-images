podman build -t rust-cross:1.81-0 -f .\rust-cross.dockerfile
podman tag rust-cross:1.81-0 docker.io/msundvick/rust-cross:1.81-0
podman login
podman push docker.io/msundvick/rust-cross:1.81-0