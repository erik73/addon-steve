#!/command/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: SteVe
# Check if SteVe needs to be built
# ==============================================================================

if ! bashio::fs.directory_exists '/data/target'; then
    bashio::log.info "Starting SteVe initial build...."
    cd /usr/src/steve || exit
    mvn package
    cp -f /usr/src/steve/pom.xml /data/
    mv /usr/src/steve/target/ /data/
fi

