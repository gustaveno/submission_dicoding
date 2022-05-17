class DataPlant {
  String name;
  String description;
  String price;
  String location;
  String image;

  DataPlant({
    required this.name,
    required this.description,
    required this.price,
    required this.location,
    required this.image,
  });
}

var plantList = [
  DataPlant(
    name: 'Farm House',
    description:
        'Berada di jalur utama Bandung-Lembang, Farm House menjadi objek wisata yang tidak pernah sepi pengunjung. Selain karena letaknya strategis, kawasan ini juga menghadirkan nuansa wisata khas Eropa. Semua itu diterapkan dalam bentuk spot swafoto Instagramable.',
    price: 'Rp 30.000',
    location: 'Lembang',
    image: 'images/gambar1.jpg',
  ),
  DataPlant(
    name: 'Stone Garden',
    description:
        'Stone Garden atau Taman Batu di Padalarang – Bandung ini adalah nama untuk apa yang akan kita lihat jika berada di sana. Hamparan batu yang artistik membuat kita merasa tidak sedang berada di Bandung. Hamparan batu bukan terhampar begitu saja di atas tanah luas yang menjadi permukaannya.',
    price: 'Rp 15.000',
    location: 'Padalarang',
    image: 'images/gambar2.jpg',
  ),
  DataPlant(
    name: 'Kawah Putih',
    description:
        'Kawah Putih adalah tempat wisata di Bandung yang paling terkenal. Berlokasi di Ciwidey, Jawa Barat, kurang lebih sekitar 50 KM arah selatan kota Bandung, Kawah Putih adalah sebuah danau yang terbentuk akibat dari letusan Gunung Patuha.',
    price: 'Rp 40.000',
    location: 'Ciwidey',
    image: 'images/gambar3.jpg',
  ),
  DataPlant(
    name: 'Museum Geologi',
    description:
        'Museum Geologi didirikan pada tanggal 16 Mei 1929. Museum ini telah direnovasi dengan dana bantuan dari JICA (Japan International Cooperation Agency). Dalam Museum ini, tersimpan dan dikelola materi-materi geologi yang berlimpah, seperti fosil, batuan, mineral.',
    price: 'Rp 3.000',
    location: 'Kota Bandung',
    image: 'images/gambar4.jpg',
  ),
];
