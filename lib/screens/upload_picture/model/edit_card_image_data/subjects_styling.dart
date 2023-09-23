import 'package:equatable/equatable.dart';

class SubjectsStyling extends Equatable {
  final String? boxBackgroundColor;
  final String? fontColor;
  final String? fontSize;

  const SubjectsStyling({
    this.boxBackgroundColor,
    this.fontColor,
    this.fontSize,
  });

  factory SubjectsStyling.fromJson(Map<String, dynamic> json) {
    return SubjectsStyling(
      boxBackgroundColor: json['boxBackgroundColor'] as String?,
      fontColor: json['fontColor'] as String?,
      fontSize: json['fontSize'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'boxBackgroundColor': boxBackgroundColor,
        'fontColor': fontColor,
        'fontSize': fontSize,
      };

  @override
  List<Object?> get props => [boxBackgroundColor, fontColor, fontSize];
}
