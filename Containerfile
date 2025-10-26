FROM scratch AS ctx
COPY build_files /
FROM ghcr.io/ublue-os/bluefin-dx:lts

RUN mkdir /nix
COPY build_files/nix.mount /etc/systemd/system/nix.mount
COPY build_files/nix.conf /etc/tmpfiles.d/nix.conf
COPY build_files/nix.just /usr/share/ublue-os/just/100-nix.just
RUN echo 'import "/usr/share/ublue-os/just/100-nix.just"' >> /usr/share/ublue-os/justfile

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh

RUN bootc container lint
