import 'package:equatable/equatable.dart';

import 'result.dart';

class EditCardImageData extends Equatable {
  final bool? success;
  final bool? isAuth;
  final String? message;
  final List<Result>? result;

  const EditCardImageData({
    this.success,
    this.isAuth,
    this.message,
    this.result,
  });

  factory EditCardImageData.fromJson(Map<String, dynamic> json) {
    return EditCardImageData(
      success: json['success'] as bool?,
      isAuth: json['isAuth'] as bool?,
      message: json['message'] as String?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'isAuth': isAuth,
        'message': message,
        'result': result?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [success, isAuth, message, result];
}
