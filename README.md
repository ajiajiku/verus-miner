# Verus Miner — Termux

Installer sederhana untuk menjalankan **ccminer VerusHash** pada Android ARM64 melalui Termux.

## Instalasi dari Termux baru

Setelah Termux selesai di-install, buka Termux lalu jalankan **3 perintah ini**:

```bash
pkg update -y && pkg install -y wget
wget -q --show-progress https://raw.githubusercontent.com/ajiajiku/verus-miner/main/install.sh -O install.sh
chmod +x install.sh && ./install.sh
```

Installer kemudian meminta:

```text
Wallet Verus:
Worker [android]:
```

Masukkan alamat wallet Verus Anda. Untuk Worker cukup tekan **Enter** jika ingin menggunakan nama `android`.

Setelah itu installer otomatis:

- memasang library yang diperlukan
- mengunduh ccminer ARM64
- menggunakan 8 thread CPU
- menggunakan CPU priority 1
- menggunakan CPU affinity -1 (tidak membatasi core)
- menggunakan pool SG-VIPOR (`sg.vipor.net:5040`)
- membuat konfigurasi mining
- membuat `start.sh`
- mengaktifkan mining otomatis ketika Termux dibuka kembali
- langsung menjalankan mining

## Setelah instalasi

Tidak perlu menjalankan perintah mining lagi. Setiap kali Termux dibuka, miner otomatis berjalan.

Untuk menghentikan mining:

```text
CTRL + C
```

Untuk menjalankan kembali secara manual:

```bash
~/verus-miner/start.sh
```

## File miner

```text
~/verus-miner/ccminer
~/verus-miner/config.json
~/verus-miner/start.sh
```

## Persyaratan

- Android 7.0 atau lebih baru
- Perangkat ARM64 / arm64-v8a
- Termux
- Internet
- Wallet Verus (VRSC)

Hashrate aktual bergantung pada CPU, suhu perangkat, thermal throttling, dan beban perangkat.

Binary ccminer ARM64 diambil saat instalasi dari upstream Darktron/pre-compiled.

Konfigurasi 8 thread, priority 1, affinity -1 dan SG-VIPOR dipilih untuk mereplikasi baseline setup ccminer yang sebelumnya digunakan dan terbukti berjalan baik pada perangkat pengujian.
