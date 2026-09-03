#!/data/data/com.termux/files/usr/bin/sh
set -e

REPO="$HOME/ccminer"
BASE="https://raw.githubusercontent.com/Darktron/pre-compiled/generic"

mkdir -p "$REPO"
cd "$REPO"

pkg install libjansson wget -y

wget -O ccminer "$BASE/ccminer"
wget -O config.json "$BASE/config.json"
wget -O start.sh "$BASE/start.sh"

chmod +x ccminer start.sh

printf '\nVerus Miner installed in %s\n' "$REPO"
printf 'Edit config: nano %s/config.json\n' "$REPO"
printf 'Start miner: %s/start.sh\n' "$REPO"
