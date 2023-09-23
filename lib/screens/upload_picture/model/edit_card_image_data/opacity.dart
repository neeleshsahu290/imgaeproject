import 'package:equatable/equatable.dart';

class Opacity extends Equatable {
  final String? primary;
  final String? secondary;

  const Opacity({this.primary, this.secondary});

  factory Opacity.fromJson(Map<String, dynamic> json) => Opacity(
        primary: json['primary'] as String?,
        secondary: json['secondary'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'primary': primary,
        'secondary': secondary,
      };

  @override
  List<Object?> get props => [primary, secondary];
}
