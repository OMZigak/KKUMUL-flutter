import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kkumul/core/router/app_router.dart';
import 'package:kkumul/shared/widgets/theme/app_colors.dart';

void main() {
  runApp(const ProviderScope(child: KkumulApp()));
}

class KkumulApp extends StatelessWidget {
  const KkumulApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '꾸물꿈',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.mainColor,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: AppColors.white,
        fontFamily: 'Pretendard',
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
