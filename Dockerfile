FROM certbot/dns-linode

# Set defaults
ENV CERTBOT_HOSTS=
ENV CERTBOT_EMAIL=
ENV CERTBOT_LINODE_API_KEY=
ENV CERTBOT_LINODE_API_VERSION=4
ENV CERTBOT_LINODE_DNS_SECONDS=180

# Add overrides and extras
RUN apk add --no-cache tini
COPY extras /smkent-extras
ENTRYPOINT ["/sbin/tini", "-g", "--", "/smkent-extras/entrypoint"]
