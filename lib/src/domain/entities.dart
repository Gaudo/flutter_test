import 'package:freezed_annotation/freezed_annotation.dart';

part 'entities.freezed.dart';

@freezed
class SaUser with _$SaUser {
  const factory SaUser(String name, {int? age}) = _SaUser;
}
