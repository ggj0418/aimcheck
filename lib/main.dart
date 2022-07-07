import 'package:aimcheck/domain/auth/module/auth.module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  // stop splash screen until Future result will be returned
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await fetchData();

  /***
   * remove 를 runApp 앞에 작성하면 스플래시 화면이 Fade Out 되고 그 잔상이 1초 정도 지속되다가
   * 메인 화면으로 넘어가서 굉장히 부자연스럽다.
   */
  runApp(ModularApp(module: AuthModule(), child: AppWidget()));
  FlutterNativeSplash.remove();
}

class AppWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Smart App',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    ); //added by extension
  }
}

Future<void> fetchData() async {
  await Future.delayed(Duration(seconds: 2), () {});
}