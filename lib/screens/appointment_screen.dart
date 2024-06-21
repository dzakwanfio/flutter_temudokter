// ignore_for_file: prefer_const_constructors


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/model/dokter_model.dart';
import 'package:healthcare/model/review_data_model.dart';
import 'package:healthcare/screens/book_appointment_screen.dart';
import 'package:healthcare/screens/login_screen.dart';
import 'package:healthcare/screens/review_screen.dart';
import 'package:healthcare/services/authentication/auth_service.dart';
import 'package:healthcare/services/authentication/booking_service.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({
    super.key,
    required this.dokterModel,
  });

  final DokterModel dokterModel;

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  BookingService bookingService = BookingService();
  AuthService authService = AuthService();
  ImageProvider? fotoProfil = AssetImage("assets/images/profil.jpg");

  List<ReviewDataModel> doctorReviews = [];
  late List<ReviewDataModel> reviews = [];



  bool isLoading = false;

// get doctor review based on doctor id
  void getDoctorReviews(int doctorId) {
    bookingService.getDoctorReviews(doctorId).then((value) {
      for (var review in value.docs) {
        setState(() {
          reviews.add(ReviewDataModel(
            name: review['name'],
            image: review['image'],
            time: review['time'],
            rating: review['rating'],
            comment: review['comment'],
          ));
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getDoctorReviews(widget.dokterModel.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          bookingService.getDoctorReviewsById(widget.dokterModel.id.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        var data1 = null;

        data1 = snapshot.data!.docs;

        for (var a in data1) {
          // change Timestamp to day and month year format

          var time = a['time'].toDate();
          var formattedTime = DateFormat('dd MMMM yyyy').format(time);

          doctorReviews.add(ReviewDataModel(
            name: a['name'] ?? 'No name',
            image: a['image'] ?? 'default.png',
            time: formattedTime.toString(),
            rating: a['rating'].toString(),
            comment: a['comment'] ?? 'No comment',
          ));
        }

        // calculate all rating from all reviews
        double totalRating = 0;
        for (var review in doctorReviews) {
          totalRating += double.parse(review.rating) / doctorReviews.length;
        }

        
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 0, 74, 173),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage(
                                  "assets/images/${widget.dokterModel.image}"),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              widget.dokterModel.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              widget.dokterModel.specializations,
                              style: const TextStyle(
                                color: Colors.white60,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 0, 74, 173),
                                    shape: BoxShape.circle,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      String url =
                                          'https://api.whatsapp.com/send/?phone=6281336539269&text=Halo, saya ingin berkonsultasi dengan Anda&type=phone_number&app_absent=0';
                                      _launchURL(url);
                                    },
                                    child: const Icon(
                                      CupertinoIcons.chat_bubble_text_fill,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: MediaQuery.of(context).size.height / 0.9,
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 15,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text(
                        "About Doctor",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.dokterModel.description,
                        style: const TextStyle(
                            fontSize: 16, color: Colors.black54),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text(
                            "Reviews",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 10),
                          const Icon(Icons.star, color: Colors.amber),
                          Text(
                            // make it maks 1 decimal
                            totalRating.toStringAsFixed(1),
                            // widget.dokterModel.reviews[0].rating.isEmpty
                            //     ? "0"
                            //     : widget.dokterModel.reviews[0].rating,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "(${doctorReviews.length} reviews)",
                            style: TextStyle(color: Colors.black54),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReviewScreen(
                                    reviews: doctorReviews,
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              "See all",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 74, 173),
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 160,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: doctorReviews.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 1.4,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: CircleAvatar(
                                        radius: 25,
                                        backgroundImage:
                                            doctorReviews[index].image == ''
                                                ? fotoProfil
                                                : NetworkImage(
                                                    doctorReviews[index].image),
                                      ),
                                      title: Text(
                                        doctorReviews[index].name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Text(doctorReviews[index].time),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          Text(
                                            doctorReviews[index].rating,
                                            style: const TextStyle(
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        doctorReviews[index].comment,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Location",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      // get all clinic data from current doctor model
                      for (var clinic in widget.dokterModel.clinic)
                        ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Color(0xFFF0EEFA),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.location_on,
                              color: Color.fromARGB(255, 0, 74, 173),
                              size: 30,
                            ),
                          ),
                          title: Text(
                            clinic.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            clinic.address,
                          ),
                        ),

                      // ListTile(
                      //   leading: Container(
                      //     padding: const EdgeInsets.all(10),
                      //     decoration: const BoxDecoration(
                      //       color: Color(0xFFF0EEFA),
                      //       shape: BoxShape.circle,
                      //     ),
                      //     child: const Icon(
                      //       Icons.location_on,
                      //       color: Color.fromARGB(255, 0, 74, 173),
                      //       size: 30,
                      //     ),
                      //   ),
                      //   title: Text(
                      //     "Surabaya, Medical Center",
                      //     style: TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      //   subtitle: Text(
                      //     "Jl. Kenjeran No.506, Kalijudan, Kec. Mulyorejo, Kota SBY, Jawa Timur  60134",
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(15),
            height: 130,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Consultation price",
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      "Rp. ${widget.dokterModel.consultationFee.toString()}",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 9),
                InkWell(
                  onTap: () {
                    authService.isLoggedIn
                        ?
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookAppointmentScreen(
                          dokterModel: widget.dokterModel,
                        ), // Navigasi ke halaman baru
                      ),
                          )
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LoginScreen()), // Navigasi ke halaman login
                    );
                  },
                  

                  child: authService.isLoggedIn
                      ? Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 74, 173),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Book Appointment",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 0, 74, 173),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Login to Book Appointment",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Future<void> _launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
