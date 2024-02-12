class Buku {
  final String judul;
  final String penerbit;
  final String halaman;
  final String bahasa;
  final String foto;
  final String deskripsi;
  final String kategori;
  final int id;

  Buku({
    required this.judul,
    required this.penerbit,
    required this.halaman,
    required this.bahasa,
    required this.foto,
    required this.deskripsi,
    required this.kategori,
    required this.id,
  });

  // Define a factory constructor to parse JSON data into a Buku object
  factory Buku.fromJson(Map<String, dynamic> json) {
    return Buku(
      judul: json['judul'] ?? '',
      penerbit: json['penerbit'] ?? '',
      halaman: json['halaman'] ?? '',
      bahasa: json['bahasa'] ?? '',
      foto: json['foto'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
      kategori: json['kategori'] ?? '',
      id: json['id'] ?? 0,
    );
  }
}
