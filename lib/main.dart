import 'package:datacraftz_mobile/constant/routes.dart';
import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/core/provider/auth_provider.dart';
import 'package:datacraftz_mobile/core/provider/page_switcher_provider.dart';
import 'package:datacraftz_mobile/core/provider/station_provider.dart';
import 'package:datacraftz_mobile/core/provider/user_schedule_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (context, child) {
        ScreenUtil.init(context);
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => PageIndexProvider()),
              ChangeNotifierProvider(create: (_) => AuthProvider()),
              ChangeNotifierProvider(create: (_) => StationProvider()),
              ChangeNotifierProvider(create: (_) => UserScheduleProvider()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: tittleApp,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: primaryColor,
                ),
                useMaterial3: true,
              ),
              initialRoute: '/',
              routes: routes,
            ),
          ),
        );
      },
    );
  }
}
