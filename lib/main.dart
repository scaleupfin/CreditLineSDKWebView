import 'package:deynamic_update/provider/AppHomeDataProvider.dart';
import 'package:deynamic_update/provider/auth_provider.dart';
import 'package:deynamic_update/screen/onboarding/onboarding_screen.dart';
import 'package:deynamic_update/utils/theme/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeModel>(create: (_) => ThemeModel()),
        ChangeNotifierProvider<AppHomeDataProvider>(create: (_) => AppHomeDataProvider()),
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ],
      child: const MyWebApp(),
    ),
  );
}

class MyWebApp extends StatelessWidget {
  const MyWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeModel, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: themeModel.currentTheme,
          home: const OnBoardingScreen(),
        );
      },
    );
  }
}
