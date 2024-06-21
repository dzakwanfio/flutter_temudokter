import 'package:healthcare/model/clinic_model.dart';
import 'package:healthcare/model/review_data_model.dart';

class DokterModel {
  final int id;
  final String name;
  final String image;
  final String symptoms;
  final String specializations;
  final String description;
  final String address;
  List<ClinicModel> clinic = [];
  List<ReviewDataModel> reviews = [];
  double consultationFee = 0.0;

  DokterModel({
    required this.id,
    required this.name,
    required this.image,
    required this.symptoms,
    required this.specializations,
    required this.description,
    required this.address,
    required this.clinic,
    required this.reviews,
    required this.consultationFee,
  });

  // get dataDokter by id
  static DokterModel getDokterById(int id) {
    return dataDokter.firstWhere((dokter) => dokter.id == id);
  }

  static final List<DokterModel> dataDokter = [
    DokterModel(
      id: 1,
      name: 'Dr. Abigail',
      image: "doctor1.jpg",
      symptoms: "Kulit & Kelamin",
      specializations: "Spesialis Kulit & Kelamin",
      description:
          'Telah berpengalaman selama 15 tahun dalam mengatasi penyakit, terutama di spesialis kulit dan kelamin',
      address:
          "Jl. Kenjeran No.506, Kalijudan, Kec. Mulyorejo, Kota SBY, Jawa Timur  60134",
      consultationFee: 100000.0,
      clinic: [
        ClinicModel.clinicsData[0],
        ClinicModel.clinicsData[1],
      ],
      reviews: ReviewDataModel.reviewDataModel,
    ),
    DokterModel(
      id: 2,
      name: "Dr. Akira",
      image: "doctor2.jpg",
      symptoms: "Mata",
      specializations: "Spesialis Mata",
      description:
          'Telah berpengalaman selama 10 tahun dalam mengatasi penyakit, terutama di spesialis mata',
      address:
          "Jl. Kenjeran No.506, Kalijudan, Kec. Mulyorejo, Kota SBY, Jawa Timur  60134",
      consultationFee: 150000.0,
      clinic: [ClinicModel.clinicsData[2], ClinicModel.clinicsData[3]],
      reviews: ReviewDataModel.reviewDataModel,

    ),
    DokterModel(
      id: 3,
      name: 'Dr. David Smith',
      image: "doctor3.jpg",
      symptoms: "Penyakit Dalam",
      specializations: "Spesialis Penyakit Dalam",
      description:
          'Telah berpengalaman selama 16 tahun dalam mengatasi penyakit, terutama di spesialis penyakit dalam',
      address:
          "Jl. Kenjeran No.506, Kalijudan, Kec. Mulyorejo, Kota SBY, Jawa Timur  60134",
      consultationFee: 200000.0,
      clinic: [
        ClinicModel.clinicsData[2],
        ClinicModel.clinicsData[1],
      ],
      reviews: ReviewDataModel.reviewDataModel,
    ),
    DokterModel(
      id: 4,
      name: "Dr. Hans Muller",
      image: "doctor4.jpg",
      symptoms: "THT",
      specializations: "Spesialis THT",
      description:
          'Telah berpengalaman selama 20 tahun dalam mengatasi penyakit, terutama di spesialis THT',
      address:
          "Jl. Kenjeran No.506, Kalijudan, Kec. Mulyorejo, Kota SBY, Jawa Timur  60134",
      consultationFee: 250000.0,
      clinic: [ClinicModel.clinicsData[3], ClinicModel.clinicsData[1]],
      reviews: ReviewDataModel.reviewDataModel,
    ),
    DokterModel(
      id: 5,
      name: 'Dr. Makmuri',
      image: "doctor5.jpg",
      symptoms: "Kulit & Kelamin",
      specializations: "Spesialis Kulit & Kelamin",
      description:
          'Telah berpengalaman selama 15 tahun dalam mengatasi penyakit, terutama di spesialis kulit dan kelamin',
      address:
          "Jl. Kenjeran No.506, Kalijudan, Kec. Mulyorejo, Kota SBY, Jawa Timur  60134",
      consultationFee: 300000.0,
      clinic: ClinicModel.clinicsData,
      reviews: ReviewDataModel.reviewDataModel,
    ),
    DokterModel(
      id: 6,
      name: "Dr. Dewi Indah",
      image: "doctor6.jpg",
      symptoms: "Mata",
      specializations: "Spesialis Mata",
      description:
          'Telah berpengalaman selama 10 tahun dalam mengatasi penyakit, terutama di spesialis mata',
      address:
          "Jl. Kenjeran No.506, Kalijudan, Kec. Mulyorejo, Kota SBY, Jawa Timur  60134",
      consultationFee: 350000.0,
      clinic: ClinicModel.clinicsData,
      reviews: ReviewDataModel.reviewDataModel,
    ),
    DokterModel(
      id: 7,
      name: 'Dr. Soparter',
      image: "doctor7.jpg",
      symptoms: "Penyakit Dalam",
      specializations: "Spesialis Penyakit Dalam",
      description:
          'Telah berpengalaman selama 16 tahun dalam mengatasi penyakit, terutama di spesialis penyakit dalam',
      address:
          "Jl. Kenjeran No.506, Kalijudan, Kec. Mulyorejo, Kota SBY, Jawa Timur  60134",
      consultationFee: 400000.0,
      clinic: ClinicModel.clinicsData,
      reviews: ReviewDataModel.reviewDataModel,
    ),
    DokterModel(
      id: 8,
      name: "Dr. Partono",
      image: "doctor8.jpg",
      symptoms: "THT",
      specializations: "Spesialis THT",
      description:
          'Telah berpengalaman selama 20 tahun dalam mengatasi penyakit, terutama di spesialis THT',
      address:
          "Jl. Kenjeran No.506, Kalijudan, Kec. Mulyorejo, Kota SBY, Jawa Timur  60134",
      consultationFee: 450000.0,
      clinic: ClinicModel.clinicsData,
      reviews: ReviewDataModel.reviewDataModel,
    ),
    DokterModel(
      id: 8,
      name: 'Dr. Sanjaya',
      image: "doctor9.jpg",
      symptoms: "Kulit & Kelamin",
      specializations: "Spesialis Kulit & Kelamin",
      description:
          'Telah berpengalaman selama 15 tahun dalam mengatasi penyakit, terutama di spesialis kulit dan kelamin',
      address:
          "Jl. Kenjeran No.506, Kalijudan, Kec. Mulyorejo, Kota SBY, Jawa Timur  60134",
      consultationFee: 500000.0,
      clinic: ClinicModel.clinicsData,
      reviews: ReviewDataModel.reviewDataModel,
    ),
    DokterModel(
      id: 10,
      name: "Dr. Tom Albert",
      image: "doctor10.jpg",
      symptoms: "Mata",
      specializations: "Spesialis Mata",
      description:
          'Telah berpengalaman selama 10 tahun dalam mengatasi penyakit, terutama di spesialis mata',
      address:
          "Jl. Kenjeran No.506, Kalijudan, Kec. Mulyorejo, Kota SBY, Jawa Timur  60134",
      consultationFee: 550000.0,
      clinic: ClinicModel.clinicsData,
      reviews: ReviewDataModel.reviewDataModel,
    ),
    DokterModel(
      id: 11,
      name: 'Dr. Indra Khasanah',
      image: "doctor11.jpg",
      symptoms: "Penyakit Dalam",
      specializations: "Spesialis Penyakit Dalam",
      description:
          'Telah berpengalaman selama 16 tahun dalam mengatasi penyakit, terutama di spesialis penyakit dalam',
      address:
          "Jl. Kenjeran No.506, Kalijudan, Kec. Mulyorejo, Kota SBY, Jawa Timur  60134",
      consultationFee: 600000.0,
      clinic: ClinicModel.clinicsData,
      reviews: ReviewDataModel.reviewDataModel,
    ),
    DokterModel(
      id: 12,
      name: "Dr. Aufa Izmi",
      image: "doctor12.jpg",
      symptoms: "THT",
      specializations: "Spesialis THT",
      description:
          'Telah berpengalaman selama 20 tahun dalam mengatasi penyakit, terutama di spesialis THT',
      address:
          "Jl. Kenjeran No.506, Kalijudan, Kec. Mulyorejo, Kota SBY, Jawa Timur  60134",
      consultationFee: 650000.0,
      clinic: ClinicModel.clinicsData,
      reviews: ReviewDataModel.reviewDataModel,
    ),
  ];
}

