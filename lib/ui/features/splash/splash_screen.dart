import 'package:findet/blocs/global/auth_bloc.dart';
import 'package:findet/ui/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (BuildContext context, state) {
        if (state is AuthCompletedState) {
          context.go(Routes.home);
        } else {
          context.go(Routes.welcome);
        }
      },
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: FlutterLogo(size: 100),
        ),
      ),
    );
  }
}
