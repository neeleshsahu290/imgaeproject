import 'package:equatable/equatable.dart';

import 'border_details.dart';

class DpStyling extends Equatable {
  final String? borderPresent;
  final BorderDetails? borderDetails;
  final String? alignment;

  const DpStyling({this.borderPresent, this.borderDetails, this.alignment});

  factory DpStyling.fromJson(Map<String, dynamic> json) => DpStyling(
        borderPresent: json['borderPresent'] as String?,
        borderDetails: json['borderDetails'] == null
            ? null
            : BorderDetails.fromJson(
                json['borderDetails'] as Map<String, dynamic>),
        alignment: json['alignment'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'borderPresent': borderPresent,
        'borderDetails': borderDetails?.toJson(),
        'alignment': alignment,
      };

  @override
  List<Object?> get props => [borderPresent, borderDetails, alignment];
}
