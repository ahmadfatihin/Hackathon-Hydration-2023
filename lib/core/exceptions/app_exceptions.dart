import 'package:equatable/equatable.dart';

abstract class AppException extends Equatable implements Exception {
  final String code;
  final String message;

  const AppException({required this.code, required this.message});

  @override
  List<Object> get props => [code, message];
}

class DefaultAppException extends AppException {
  const DefaultAppException({
    String message = '',
    String code = 'DEFAULT_APP_EXCEPTION',
  }) : super(message: message, code: code);
}

class InternetConnectionException extends AppException {
  const InternetConnectionException({
    String message = 'INTERNET_CONNECTION_ERROR',
    String code = 'INTERNET_CONNECTION_EXCEPTION',
  }) : super(message: message, code: code);
}

class ServerException extends AppException {
  const ServerException({
    String message = 'SERVER_ERROR',
    String code = 'SERVER_EXCEPTION',
  }) : super(message: message, code: code);
}

class LocalStorageException extends AppException {
  const LocalStorageException({
    String message = 'LOCAL_STORAGE_ERROR',
    String code = 'LOCAL_STORAGE_EXCEPTION',
  }) : super(message: message, code: code);
}
