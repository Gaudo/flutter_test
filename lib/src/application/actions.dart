import 'package:freezed_annotation/freezed_annotation.dart';

part 'actions.freezed.dart';

@freezed
class SaAction with _$SaAction {
  const factory SaAction.loading() = SaLoading;
  const factory SaAction.error([String? message]) = SaErrorDetails;
}
