import 'package:equatable/equatable.dart';

class SkillsStyling extends Equatable {
  final String? boxBackgroundColor;
  final String? fontColor;
  final String? fontSize;

  const SkillsStyling({
    this.boxBackgroundColor,
    this.fontColor,
    this.fontSize,
  });

  factory SkillsStyling.fromJson(Map<String, dynamic> json) => SkillsStyling(
        boxBackgroundColor: json['boxBackgroundColor'] as String?,
        fontColor: json['fontColor'] as String?,
        fontSize: json['fontSize'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'boxBackgroundColor': boxBackgroundColor,
        'fontColor': fontColor,
        'fontSize': fontSize,
      };

  @override
  List<Object?> get props => [boxBackgroundColor, fontColor, fontSize];
}
