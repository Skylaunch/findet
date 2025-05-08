import 'package:findet/blocs/global/auth_bloc.dart';
import 'package:findet/blocs/global/theme_bloc.dart';
import 'package:findet/generated/l10n.dart';
import 'package:findet/helpers/global_data.dart';
import 'package:findet/ui/common/default_app_bar.dart';
import 'package:findet/ui/common/textfield_with_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = authService.getAuthUser();
    final colors = context.watch<ThemeBloc>().state.colors;

    return Scaffold(
      appBar: DefaultAppBar(title: S.of(context).your_profile_title),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
        child: Center(
          child: Column(
            children: [
              Image.asset('lib/assets/images/app/user_avatar.png'),
              const SizedBox(height: 5),
              Text(
                '${user!.firstName} ${user.lastName}',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(height: 10),
              TextFieldWithText(
                  text: S.of(context).firstname_title,
                  controller: _firstNameController),
              const SizedBox(height: 10),
              TextFieldWithText(
                  text: S.of(context).lastname_title,
                  controller: _lastNameController),
              const SizedBox(height: 10),
              TextFieldWithText(
                  text: S.of(context).email_title,
                  controller: _emailController),
              const SizedBox(height: 10),
              TextFieldWithText(
                  text: S.of(context).password_title,
                  controller: _passwordController,
                  withObscure: true),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    final newFirstName = _firstNameController.text;
                    final newLastName = _lastNameController.text;
                    final newEmail = _emailController.text;
                    final newPassword = _passwordController.text;

                    if (newFirstName.isEmpty &&
                        newLastName.isEmpty &&
                        newEmail.isEmpty &&
                        newPassword.isEmpty) {
                      toastService.showErrorToast(
                          message: S.of(context).zero_filled_fields_text,
                          context: context);
                    } else {
                      await datasource.changeUserData(
                        login: newEmail,
                        password: newPassword,
                        firstName: newFirstName,
                        lastName: newLastName,
                      );

                      _firstNameController.clear();
                      _lastNameController.clear();
                      _emailController.clear();
                      _passwordController.clear();

                      if (context.mounted) {
                        toastService.showDefaultToast(
                            message: S.of(context).data_was_updated_title,
                            context: context);

                        Navigator.pop(context);
                      }
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(colors.appPurple),
                    foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.white),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                  ),
                  child: Text(S.of(context).update),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  context.read<AuthBloc>().add(AuthLogout(context: context));
                },
                child: Text(
                  S.of(context).log_out,
                  style: TextStyle(
                      color: colors.appPurple,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
