import 'package:equatable/equatable.dart';

class HobbiesStyling extends Equatable {
  final String? boxBackgroundColor;
  final String? fontColor;
  final String? fontSize;

  const HobbiesStyling({
    this.boxBackgroundColor,
    this.fontColor,
    this.fontSize,
  });

  factory HobbiesStyling.fromJson(Map<String, dynamic> json) {
    return HobbiesStyling(
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
