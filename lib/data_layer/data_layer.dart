class DataLayer {
  static List<TipesAdviceDataModel> tips = <TipesAdviceDataModel>[
    TipesAdviceDataModel(
        imageUrl: 'assets/images/a1.png', advice: 'call hospital'),
    TipesAdviceDataModel(
        imageUrl: 'assets/images/a2.png', advice: 'a stay at home'),
    TipesAdviceDataModel(
        imageUrl: 'assets/images/a3.png', advice: 'dont touch'),
    TipesAdviceDataModel(
        imageUrl: 'assets/images/a4.png', advice: 'using sub mask'),
    TipesAdviceDataModel(imageUrl: 'assets/images/a6.png', advice: 'using gel'),
    TipesAdviceDataModel(
        imageUrl: 'assets/images/a8.png', advice: 'saving spaces'),
    TipesAdviceDataModel(
        imageUrl: 'assets/images/a10.png', advice: 'waching you hand'),
  ];
  static final symptomsDiseaseData = <String>[
    'Fever',
    'Dry Cough',
    'Headache',
    'Breathless',
  ];
}

class TipesAdviceDataModel {
  final String imageUrl;
  final String advice;

  TipesAdviceDataModel({
    required this.imageUrl,
    required this.advice,
  });
}
