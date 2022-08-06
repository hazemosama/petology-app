import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology/cubits/app_cubit/app_cubit.dart';
import 'package:petology/network/end_points.dart';
import 'package:petology/network/local/cache_helper.dart';
import 'package:petology/network/remote/block_observer.dart';
import 'package:petology/network/remote/dio_helper.dart';
import 'package:petology/screens/adoption_screen.dart';
import 'package:petology/screens/help_screen.dart';
import 'package:petology/screens/home_layout.dart';
import 'package:petology/screens/kind_screen.dart';
import 'package:petology/screens/login_screen.dart';
import 'package:petology/screens/signup_screen.dart';
import 'package:petology/themes/themes.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async
{


  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  await CacheHelper.init();
  DioHelper.init();
  token = CacheHelper.getData(key: 'token') ?? '';
  refreshToken = CacheHelper.getData(key: 'refresh_token') ?? '';

  if (kDebugMode) {
    print('access:$token');
  }
  if (kDebugMode) {
    print('refresh:$refreshToken');
  }
  BlocOverrides.runZoned(
    () {
      runApp(
        const Petology(),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}

class Petology extends StatelessWidget {
  const Petology({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()..getPets(),
        )
      ],
      child: MaterialApp(
        title: 'Petology',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        builder: (context, child) => ResponsiveWrapper.builder(
          child,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.autoScale(390, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
          ],
        ),
        routes: {
          HelpScreen.routeName: (context) => HelpScreen(),
          KindScreen.routeName: (context) => const KindScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          SignupScreen.routeName: (context) => SignupScreen(),
          HomeLayout.routeName: (context) => const HomeLayout(),
          AdoptionScreen.routeName: (context) => AdoptionScreen(),
        },
        initialRoute:token!=''? HomeLayout.routeName:LoginScreen.routeName,
        //LoginScreen.routeName
      ),
    );
  }
}
