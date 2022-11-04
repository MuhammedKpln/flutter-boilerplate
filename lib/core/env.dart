// lib/env/env.dart
// ignore_for_file: constant_identifier_names, public_member_api_docs

import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {}
