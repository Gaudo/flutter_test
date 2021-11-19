import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class SaState with _$SaState {
  const factory SaState(int value) = _SaState;
}
