FROM rust:1.77.0-slim-bullseye

RUN apt update && apt upgrade -y && \
    apt install -y git curl libclang1-11 libclang-common-11-dev xz-utils 

ENV zigVersion "zig-linux-x86_64-0.12.0"
ENV PATH "/usr/local/zig:$PATH"

RUN curl "https://ziglang.org/download/0.12.0/$zigVersion.tar.xz" --output "$zigVersion.tar.xz" &&\
    tar -xvf "$zigVersion.tar.xz" &&\
    mv "$zigVersion" /usr/local/zig/ &&\
    rm "$zigVersion.tar.xz"

RUN cargo install cargo-zigbuild