class DataModel {
  final String displayName;
  final String createdAt;

  final String updatedAt;
  final String displayContent;

  final String displayPicture;
  final String caption;

  DataModel(
      {required this.displayName,
      required this.createdAt,
      required this.updatedAt,
      required this.displayPicture,
      required this.caption,
      required this.displayContent});
  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        caption: json['caption'],
        createdAt: json['createdAt'],
        displayName: json['display_name'],
        updatedAt: json['updatedAt'],
        displayPicture: json['display_picture'],
        displayContent: json['display_content'],
      );
}
