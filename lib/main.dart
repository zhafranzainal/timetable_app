import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timetable_app/screens/onboarding_screen.dart';

const supabaseUrl = 'https://djkvxcfdhzuvddqcxxlg.supabase.co';
final supabaseKey = dotenv.env['SUPABASE_KEY'];

Future<void> main() async {
  await dotenv.load();
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey!,
  );

  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timetable Planning App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}
