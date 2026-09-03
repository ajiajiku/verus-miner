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

cat > "$DIR/config.json" <<EOF
{
  "pools": [{"name":"VIPOR","url":"stratum+tcp://us.vipor.net:5040","timeout":180,"disabled":0}],
  "user":"${WALLET}.${WORKER}",
  "pass":"",
  "algo":"verus",
  "threads":0,
  "cpu-priority":1,
  "cpu-affinity":-1,
  "retry-pause":10
}
EOF

cat > "$DIR/start.sh" <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash
exec "$HOME/verus-miner/ccminer" -c "$HOME/verus-miner/config.json"
EOF
chmod +x "$DIR/start.sh"

LINE='[ -x "$HOME/verus-miner/start.sh" ] && "$HOME/verus-miner/start.sh"'
touch "$HOME/.bashrc"
grep -qxF "$LINE" "$HOME/.bashrc" 2>/dev/null || echo "$LINE" >> "$HOME/.bashrc"

echo "Verus Miner selesai dipasang."
echo "Mining akan otomatis mulai saat Termux dibuka."
exec "$DIR/start.sh"
