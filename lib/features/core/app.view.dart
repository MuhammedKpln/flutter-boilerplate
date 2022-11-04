import 'package:boilerplate/core/constants/core.dart';
import 'package:boilerplate/core/di/di.dart';
import 'package:boilerplate/router/router.dart';
import 'package:boilerplate/services/app.service.dart';
import 'package:boilerplate/services/auth.service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

/// `App`
class App extends StatefulWidget {
  // ignore: public_member_api_docs
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final authService = getIt<AuthService>();

  @override
  void initState() {
    super.initState();
    authService.checkLoginState();
  }

  @override
  Widget build(BuildContext context) {
    final goRouter = getIt<AppRouter>().router;
    final appService = getIt<AppService>();

    return Observer(
      builder: (context) {
        return MaterialApp.router(
          title: CoreConstants.appTitle,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: appService.theme.themeData,
          themeMode: appService.theme.mode,
          routerConfig: goRouter,
        );
      },
    );
  }
}
