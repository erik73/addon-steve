#!/command/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: SteVe
# Check if SteVe needs to be built
# ==============================================================================

if ! bashio::fs.directory_exists '/data/target'; then
    bashio::log.info "Starting SteVe initial build...."
    cd /usr/src/steve || exit
    MAVEN_OPTS="-Xmx100m" mvn package
    cp -f /usr/src/steve/pom.xml /data/
    cp -R -f /usr/src/steve/target/ /data/
fi

