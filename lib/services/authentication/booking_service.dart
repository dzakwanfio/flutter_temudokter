import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthcare/services/authentication/auth_service.dart';

class BookingService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  AuthService _authService = AuthService();

  // add appointment to user's appointment list
  Future<void> addAppointment(
      int doctorId, int clinicId, DateTime date, String hour) async {
    try {
      // add to user's appointment collection
      DocumentReference docRef = await _firestore
          .collection('Users')
          .doc(_auth.currentUser!.email)
          .collection('appointments')
          .add({
        'doctorId': doctorId,
        'clinicId': clinicId,
        'date': date,
        'status': true,
        'hour': hour,
      });

      // get the appointment id
      String appointmentId = docRef.id;

      // add to appointment collection and use same uid
      await _firestore.collection('appointments').doc(appointmentId).set({
        'doctorId': doctorId,
        'clinicId': clinicId,
        'date': date,
        'status': true,
        'userEmail': _auth.currentUser!.email,
        'hour': hour,
      });
    } catch (e) {
      throw e;
    }
  }

  // get user nama from user collection

  // add review on appointment collection
  Future<void> addReview(String review, String appointmentId, int rating,
      String doctorId, String username) async {
    try {
      await _firestore.collection('appointments').doc(appointmentId).update({
        'review': review,
        'rating': rating,
        'status': false,
      });
      await _firestore
          .collection('Users')
          .doc(_auth.currentUser!.email)
          .collection('appointments')
          .doc(appointmentId)
          .update({
        'review': review,
        'rating': rating,
      });

      // add reviews to doctor collection then docctor reviews colelction
      await _firestore
          .collection('doctors')
          .doc(doctorId)
          .collection('reviews')
          .add({
        'name': _auth.currentUser!.displayName,
        'image': _auth.currentUser!.photoURL,
        'time': DateTime.now(),
        'rating': rating,
        'comment': review,
      });
    } catch (e) {
      throw (e);
    }
  }

  // get doctor review from appointment collection by doctor id
  Future<QuerySnapshot> getDoctorReview(int doctorId) async {
    try {
      return await _firestore
          .collection('appointments')
          .where('doctorId', isEqualTo: doctorId)
          .where('status', isEqualTo: false)
          .get();
    } catch (e) {
      throw e;
    }
  }

  // get doctor reviews
  Future<QuerySnapshot> getDoctorReviews(int doctorId) async {
    try {
      var data = await _firestore
          .collection('appointments')
          .where('doctorId', isEqualTo: doctorId)
          .where('status', isEqualTo: false)
          .get();
      return data;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  // get status true schedule from user's appointment list
  Future<QuerySnapshot> getUpcomingAppointments() async {
    try {
      return await _firestore
          .collection('Users')
          .doc(_auth.currentUser!.email)
          .collection('appointments')
          .where('status', isEqualTo: true)
          .get();
    } catch (e) {
      throw e;
    }
  }

  // get status false schedule from user's appointment list
  Future<QuerySnapshot> getCompletedAppointments() async {
    try {
      return await _firestore
          .collection('Users')
          .doc(_auth.currentUser!.email)
          .collection('appointments')
          .where('status', isEqualTo: false)
          .get();
    } catch (e) {
      throw e;
    }
  }

  // set status true to false
  Future<void> cancelAppointment(String appointmentId) async {
    try {
      await _firestore
          .collection('Users')
          .doc(_auth.currentUser!.email)
          .collection('appointments')
          .doc(appointmentId)
          .update({
        'status': false,
      });
      await _firestore.collection('appointments').doc(appointmentId).update({
        'status': false,
      });
    } catch (e) {
      throw e;
    }
  }

  // set status true to false but done the appointment
  Future<void> completeAppointment(String appointmentId) async {
    try {
      await _firestore
          .collection('Users')
          .doc(_auth.currentUser!.email)
          .collection('appointments')
          .doc(appointmentId)
          .update({
        'status': false,
      });
      await _firestore.collection('appointments').doc(appointmentId).update({
        'status': false,
      });
    } catch (e) {
      throw e;
    }
  }

  // get all doctors reviews by id on doctor collections
  Future<QuerySnapshot> getDoctorReviewsById(String doctorId) async {
    try {
      return await _firestore
          .collection('doctors')
          .doc(doctorId)
          .collection('reviews')
          .get();
    } catch (e) {
      throw e;
    }
  }

  // stream builder get all doctors all reviews
  Stream<QuerySnapshot> getDoctorReviewsStream(String doctorId) {
    return _firestore
        .collection('doctors')
        .doc(doctorId)
        .collection('reviews')
        .snapshots();
  }
}
