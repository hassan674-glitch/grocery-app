import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:grocery_app/app_ui/AuthPage/FaceBookAndGoogleLogin/facebook_and_google_login.dart';
import 'package:grocery_app/app_ui/AuthPage/SplashScreen/splash_screen_bindings.dart';
import 'package:grocery_app/app_ui/Explore/explorer_ui.dart';
import 'package:grocery_app/firebase_options.dart';
import 'package:grocery_app/routes/app_pages.dart';
import 'package:grocery_app/routes/app_routes.dart';
import 'app_ui/MainScreen/main_screen_bindings.dart';
import 'app_ui/MapPage/map_page.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 780), 
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child){
        return GetMaterialApp(
          initialRoute: AppRoutes.splashPage,
        getPages: AppPages.list,
        initialBinding:SplashScreenBidings(),
        debugShowCheckedModeBanner: false,
      );
      }
    );
  }
}

