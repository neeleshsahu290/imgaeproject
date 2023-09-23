import 'package:equatable/equatable.dart';

import 'action_icons.dart';
import 'address_styling.dart';
import 'card_design_variation.dart';
import 'company_styling.dart';
import 'custom_image_card_design_info.dart';
import 'dp_styling.dart';
import 'email_styling.dart';
import 'hobbies_styling.dart';
import 'location_styling.dart';
import 'phone_styling.dart';
import 'profile_design_info.dart';
import 'skills_styling.dart';
import 'subjects_styling.dart';
import 'title_styling.dart';
import 'user_name_styling.dart';

class Result extends Equatable {
  final List<CardDesignVariation>? cardDesignVariations;
  final String? cardImageId;
  final String? cardShortBgUrl;
  final String? cardLongBgUrl;
  final String? cardImageUrl;
  final String? cardImageUrl2;
  final String? cardImageUrl3;
  final String? cardImageUrl4;
  final String? categoryId;
  final String? cardName;
  final String? errorTextColor;
  final String? cardDesignType;
  final CustomImageCardDesignInfo? customImageCardDesignInfo;
  final ProfileDesignInfo? profileDesignInfo;
  final DpStyling? dpStyling;
  final UserNameStyling? userNameStyling;
  final TitleStyling? titleStyling;
  final LocationStyling? locationStyling;
  final CompanyStyling? companyStyling;
  final SkillsStyling? skillsStyling;
  final HobbiesStyling? hobbiesStyling;
  final SubjectsStyling? subjectsStyling;
  final PhoneStyling? phoneStyling;
  final EmailStyling? emailStyling;
  final AddressStyling? addressStyling;
  final ActionIcons? actionIcons;
  final bool? favouriteStatus;

