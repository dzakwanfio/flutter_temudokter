import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OnlineVisitScreen extends StatelessWidget {
  OnlineVisitScreen({Key? key}) : super(key: key);

  // Data dokter
  final List<Doctor> doctors = [
    Doctor(
        name: 'Dr. Abigail',
        specialization: 'Spesialis Kulit & Kelamin',
        image: 'assets/images/doctor1.jpg',
        phoneNumber: '6281336539269'),
    Doctor(
        name: 'Dr. Akira',
        specialization: 'Spesialis Mata',
        image: 'assets/images/doctor2.jpg',
        phoneNumber: '081336539269'),
    Doctor(
        name: 'Dr. David Smith',
        specialization: 'Spesialis Penyakit Dalam',
        image: 'assets/images/doctor3.jpg',
        phoneNumber: '081336539269'),
    Doctor(
        name: 'Dr. Hans Muller',
        specialization: 'Spesialis THT',
        image: 'assets/images/doctor4.jpg',
        phoneNumber: '081336539269'),
    Doctor(
        name: 'Dr. Makmuri',
        specialization: 'Spesialis Kulit & Kelamin',
        image: 'assets/images/doctor5.jpg',
        phoneNumber: '081336539269'),
    Doctor(
        name: 'Dr. Dewi Indah',
        specialization: 'Spesialis Mata',
        image: 'assets/images/doctor6.jpg',
        phoneNumber: '081336539269'),
    Doctor(
        name: 'Dr. Soparter',
        specialization: 'Spesialis Penyakit Dalam',
        image: 'assets/images/doctor7.jpg',
        phoneNumber: '081336539269'),
    Doctor(
        name: 'Dr. Partono',
        specialization: 'Spesialis THT',
        image: 'assets/images/doctor8.jpg',
        phoneNumber: '081336539269'),
    Doctor(
        name: 'Dr. Sanjaya',
        specialization: 'Spesialis Kulit & Kelamin',
        image: 'assets/images/doctor9.jpg',
        phoneNumber: '081336539269'),
    Doctor(
        name: 'Dr. Tom Albert',
        specialization: 'Spesialis Mata',
        image: 'assets/images/doctor10.jpg',
        phoneNumber: '081336539269'),
    Doctor(
        name: 'Dr. Indra Khasanah',
        specialization: 'Spesialis Penyakit Dalam',
        image: 'assets/images/doctor11.jpg',
        phoneNumber: '081336539269'),
    Doctor(
        name: 'Dr. Aufa Izmi',
        specialization: 'Spesialis THT',
        image: 'assets/images/doctor12.jpg',
        phoneNumber: '081336539269'),
    // Tambahkan data dokter lainnya sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text('Online Visit'),
        backgroundColor: const Color.fromARGB(255, 0, 74, 173),
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
            child: Card(
              color:
                  Color.fromARGB(255, 0, 74, 173), // Warna latar belakang biru
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(doctor.image),
                ),
                title: Text(doctor.name), textColor: Colors.white,
                subtitle:
                    Text(doctor.specialization), // Menampilkan spesialisasi
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.message,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Menggunakan URL untuk membuka WhatsApp
                        String url =
                            'https://api.whatsapp.com/send/?phone=${doctor.phoneNumber}&text=Halo, saya ingin berkonsultasi dengan Anda&type=phone_number&app_absent=0';
                        _launchURL(url);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Model data dokter
class Doctor {
  final String name;
  final String specialization;
  final String image;
  final String phoneNumber; // Tambahkan field ini

  Doctor({
    required this.name,
    required this.specialization,
    required this.image,
    required this.phoneNumber, // Tambahkan parameter ini
  });
}

Future<void> _launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
