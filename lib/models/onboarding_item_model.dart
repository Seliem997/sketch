class OnBoardingItemsModel {
  final String image;
  final String textTitle;
  final String textBody;
  final double? height, width;

  OnBoardingItemsModel({
    this.height,
    this.width,
    required this.image,
    required this.textTitle,
    required this.textBody,
  });
}
