import 'package:aimcheck/domain/auth/page/auth.page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => AuthPage()),
    ChildRoute('/second', child: (context, args) => SecondPage()),
  ];
}