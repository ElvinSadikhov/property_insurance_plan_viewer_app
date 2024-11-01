// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:either_dart/either.dart';

// Project imports:
import 'package:property_insurance_plan_viewer_app/core/error/failures/failure.dart';
import 'package:property_insurance_plan_viewer_app/core/error/failures/local.failure.dart';

abstract class BaseNotifier<T> with ChangeNotifier {
  bool _isLoading = false;
  Either<Failure, T>? _resp;

  /// Tries to get data from [usecase], handles exceptions.
  /// 
  /// Sets the result to [_resp]!
  /// 
  /// Can use [oldResp] to access the previous response.
  Future<Either<Failure, T>> getResponse(FutureOr<T> Function(Either<Failure, T>? oldResp) usecase, {void Function(Failure failure)? onFailure}) async {
    _isLoading = true;
    final oldResp = _resp;
    _resp = null;
    notifyListeners();

    try {
      _resp = Right(await usecase(oldResp));
    } catch (e) {
      _resp = Left(LocalFailure.withDefaultMsg());
    }
    if (_resp?.isLeft ?? false) {
      onFailure?.call(_resp!.left);
    }

    _isLoading = false;
    notifyListeners();

    return _resp!;
  }

  bool get isLoading => _isLoading;
  bool get hasData => _resp is Right<Failure, T>;
  bool get hasFailed => _resp is Left<Failure, T>;
  
  Either<Failure, T>? get resp => _resp;
  T? get data => hasData ? (_resp as Right<Failure, T>).right : null;
}
