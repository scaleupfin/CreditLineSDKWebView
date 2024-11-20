import 'package:deynamic_update/provider/AppHomeDataProvider.dart';
import 'package:deynamic_update/provider/auth_provider.dart';
import 'package:deynamic_update/screen/onboarding/onboarding_screen.dart';
import 'package:deynamic_update/shared_preferences/shared_pref.dart';
import 'package:deynamic_update/utils/ConstentScreen.dart';
import 'package:deynamic_update/utils/firebase_options.dart';
import 'package:deynamic_update/utils/routes/routes.dart';
import 'package:deynamic_update/utils/routes/routes_names.dart';
import 'package:deynamic_update/utils/theme/theme_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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

 /* @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeModel, child) {
        bool? isShow= SharedPref.getBool(IS_show);
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: themeModel.currentTheme,
          initialRoute: SharedPref.getBool(IS_show)?RouteNames.login: RouteNames.onBoardingScreen,
          onGenerateRoute: Routes.generateRoutes,
        );
      },
    );
  }
*/
 /* @override
  Widget build(BuildContext context) {
    final bool isShow = SharedPref.getBool(IS_show) ?? false;

    return Consumer<ThemeModel>(
      builder: (context, themeModel, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: themeModel.currentTheme,
          initialRoute: isShow ? RouteNames.login : RouteNames.onBoardingScreen,
          onGenerateRoute: Routes.generateRoutes,
        );
      },
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool?>(
      future: SharedPref.getBoolFuture(IS_show), // Fetch the value asynchronously
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading preferences'));
        } else {
          final isShow = snapshot.data ?? false;
          return Consumer<ThemeModel>(
            builder: (context, themeModel, child) {
              return MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: themeModel.currentTheme,
                initialRoute: isShow
                    ? RouteNames.EmailScreen
                    : RouteNames.onBoardingScreen,
                onGenerateRoute: Routes.generateRoutes,
              );
            },
          );
        }
      },
    );
  }




}
