import 'package:flutter/material.dart';

class ClinicVisitScreen extends StatelessWidget {
  ClinicVisitScreen({Key? key}) : super(key: key);

  // Data klinik
  final List<Clinic> clinics = [
    Clinic(
      name: 'Klinik Medical Center',
      address: 'Jl. Kenjeran No.506',
      image: 'assets/images/klinik5.jpeg',
    ),
    Clinic(
      name: 'Klinik Tabita',
      address: 'Jl. Raya Dharma Husada Indah No.26',
      image: 'assets/images/klinik1.jpeg',
    ),
    Clinic(
      name: 'Klinik Surya Medika',
      address: 'Jl. Mojo Klanggru Wetan IV No.181',
      image: 'assets/images/klinik2.jpeg',
    ),
    Clinic(
      name: 'Klinik Pratama',
      address: 'Jl. Wisma Permai Barat III Blok FP No.12',
      image: 'assets/images/klinik3.jpeg',
    ),
    Clinic(
      name: 'Klinik Tong Fang',
      address: 'Jl. Mojo I No.10',
      image: 'assets/images/klinik4.jpeg',
    ),
    // Tambahkan data klinik lainnya sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text('Clinic Visit'),
        backgroundColor: const Color.fromARGB(255, 0, 74, 173),
      ),
      body: ListView.builder(
        itemCount: clinics.length,
        itemBuilder: (context, index) {
          final clinic = clinics[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
            child: Card(
              color:
                  Color.fromARGB(255, 0, 74, 173), // Warna latar belakang biru
              child: ListTile(
                leading: Image.asset(
                  clinic.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  clinic.name,
                  style: TextStyle(color: Colors.white), // Warna teks putih
                ),
                subtitle: Text(
                  clinic.address,
                  style: TextStyle(color: Colors.white), // Warna teks putih
                ),
                onTap: () {
                  // Aksi ketika item klinik diklik
                  // Misalnya: Navigasi ke halaman detail klinik
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

// Model data klinik
class Clinic {
  final String name;
  final String address;
  final String image;

  Clinic({
    required this.name,
    required this.address,
    required this.image,
  });
}
