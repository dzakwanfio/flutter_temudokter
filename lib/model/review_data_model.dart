class ReviewDataModel {
  final String name;
  final String image;
  final String time;
  final String rating;
  final String comment;

  ReviewDataModel({
    required this.name,
    required this.image,
    required this.time,
    required this.rating,
    required this.comment,
  });

  static final List<ReviewDataModel> reviewDataModel = [
    ReviewDataModel(
      name: 'Dr. Abigail',
      image: "doctor1.jpg",
      time: '1 day ago',
      rating: '4.9',
      comment: 'Pelayanan yang sangat memuaskan',
    ),
    ReviewDataModel(
      name: "Dr. Akira",
      image: "doctor2.jpg",
      time: '2 day ago',
      rating: '4.7',
      comment: 'Pelayanan yang sangat ramah',
    ),
    ReviewDataModel(
      name: 'Dr. David Smith',
      image: "doctor3.jpg",
      time: '3 day ago',
      rating: '4.6',
      comment: 'Pelayanan yang sangat nyaman',
    ),
    ReviewDataModel(
      name: "Dr. Hans Müller",
      image: "doctor4.jpg",
      time: '4 day ago',
      rating: '5.0',
      comment: 'Pelayanan yang sangat santuy',
    ),
  ];
}
