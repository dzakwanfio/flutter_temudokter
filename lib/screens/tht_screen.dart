import 'package:flutter/material.dart';
import 'package:healthcare/model/dokter_model.dart';
import 'package:healthcare/screens/appointment_screen.dart';

class THTScreen extends StatelessWidget {
  THTScreen({Key? key}) : super(key: key);

  // Data dokter
  final List<Doctor> doctors = [
    Doctor(
      name: 'Dr. Hans Muller',
      image: 'assets/images/doctor4.jpg',
    ),
    Doctor(
      name: 'Dr. Partono',
      image: 'assets/images/doctor8.jpg',
    ),
    Doctor(
      name: 'Dr. Aufa Izmi',
      image: 'assets/images/doctor12.jpg',
    ),
    // Tambahkan data dokter lainnya sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text('THT'),
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
                  if (doctor.name == 'Dr. Hans Muller') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppointmentScreen(
                          dokterModel: DokterModel.dataDokter[3],
                        ),
                      ),
                    );
                  } else if (doctor.name == 'Dr. Partono') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppointmentScreen(
                          dokterModel: DokterModel.dataDokter[7],
                        ),
                      ),
                    );
                    // Navigasi ke halaman lain sesuai dengan spesialisasi lainnya
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppointmentScreen(
                          dokterModel: DokterModel.dataDokter[11],
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
