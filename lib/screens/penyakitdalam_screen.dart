import 'package:flutter/material.dart';
import 'package:healthcare/model/dokter_model.dart';
import 'package:healthcare/screens/appointment_screen.dart';

class PenyakitDalamScreen extends StatelessWidget {
  PenyakitDalamScreen({Key? key}) : super(key: key);

  // Data dokter
  final List<Doctor> doctors = [
    Doctor(
      name: 'Dr. David Smith',
      image: 'assets/images/doctor3.jpg',
    ),
    Doctor(
      name: 'Dr. Soparter',
      image: 'assets/images/doctor7.jpg',
    ),
    Doctor(
      name: 'Dr. Indra Khasanah',
      image: 'assets/images/doctor11.jpg',
    ),
    // Tambahkan data dokter lainnya sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text('Penyakit Dalam'),
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
                  if (doctor.name == 'Dr. David Smith') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppointmentScreen(
                          dokterModel: DokterModel.dataDokter[2],
                        ),
                      ),
                    );
                  } else if (doctor.name == 'Dr. Soparter') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppointmentScreen(
                          dokterModel: DokterModel.dataDokter[6],
                        ),
                      ),
                    );
                    // Navigasi ke halaman lain sesuai dengan spesialisasi lainnya
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppointmentScreen(
                          dokterModel: DokterModel.dataDokter[10],
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
