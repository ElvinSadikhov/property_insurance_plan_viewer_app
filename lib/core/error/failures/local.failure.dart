// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:property_insurance_plan_viewer_app/core/error/failures/failure.dart';
import 'package:property_insurance_plan_viewer_app/core/translations/locale_keys.g.dart';

/// Used as failure happened in app
class LocalFailure extends Failure {
  const LocalFailure(super.msg);

  factory LocalFailure.withDefaultMsg() => LocalFailure(LocaleKeys.error_somethingWentWrong.tr());
}
