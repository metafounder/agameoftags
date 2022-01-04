abstract class Failure {
  static FailureResponse handle(Failure failure) {
    if (failure is UserFailure) {
      return FailureResponse(message: failure.getUserFailureMessage());
    }

    return FailureResponse(message: "oops, something went wrong");
  }
}

class FailureResponse {
  final String message;
  final String? redirectingRoute;

  FailureResponse({required this.message, this.redirectingRoute});
}

class AppFailure extends Failure {
  final String _message;

  String getAppFailureMessage() {
    return _message;
  }

  AppFailure(this._message);
}

class ServerFailure extends Failure {
  final String _message;

  String getServerFailureMessage() {
    return _message;
  }

  ServerFailure(this._message);
}

class UserFailure extends Failure {
  final String _message;

  String getUserFailureMessage() {
    return _message;
  }

  UserFailure(this._message);
}
