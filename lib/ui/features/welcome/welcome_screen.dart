import 'package:findet/blocs/global/theme_bloc.dart';
import 'package:findet/generated/l10n.dart';
import 'package:findet/ui/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.watch<ThemeBloc>().state.colors;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'lib/assets/images/app/welcome.png',
                  ),
                  const SizedBox(height: 24),
                  Text(
                    S.of(context).welcome_to_app,
                    style: TextStyle(fontSize: 18, color: colors.appSecondaryPurple),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    S.of(context).welcome_to_app_description,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: colors.secondaryColor),
                  ),
                ],
              ),
              Positioned(
                bottom: 36,
                right: 18,
                child: SizedBox(
                  width: 150,
                  height: 44,
                  child: OutlinedButton(
                    onPressed: () {
                      context.go(Routes.auth);
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(colors.appPurple),
                      shape: WidgetStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        S.of(context).continue_title,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