  const Result({
    this.cardDesignVariations,
    this.cardImageId,
    this.cardShortBgUrl,
    this.cardLongBgUrl,
    this.cardImageUrl,
    this.cardImageUrl2,
    this.cardImageUrl3,
    this.cardImageUrl4,
    this.categoryId,
    this.cardName,
    this.errorTextColor,
    this.cardDesignType,
    this.customImageCardDesignInfo,
    this.profileDesignInfo,
    this.dpStyling,
    this.userNameStyling,
    this.titleStyling,
    this.locationStyling,
    this.companyStyling,
    this.skillsStyling,
    this.hobbiesStyling,
    this.subjectsStyling,
    this.phoneStyling,
    this.emailStyling,
    this.addressStyling,
    this.actionIcons,
    this.favouriteStatus,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        cardDesignVariations: (json['cardDesignVariations'] as List<dynamic>?)
            ?.map(
                (e) => CardDesignVariation.fromJson(e as Map<String, dynamic>))
            .toList(),
        cardImageId: json['cardImageId'] as String?,
        cardShortBgUrl: json['cardShortBgURL'] as String?,
        cardLongBgUrl: json['cardLongBgURL'] as String?,
        cardImageUrl: json['cardImageURL'] as String?,
        cardImageUrl2: json['cardImageURL2'] as String?,
        cardImageUrl3: json['cardImageURL3'] as String?,
        cardImageUrl4: json['cardImageURL4'] as String?,
        categoryId: json['categoryId'] as String?,
        cardName: json['cardName'] as String?,
        errorTextColor: json['errorTextColor'] as String?,
        cardDesignType: json['cardDesignType'] as String?,
        customImageCardDesignInfo: json['customImageCardDesignInfo'] == null
            ? null
            : CustomImageCardDesignInfo.fromJson(
                json['customImageCardDesignInfo'] as Map<String, dynamic>),
        profileDesignInfo: json['profileDesignInfo'] == null
            ? null
            : ProfileDesignInfo.fromJson(
                json['profileDesignInfo'] as Map<String, dynamic>),
        dpStyling: json['dpStyling'] == null
            ? null
            : DpStyling.fromJson(json['dpStyling'] as Map<String, dynamic>),
        userNameStyling: json['userNameStyling'] == null
            ? null
            : UserNameStyling.fromJson(
                json['userNameStyling'] as Map<String, dynamic>),
        titleStyling: json['titleStyling'] == null
            ? null
            : TitleStyling.fromJson(
                json['titleStyling'] as Map<String, dynamic>),
        locationStyling: json['locationStyling'] == null
            ? null
            : LocationStyling.fromJson(
                json['locationStyling'] as Map<String, dynamic>),
        companyStyling: json['companyStyling'] == null
            ? null
            : CompanyStyling.fromJson(
                json['companyStyling'] as Map<String, dynamic>),
        skillsStyling: json['skillsStyling'] == null
            ? null
            : SkillsStyling.fromJson(
                json['skillsStyling'] as Map<String, dynamic>),
        hobbiesStyling: json['hobbiesStyling'] == null
            ? null
            : HobbiesStyling.fromJson(
                json['hobbiesStyling'] as Map<String, dynamic>),
        subjectsStyling: json['subjectsStyling'] == null
            ? null
            : SubjectsStyling.fromJson(
                json['subjectsStyling'] as Map<String, dynamic>),
        phoneStyling: json['phoneStyling'] == null
            ? null
            : PhoneStyling.fromJson(
                json['phoneStyling'] as Map<String, dynamic>),
        emailStyling: json['emailStyling'] == null
            ? null
            : EmailStyling.fromJson(
                json['emailStyling'] as Map<String, dynamic>),
        addressStyling: json['addressStyling'] == null
            ? null
            : AddressStyling.fromJson(
                json['addressStyling'] as Map<String, dynamic>),
        actionIcons: json['actionIcons'] == null
            ? null
            : ActionIcons.fromJson(json['actionIcons'] as Map<String, dynamic>),
        favouriteStatus: json['favouriteStatus'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'cardDesignVariations':
            cardDesignVariations?.map((e) => e.toJson()).toList(),
        'cardImageId': cardImageId,
        'cardShortBgURL': cardShortBgUrl,
        'cardLongBgURL': cardLongBgUrl,
        'cardImageURL': cardImageUrl,
        'cardImageURL2': cardImageUrl2,
        'cardImageURL3': cardImageUrl3,
        'cardImageURL4': cardImageUrl4,
        'categoryId': categoryId,
        'cardName': cardName,
        'errorTextColor': errorTextColor,
        'cardDesignType': cardDesignType,
        'customImageCardDesignInfo': customImageCardDesignInfo?.toJson(),
        'profileDesignInfo': profileDesignInfo?.toJson(),
        'dpStyling': dpStyling?.toJson(),
        'userNameStyling': userNameStyling?.toJson(),
        'titleStyling': titleStyling?.toJson(),
        'locationStyling': locationStyling?.toJson(),
        'companyStyling': companyStyling?.toJson(),
        'skillsStyling': skillsStyling?.toJson(),
        'hobbiesStyling': hobbiesStyling?.toJson(),
        'subjectsStyling': subjectsStyling?.toJson(),
        'phoneStyling': phoneStyling?.toJson(),
        'emailStyling': emailStyling?.toJson(),
        'addressStyling': addressStyling?.toJson(),
        'actionIcons': actionIcons?.toJson(),
        'favouriteStatus': favouriteStatus,
      };

  @override
  List<Object?> get props {
    return [
      cardDesignVariations,
      cardImageId,
      cardShortBgUrl,
      cardLongBgUrl,
      cardImageUrl,
      cardImageUrl2,
      cardImageUrl3,
      cardImageUrl4,
      categoryId,
      cardName,
      errorTextColor,
      cardDesignType,
      customImageCardDesignInfo,
      profileDesignInfo,
      dpStyling,
      userNameStyling,
      titleStyling,
      locationStyling,
      companyStyling,
      skillsStyling,
      hobbiesStyling,
      subjectsStyling,
      phoneStyling,
      emailStyling,
      addressStyling,
      actionIcons,
      favouriteStatus,
    ];
  }
}
