import 'package:equatable/equatable.dart';

class ActionIcons extends Equatable {
  final String? type;
  final String? backgroundColor;
  final String? iconColor;
  final String? alignment;

  const ActionIcons({
    this.type,
    this.backgroundColor,
    this.iconColor,
    this.alignment,
  });

  factory ActionIcons.fromJson(Map<String, dynamic> json) => ActionIcons(
        type: json['type'] as String?,
        backgroundColor: json['backgroundColor'] as String?,
        iconColor: json['iconColor'] as String?,
        alignment: json['alignment'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'backgroundColor': backgroundColor,
        'iconColor': iconColor,
        'alignment': alignment,
      };

  @override
  List<Object?> get props {
    return [
      type,
      backgroundColor,
      iconColor,
      alignment,
    ];
  }
}
