import 'package:equatable/equatable.dart';

class BorderDetails extends Equatable {
  final String? type;
  final String? color;
  final String? thickness;

  const BorderDetails({this.type, this.color, this.thickness});

  factory BorderDetails.fromJson(Map<String, dynamic> json) => BorderDetails(
        type: json['type'] as String?,
        color: json['color'] as String?,
        thickness: json['thickness'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'color': color,
        'thickness': thickness,
      };

  @override
  List<Object?> get props => [type, color, thickness];
}
