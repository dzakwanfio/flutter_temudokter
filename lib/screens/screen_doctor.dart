import 'package:flutter/material.dart';

class DoctorDetailScreen extends StatelessWidget {
  final String img;
  final String doctorName;
  final String specialization;

  const DoctorDetailScreen({
    super.key,
    required this.img,
    required this.doctorName,
    required this.specialization,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doctorName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("images/$img"),
            ),
            const SizedBox(height: 20),
            Text(
              doctorName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              specialization,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
