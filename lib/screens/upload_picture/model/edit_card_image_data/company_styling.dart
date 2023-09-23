import 'package:equatable/equatable.dart';

class CompanyStyling extends Equatable {
  final String? fontSize;
  final String? alignment;
  final String? fontColor;
  final String? fontStyle;
  final String? fontWeight;
  final String? companyDesignationFontSize;
  final String? companyDesignationFontColor;
  final String? companyDesignationFontStyle;
  final String? companyDesignationFontWeight;

  const CompanyStyling({
    this.fontSize,
    this.alignment,
    this.fontColor,
    this.fontStyle,
    this.fontWeight,
    this.companyDesignationFontSize,
    this.companyDesignationFontColor,
    this.companyDesignationFontStyle,
    this.companyDesignationFontWeight,
  });

  factory CompanyStyling.fromJson(Map<String, dynamic> json) {
    return CompanyStyling(
      fontSize: json['fontSize'] as String?,
      alignment: json['alignment'] as String?,
      fontColor: json['fontColor'] as String?,
      fontStyle: json['fontStyle'] as String?,
      fontWeight: json['fontWeight'] as String?,
      companyDesignationFontSize: json['companyDesignationFontSize'] as String?,
      companyDesignationFontColor:
          json['companyDesignationFontColor'] as String?,
      companyDesignationFontStyle:
          json['companyDesignationFontStyle'] as String?,
      companyDesignationFontWeight:
          json['companyDesignationFontWeight'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'fontSize': fontSize,
        'alignment': alignment,
        'fontColor': fontColor,
        'fontStyle': fontStyle,
        'fontWeight': fontWeight,
        'companyDesignationFontSize': companyDesignationFontSize,
        'companyDesignationFontColor': companyDesignationFontColor,
        'companyDesignationFontStyle': companyDesignationFontStyle,
        'companyDesignationFontWeight': companyDesignationFontWeight,
      };

  @override
  List<Object?> get props {
    return [
      fontSize,
      alignment,
      fontColor,
      fontStyle,
      fontWeight,
      companyDesignationFontSize,
      companyDesignationFontColor,
      companyDesignationFontStyle,
      companyDesignationFontWeight,
    ];
  }
}
