# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

# Base Image
FROM ghcr.io/ublue-os/bluefin-dx:lts

RUN mkdir -p /usr/share/atomac
COPY /build_files/gnome-macos-remap.yml /usr/share/atomac
COPY /build_files/gnome-macos-remap.service /usr/share/atomac
COPY /build_files/terminal-console-ctrl-d.sh /usr/share/atomac

COPY /build_files/gnome-macos-remap.just /usr/share/ublue-os/just/100-keybindings.just
RUN echo 'import "/usr/share/ublue-os/just/100-keybindings.just"' >> /usr/share/ublue-os/justfile

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh

## Verify final image and contents are correct.
RUN bootc container lint