List<String> symptoms = [
  "Kulit & Kelamin",
  "Mata",
  "Penyakit Dalam",
  "THT",
  "Kulit & Kelamin",
  "Mata",
  "Penyakit Dalam",
  "THT",
  "Kulit & Kelamin",
  "Mata",
  "Penyakit Dalam",
  "THT",
];

List<String> imgs = [
  "doctor1.jpg",
  "doctor2.jpg",
  "doctor3.jpg",
  "doctor4.jpg",
  "doctor5.jpg",
  "doctor6.jpg",
  "doctor7.jpg",
  "doctor8.jpg",
  "doctor9.jpg",
  "doctor10.jpg",
  "doctor11.jpg",
  "doctor12.jpg",
];

List<String> doctors = [
  "Dr. Abigail",
  "Dr. Akira",
  "Dr. David Smith",
  "Dr. Hans Muller",
  "Dr. Makmuri",
  "Dr. Dewi Indah",
  "Dr. Soparter",
  "Dr. Partono",
  "Dr. Sanjaya",
  "Dr. Tom Albert",
  "Dr. Indra Khasanah",
  "Dr. Aufa Izmi",
];

List<String> specializations = [
  "Spesialis Kulit & Kelamin",
  "Spesialis Mata",
  "Spesialis Penyakit Dalam",
  "Spesialis THT",
  "Spesialis Kulit & Kelamin",
  "Spesialis Mata",
  "Spesialis Penyakit Dalam",
  "Spesialis THT",
  "Spesialis Kulit & Kelamin",
  "Spesialis Mata",
  "Spesialis Penyakit Dalam",
  "Spesialis THT",
];
