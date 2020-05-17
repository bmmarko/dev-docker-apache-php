#!/usr/bin/env bash

set -euo pipefail

# We regenerate the configuration from environment variable, but only if the container is not started (i.e. if we are in a BUILD stage)
if [ ! -f /opt/container_started ]; then
    php /usr/local/bin/generate_conf.php | sudo tee /usr/local/etc/php/conf.d/generated_conf.ini > /dev/null
fi

real_composer "$@"
