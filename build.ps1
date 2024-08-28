podman build -t rust-cross:1.77-5 -f .\rust-cross.dockerfile
podman tag rust-cross:1.77-5 docker.io/msundvick/rust-cross:1.77-5
podman login
podman push docker.io/msundvick/rust-cross:1.77-5