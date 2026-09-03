# Verus Miner

Installer sederhana untuk menjalankan **ccminer VerusHash** di Termux pada perangkat Android ARM64.

Repository ini mengunduh binary `ccminer` ARM64 dari upstream Darktron saat proses instalasi, lalu membuat konfigurasi mining secara otomatis.

## 1. Persyaratan

- Android **7.0 atau lebih baru**
- Perangkat **ARM64 / arm64-v8a**
- Koneksi internet
- Wallet Verus (VRSC)
- Termux dari sumber resmi

> **Penting:** Jangan mencampur Termux dari sumber yang berbeda. Jika sebelumnya memasang Termux dari sumber lain, hapus Termux terlebih dahulu sebelum memasang versi dari sumber baru. Aplikasi dan plugin Termux dari sumber berbeda menggunakan signature yang berbeda.

## 2. Install Termux

Gunakan salah satu sumber resmi berikut:

### Pilihan yang disarankan: F-Droid

Buka halaman Termux di F-Droid dan install aplikasi **Termux**.

https://f-droid.org/en/packages/com.termux/

### Alternatif: GitHub resmi Termux

https://github.com/termux/termux-app/releases

Untuk Android 7 atau lebih baru, pilih varian **apt-android-7** jika tersedia.

> Setelah Termux terpasang, buka Termux dan lanjutkan ke langkah berikutnya.

## 3. Persiapan pertama Termux

Jalankan perintah berikut satu per satu:

```sh
pkg update -y
pkg upgrade -y
pkg install -y wget
```

Jika Termux menanyakan konfirmasi, pilih `y` lalu tekan **Enter**.

## 4. Download installer Verus Miner

Jalankan:

```sh
wget -O install.sh https://raw.githubusercontent.com/ajiajiku/verus-miner/main/install.sh
```

Kemudian buat installer dapat dijalankan:

```sh
chmod +x install.sh
```

## 5. Jalankan instalasi

Jalankan:

```sh
./install.sh
```

Installer akan otomatis:

1. Memperbarui package Termux.
2. Memasang library yang diperlukan.
3. Mengunduh binary `ccminer` ARM64.
4. Mendeteksi jumlah core/thread CPU perangkat.
5. Membuat `config.json`.
6. Meminta alamat wallet Verus.
7. Meminta nama worker.
8. Membuat `start.sh`.
9. Mengaktifkan mining otomatis ketika Termux dibuka.
10. Langsung menjalankan miner setelah instalasi selesai.

## 6. Saat diminta Wallet dan Worker

Installer akan menampilkan:

```text
Wallet Verus:
Worker [android]:
```

Masukkan alamat wallet Verus Anda, kemudian nama worker.

Contoh:

```text
Wallet Verus: Rxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Worker [android]: hp1
```

Jika nama worker dikosongkan, otomatis digunakan nama `android`.

## 7. Setelah instalasi selesai

Miner akan langsung berjalan dan menampilkan proses seperti:

```text
accepted: 24/24
3147.02 kH/s yes!
```

Hashrate dapat berubah-ubah karena beban CPU, suhu perangkat, throttling, dan kondisi perangkat.

**Jangan menilai hashrate hanya dari satu baris.** Biarkan miner berjalan beberapa menit untuk melihat performa yang lebih stabil.

## 8. Mining otomatis saat Termux dibuka

Installer menambahkan perintah startup ke `~/.bashrc`.

Setelah instalasi selesai, setiap kali Termux dibuka, miner akan otomatis dijalankan.

Untuk menghentikan mining, tekan:

```text
CTRL + C
```

## 9. Lokasi file miner

Semua file miner berada di:

```text
~/verus-miner/
```

File utama:

```text
~/verus-miner/ccminer
~/verus-miner/config.json
~/verus-miner/start.sh
```

Untuk menjalankan miner secara manual:

```sh
~/verus-miner/start.sh
```

## 10. Cek konfigurasi

Untuk melihat konfigurasi:

```sh
cat ~/verus-miner/config.json
```

Untuk melihat jumlah thread CPU yang tersedia:

```sh
nproc
```

## 11. Catatan performa

Versi installer ini menggunakan seluruh thread CPU yang dilaporkan oleh `nproc`.

Hashrate VerusHash sangat bergantung pada model CPU, jumlah core, suhu, governor CPU, thermal throttling, dan beban perangkat lain. Karena itu hasil antar perangkat dapat berbeda.

Mining terus-menerus juga dapat meningkatkan suhu, konsumsi baterai, dan keausan baterai/perangkat.

## Upstream

Binary `ccminer` ARM64 yang digunakan berasal dari:

https://github.com/Darktron/pre-compiled

Repository ini hanya menyediakan installer dan konfigurasi yang lebih sederhana untuk penggunaan di Termux.

Gunakan software ini dengan risiko Anda sendiri.
