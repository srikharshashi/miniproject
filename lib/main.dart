import 'package:flutter/material.dart';
import 'package:miniproject1/env.dart';
import 'package:miniproject1/router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: Constants.url,
    anonKey: Constants.anonKey,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
