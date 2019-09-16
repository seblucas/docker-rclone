FROM alpine:3.10.2
LABEL maintainer="Sebastien Lucas <sebastien@slucas.fr>"
LABEL Description="RClone docker image"

ARG RCLONE_VERSION=v1.47.0
ADD alpineArch2rcloneArch.sh /bin/alpineArch2rcloneArch.sh

RUN apk add -U --no-cache ca-certificates && \
    chmod +x /bin/alpineArch2rcloneArch.sh && \
    alpineArch2rcloneArch.sh "${RCLONE_VERSION}"


FROM scratch

COPY --from=0 /tmp/rclone .
COPY --from=0 /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

ENTRYPOINT ["/rclone"]

CMD ["--version"]
