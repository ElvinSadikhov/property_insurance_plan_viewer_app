// Dart imports:
// ignore_for_file: unnecessary_this

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

extension BuildContextExtension on BuildContext {
  T fromGetIt<T extends Object>() => this.read<GetIt>().get<T>();
}
