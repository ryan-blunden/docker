FROM wordpress:4.9-php7.2-apache

HEALTHCHECK --interval=5s --timeout=5s --retries=3 CMD curl --fail http://localhost/ || exit 1
