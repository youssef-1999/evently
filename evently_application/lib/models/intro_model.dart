class IntroModel {
  final String image;
  final String darkImage;
  final String title;
  final String? subtitle;

  const IntroModel({
    required this.image,
    required this.darkImage,
    required this.title,
    this.subtitle,
  });
}
