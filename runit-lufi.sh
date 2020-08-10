#!/bin/bash -e

cd /opt/lufi

echo "Starting Lufi via carton / hypnotoad..."
#carton exec hypnotoad script/lufi
carton exec hypnotoad -f script/lufi
echo "Lufi service exit."
