FROM certbot/dns-linode

# Add overrides and extras
RUN apk add --no-cache tini
COPY extras /smkent-extras
ENTRYPOINT ["/sbin/tini", "-g", "--", "/smkent-extras/entrypoint"]
