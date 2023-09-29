import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

  const ErrorMessageModel(
      {required this.statusCode,
      required this.statusMessage,
      required this.success});

  factory ErrorMessageModel.fromjson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        statusCode: json['statusCode'],
        statusMessage: json['statusMessage'],
        success: json['success'],
      );

  @override
  List<Object?> get props => [
        statusCode,
        statusMessage,
        success,
      ];
}
