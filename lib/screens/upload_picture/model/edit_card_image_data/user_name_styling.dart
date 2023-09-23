import 'package:equatable/equatable.dart';

class UserNameStyling extends Equatable {
  final String? noOfLines;
  final String? fontSize;
  final String? alignment;
  final String? fontColor;
  final String? fontStyle;
  final String? fontWeight;

  const UserNameStyling({
    this.noOfLines,
    this.fontSize,
    this.alignment,
    this.fontColor,
    this.fontStyle,
    this.fontWeight,
  });

  factory UserNameStyling.fromJson(Map<String, dynamic> json) {
    return UserNameStyling(
      noOfLines: json['noOfLines'] as String?,
      fontSize: json['fontSize'] as String?,
      alignment: json['alignment'] as String?,
      fontColor: json['fontColor'] as String?,
      fontStyle: json['fontStyle'] as String?,
      fontWeight: json['fontWeight'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'noOfLines': noOfLines,
        'fontSize': fontSize,
        'alignment': alignment,
        'fontColor': fontColor,
        'fontStyle': fontStyle,
        'fontWeight': fontWeight,
      };

  @override
  List<Object?> get props {
    return [
      noOfLines,
      fontSize,
      alignment,
      fontColor,
      fontStyle,
      fontWeight,
    ];
  }
}
