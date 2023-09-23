import 'package:equatable/equatable.dart';

class CustomImageCardDesignInfo extends Equatable {
  final String? primaryColor;
  final String? profileBannerImageUrl;

  const CustomImageCardDesignInfo({
    this.primaryColor,
    this.profileBannerImageUrl,
  });

  factory CustomImageCardDesignInfo.fromJson(Map<String, dynamic> json) {
    return CustomImageCardDesignInfo(
      primaryColor: json['primaryColor'] as String?,
      profileBannerImageUrl: json['profileBannerImageURL'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'primaryColor': primaryColor,
        'profileBannerImageURL': profileBannerImageUrl,
      };

  @override
  List<Object?> get props => [primaryColor, profileBannerImageUrl];
}
