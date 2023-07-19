import 'package:chat_app_clone/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:chat_app_clone/core/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    // TODO: Replace credentials with your own
    url: 'https://fqvbbqadsgaxuywntniz.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZxdmJicWFkc2dheHV5d250bml6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODkxMzQzMDYsImV4cCI6MjAwNDcxMDMwNn0.C4VEloIebpcHuL9M-qXtvoPEnv29IjcW1ZYoH2jpz_Y',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Chat App',
      theme: appTheme,
      home: const SplashPage(),
    );
  }
}
