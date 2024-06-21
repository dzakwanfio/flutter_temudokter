import 'package:flutter/material.dart';
import 'package:healthcare/model/dokter_model.dart';
import 'package:healthcare/screens/appointment_screen.dart';

class KulitKelaminScreen extends StatelessWidget {
  KulitKelaminScreen({Key? key}) : super(key: key);

  // Data dokter
  final List<Doctor> doctors = [
    Doctor(
      name: 'Dr. Abigail',
      image: 'assets/images/doctor1.jpg',
    ),
    Doctor(
      name: 'Dr. Makmuri',
      image: 'assets/images/doctor5.jpg',
    ),
    Doctor(
      name: 'Dr. Sanjaya',
      image: 'assets/images/doctor9.jpg',
    ),
    // Tambahkan data dokter lainnya sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text('Kulit & Kelamin'),
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
              child: InkWell(
                onTap: () {
                  if (doctor.name == 'Dr. Abigail') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppointmentScreen(
                          dokterModel: DokterModel.dataDokter[0],
                        ),
                      ),
                    );
                  } else if (doctor.name == 'Dr. Makmuri') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppointmentScreen(
                          dokterModel: DokterModel.dataDokter[4],
                        ),
                      ),
                    );
                    // Navigasi ke halaman lain sesuai dengan spesialisasi lainnya
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppointmentScreen(
                          dokterModel: DokterModel.dataDokter[8],
                        ),
                      ),
                    );
                    // Tambahkan kondisi lainnya sesuai kebutuhan
                  }
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(doctor.image),
                  ),
                  title: Text(doctor.name),
                  textColor: Colors.white,
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
  final String image;

  Doctor({
    required this.name,
    required this.image,
  });
}
