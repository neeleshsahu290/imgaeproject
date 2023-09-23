import 'package:equatable/equatable.dart';

import 'opacity.dart';

class ProfileDesignInfo extends Equatable {
  final Opacity? opacity;
  final String? designType;
  final String? errorTextColor;
  final String? primaryColor;
  final String? secondaryColor;
  final String? textColor;
  final String? profileBannerImageUrl;
  final String? baseColor;
  final bool? tint;

  const ProfileDesignInfo({
    this.opacity,
    this.designType,
    this.errorTextColor,
    this.primaryColor,
    this.secondaryColor,
    this.textColor,
    this.profileBannerImageUrl,
    this.baseColor,
    this.tint,
  });

  factory ProfileDesignInfo.fromJson(Map<String, dynamic> json) {
    return ProfileDesignInfo(
      opacity: json['opacity'] == null
          ? null
          : Opacity.fromJson(json['opacity'] as Map<String, dynamic>),
      designType: json['designType'] as String?,
      errorTextColor: json['errorTextColor'] as String?,
      primaryColor: json['primaryColor'] as String?,
      secondaryColor: json['secondaryColor'] as String?,
      textColor: json['textColor'] as String?,
      profileBannerImageUrl: json['profileBannerImageURL'] as String?,
      baseColor: json['baseColor'] as String?,
      tint: json['tint'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'opacity': opacity?.toJson(),
        'designType': designType,
        'errorTextColor': errorTextColor,
        'primaryColor': primaryColor,
        'secondaryColor': secondaryColor,
        'textColor': textColor,
        'profileBannerImageURL': profileBannerImageUrl,
        'baseColor': baseColor,
        'tint': tint,
      };

  @override
  List<Object?> get props {
    return [
      opacity,
      designType,
      errorTextColor,
      primaryColor,
      secondaryColor,
      textColor,
      profileBannerImageUrl,
      baseColor,
      tint,
    ];
  }
}
