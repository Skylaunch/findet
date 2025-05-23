import 'package:findet/blocs/global/theme_bloc.dart';
import 'package:findet/generated/l10n.dart';
import 'package:findet/helpers/global_data.dart';
import 'package:flutter/material.dart';
import 'package:findet/helpers/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  void initState() {
    super.initState();

    authService.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = authService.authUser;
    final colors = context.watch<ThemeBloc>().state.colors;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        height: 66,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: colors.menuItemBG,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                width: 40,
                height: 40,
                'lib/assets/images/app/user_avatar.png',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${user!.firstName} ${user.lastName}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    S.of(context).profile_page_title,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ).padding(
                edgeInsets: const EdgeInsets.all(12),
              ),
              const Spacer(),
              Stack(
                children: [
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                          color: colors.primaryBlueColor, width: 1.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Center(
                        child: Text(
                          S.of(context).edit,
                          style: TextStyle(
                            color: colors.primaryBlueColor,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
