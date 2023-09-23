import 'package:equatable/equatable.dart';

import 'action_icons.dart';
import 'custom_image_card_design_info.dart';
import 'location_styling.dart';
import 'profile_design_info.dart';
import 'title_styling.dart';
import 'user_name_styling.dart';

class CardDesignVariation extends Equatable {
  final UserNameStyling? userNameStyling;
  final TitleStyling? titleStyling;
  final LocationStyling? locationStyling;
  final ActionIcons? actionIcons;
  final ProfileDesignInfo? profileDesignInfo;
  final String? cardLongBgUrl;
  final String? cardDesignType;
  final CustomImageCardDesignInfo? customImageCardDesignInfo;
  final String? cardImageUrl4;
  final String? cardImageId;
  final String? cardImageUrl;

  const CardDesignVariation({
    this.userNameStyling,
    this.titleStyling,
    this.locationStyling,
    this.actionIcons,
    this.profileDesignInfo,
    this.cardLongBgUrl,
    this.cardDesignType,
    this.customImageCardDesignInfo,
    this.cardImageUrl4,
    this.cardImageId,
    this.cardImageUrl,
  });

  factory CardDesignVariation.fromJson(Map<String, dynamic> json) {
    return CardDesignVariation(
      userNameStyling: json['userNameStyling'] == null
          ? null
          : UserNameStyling.fromJson(
              json['userNameStyling'] as Map<String, dynamic>),
      titleStyling: json['titleStyling'] == null
          ? null
          : TitleStyling.fromJson(json['titleStyling'] as Map<String, dynamic>),
      locationStyling: json['locationStyling'] == null
          ? null
          : LocationStyling.fromJson(
              json['locationStyling'] as Map<String, dynamic>),
      actionIcons: json['actionIcons'] == null
          ? null
          : ActionIcons.fromJson(json['actionIcons'] as Map<String, dynamic>),
      profileDesignInfo: json['profileDesignInfo'] == null
          ? null
          : ProfileDesignInfo.fromJson(
              json['profileDesignInfo'] as Map<String, dynamic>),
      cardLongBgUrl: json['cardLongBgURL'] as String?,
      cardDesignType: json['cardDesignType'] as String?,
      customImageCardDesignInfo: json['customImageCardDesignInfo'] == null
          ? null
          : CustomImageCardDesignInfo.fromJson(
              json['customImageCardDesignInfo'] as Map<String, dynamic>),
      cardImageUrl4: json['cardImageURL4'] as String?,
      cardImageId: json['cardImageId'] as String?,
      cardImageUrl: json['cardImageURL'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'userNameStyling': userNameStyling?.toJson(),
        'titleStyling': titleStyling?.toJson(),
        'locationStyling': locationStyling?.toJson(),
        'actionIcons': actionIcons?.toJson(),
        'profileDesignInfo': profileDesignInfo?.toJson(),
        'cardLongBgURL': cardLongBgUrl,
        'cardDesignType': cardDesignType,
        'customImageCardDesignInfo': customImageCardDesignInfo?.toJson(),
        'cardImageURL4': cardImageUrl4,
        'cardImageId': cardImageId,
        'cardImageURL': cardImageUrl,
      };

  @override
  List<Object?> get props {
    return [
      userNameStyling,
      titleStyling,
      locationStyling,
      actionIcons,
      profileDesignInfo,
      cardLongBgUrl,
      cardDesignType,
      customImageCardDesignInfo,
      cardImageUrl4,
      cardImageId,
      cardImageUrl,
    ];
  }
}
