# certbot-dns-linode-wrapper: Container for Let's Encrypt via Linode DNS

[![Build](https://img.shields.io/github/checks-status/smkent/certbot-dns-linode-wrapper/main?label=build)][gh-actions]
[![GitHub stars](https://img.shields.io/github/stars/smkent/certbot-dns-linode-wrapper?style=social)][repo]

# Features

* Linode API key configuration via docker-compose secret or environment variable
* Automatic certificate renewal check
* [`tini`][tini] as `init`

# Usage with docker-compose

## Linode API key as a docker-compose secret (recommended)

This example `docker-compose.yaml` uses the Linode API key stored in the secrets
file at `secrets/certbot-linode-api-key`:

```yaml
version: "3.7"

secrets:
  certbot-linode-api-key: { file: secrets/certbot-linode-api-key }

services:
  certbot:
    image: ghcr.io/smkent/certbot-dns-linode-wrapper:latest
    environment:
      - CERTBOT_EMAIL=your.email@example.com    # For certificate expiry notices
      - CERTBOT_HOSTS=*.you.example.com you.example.com
      - CERTBOT_LINODE_API_KEY=certbot-linode-api-key
    restart: unless-stopped
    secrets:
      - certbot-linode-api-key
    volumes:
      - path/to/certbot/data:/etc/letsencrypt
```

## Linode API key as an environment variable

```yaml
version: "3.7"

services:
  certbot:
    image: ghcr.io/smkent/certbot-dns-linode-wrapper:latest
    environment:
      - CERTBOT_EMAIL=your.email@example.com    # For certificate expiry notices
      - CERTBOT_HOSTS=*.you.example.com you.example.com
      - CERTBOT_LINODE_API_KEY=your-api-key-copy-and-paste
    restart: unless-stopped
    volumes:
      - path/to/certbot/data:/etc/letsencrypt
```

---

Created from [smkent/cookie-docker][cookie-docker] using
[cookiecutter][cookiecutter]

[cookie-docker]: https://github.com/smkent/cookie-docker
[cookiecutter]: https://github.com/cookiecutter/cookiecutter
[gh-actions]: https://github.com/smkent/certbot-dns-linode-wrapper/actions?query=branch%3Amain
[repo]: https://github.com/smkent/certbot-dns-linode-wrapper
[tini]: https://github.com/krallin/tini
