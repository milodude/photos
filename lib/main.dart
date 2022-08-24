import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greisy_photos/features/landing_page/presentation/bloc/photo/photo_bloc.dart';

import 'app_module.dart';
import 'features/photo_details/presentation/bloc/photo_details/photo_details_bloc.dart';
import 'features/user_profile/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  await di.init();
  runApp(ModularApp(module: AppModule(), child: const AppState()));
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PhotoBloc>(create: (_) => sl<PhotoBloc>()),
        BlocProvider<PhotoDetailsBloc>(create: (_) => sl<PhotoDetailsBloc>()),
        BlocProvider<UserProfileBloc>(create: (_) => sl<UserProfileBloc>()),
      ],
      child: const PhotoApp(),
    );
  }
}

class PhotoApp extends StatelessWidget {
  const PhotoApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        textTheme: GoogleFonts.josefinSansTextTheme(),
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
