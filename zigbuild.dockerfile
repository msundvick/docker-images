FROM messense/cargo-zigbuild

RUN apt update && apt upgrade -y && \
    apt install -y clang llvm python3-venv python3-pip

RUN curl -fsSL https://get.pnpm.io/install.sh | bash -
ENV PNPM_HOME=/root/.local/share/pnpm
ENV PATH="$PNPM_HOME:$PATH"
RUN pnpm env add --global 18 

RUN curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
RUN cargo binstall cargo-xwin -y
RUN cd root && cargo new tmp && cd tmp && rustup target add x86_64-pc-windows-msvc && cargo xwin check --target x86_64-pc-windows-msvc && cd .. && rm -r tmp

ENV AR_X86_64_PC_WINDOWS_MSVC="llvm-ar-11"
ENV CARGO_TARGET_X86_64_PC_WINDOWS_MSVC_RUSTFLAGS="-C linker-flavor=lld-link"