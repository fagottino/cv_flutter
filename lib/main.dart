import 'package:flutter/material.dart';

import 'core/di/app_bloc_provider.dart';
import 'core/di/app_repository_provider.dart';
import 'feature/home/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRepositoryProvider(
      child: AppBlocProvider(
        child: MaterialApp(
          title: 'CV - Antonio Orlando',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
