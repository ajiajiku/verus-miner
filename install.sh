#!/data/data/com.termux/files/usr/bin/bash
set -e

DIR="$HOME/verus-miner"
BASE="https://raw.githubusercontent.com/Darktron/pre-compiled/generic"
mkdir -p "$DIR"

pkg update -y
pkg install -y libjansson wget

wget -q --show-progress -O "$DIR/ccminer" "$BASE/ccminer"
chmod +x "$DIR/ccminer"

printf "Wallet Verus: "
read -r WALLET
printf "Worker [android]: "
read -r WORKER
WORKER=${WORKER:-android}

# Setting baseline yang terbukti bekerja pada setup sebelumnya.
THREADS=8

cat > "$DIR/config.json" <<EOF
{
  "pools": [{"name":"SG-VIPOR","url":"stratum+tcp://sg.vipor.net:5040","timeout":180,"disabled":0}],
  "user":"${WALLET}.${WORKER}",
  "pass":"x",
  "algo":"verus",
  "threads":8,
  "cpu-priority":1,
  "cpu-affinity":-1,
  "retry-pause":10
}
EOF

cat > "$DIR/start.sh" <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash
exec "$HOME/verus-miner/ccminer" -a verus -o stratum+tcp://sg.vipor.net:5040 -c "$HOME/verus-miner/config.json" -p x --cpu-priority 1 --cpu-affinity -1 -t 8
EOF
chmod +x "$DIR/start.sh"

LINE='[ -x "$HOME/verus-miner/start.sh" ] && "$HOME/verus-miner/start.sh"'
touch "$HOME/.bashrc"
grep -qxF "$LINE" "$HOME/.bashrc" 2>/dev/null || echo "$LINE" >> "$HOME/.bashrc"

echo "Verus Miner terpasang — 8 thread CPU, SG-VIPOR."
echo "Mining otomatis saat Termux dibuka."
exec "$DIR/start.sh"
