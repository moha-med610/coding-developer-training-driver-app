abstract class Failure {
  final String message;

  Failure({required this.message});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
}

class BadRequestFailure extends Failure {
  BadRequestFailure({required super.message});
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure({required super.message});
}

class NotFoundFailure extends Failure {
  NotFoundFailure({required super.message});
}

class ConflictFailure extends Failure {
  ConflictFailure({required super.message});
}

class InternalServerErrorFailure extends Failure {
  InternalServerErrorFailure({required super.message});
}

class UnknownFailure extends Failure {
  UnknownFailure({required super.message});
}

class NoInternetFailure extends Failure {
  NoInternetFailure({required super.message});
}
