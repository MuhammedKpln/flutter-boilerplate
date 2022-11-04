import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.model.freezed.dart';
part 'auth.model.g.dart';

@freezed
// ignore: public_member_api_docs
class AuthLoginArgs with _$AuthLoginArgs {
  // ignore: public_member_api_docs
  factory AuthLoginArgs({
    required String username,
    required String password,
  }) = _AuthLoginArgs;

  // ignore: public_member_api_docs
  factory AuthLoginArgs.fromJson(Map<String, dynamic> json) =>
      _$AuthLoginArgsFromJson(json);
}
