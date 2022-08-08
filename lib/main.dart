import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:school_system/src/autenticacao/pages/autenticacao_page/autenticacao_page.dart';
import 'package:school_system/src/injection/injection.dart';

void main(){
  // reading  injections dependencies
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();

  return runApp(MaterialApp(
    home:const AutenticacaoPage(),
    debugShowCheckedModeBanner: false,
    builder: locator.get<OneContext>().builder,
    navigatorKey: locator.get<OneContext>().key,
   ));
}