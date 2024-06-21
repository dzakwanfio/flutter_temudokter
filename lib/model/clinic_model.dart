class ClinicModel {
  final int id;
  final String name;
  final String address;

  ClinicModel({
    required this.id,
    required this.name,
    required this.address,
  });

  // get clinics data by id
  static ClinicModel getClinicById(int id) {
    return clinicsData.firstWhere((clinic) => clinic.id == id);
  }

  static final List<ClinicModel> clinicsData = [
    ClinicModel(
      id: 1,
      name: 'Klinik Medicl Center',
      address: 'Jl.Kenjeran No.506, Kota SBY, Jawa Timur 60265',
    ),
    ClinicModel(
      id: 2,
      name: 'Klinik Tabita',
      address: 'Jl. Dharma Husada Indah No.26 Kota SBY, Jawa Timur 60244',
    ),
    ClinicModel(
      id: 3,
      name: 'Klinik Surya Medika',
      address: 'Jl. Mojo Klanggru Kota SBY, Jawa Timur 60272',
    ),
    ClinicModel(
      id: 4,
      name: 'Klinik Pratama',
      address: 'Jl. Wisma Permai Barat III Kota SBY, Jawa Timur 60272',
    ),
    ClinicModel(
      id: 5,
      name: 'Klinik Tong Fang',
      address: 'Jl. Mojo I No.10 Kota SBY, Jawa Timur 60226',
    )

  ];
}
