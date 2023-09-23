import 'package:equatable/equatable.dart';

class TitleStyling extends Equatable {
  final String? fontSize;
  final String? alignment;
  final String? fontColor;
  final String? fontStyle;
  final String? fontWeight;

  const TitleStyling({
    this.fontSize,
    this.alignment,
    this.fontColor,
    this.fontStyle,
    this.fontWeight,
  });

  factory TitleStyling.fromJson(Map<String, dynamic> json) => TitleStyling(
        fontSize: json['fontSize'] as String?,
        alignment: json['alignment'] as String?,
        fontColor: json['fontColor'] as String?,
        fontStyle: json['fontStyle'] as String?,
        fontWeight: json['fontWeight'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'fontSize': fontSize,
        'alignment': alignment,
        'fontColor': fontColor,
        'fontStyle': fontStyle,
        'fontWeight': fontWeight,
      };

  @override
  List<Object?> get props {
    return [
      fontSize,
      alignment,
      fontColor,
      fontStyle,
      fontWeight,
    ];
  }
}
