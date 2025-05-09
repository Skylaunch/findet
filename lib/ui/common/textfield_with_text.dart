import 'package:findet/blocs/global/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldWithText extends StatefulWidget {
  const TextFieldWithText({
    super.key,
    required this.controller,
    required this.text,
    this.withObscure = false,
  });

  final TextEditingController controller;
  final String text;
  final bool withObscure;

  @override
  State<TextFieldWithText> createState() => _TextFieldWithTextState();
}

class _TextFieldWithTextState extends State<TextFieldWithText> {
  bool _isTextObscured = true;

  @override
  Widget build(BuildContext context) {
    final colors = context.watch<ThemeBloc>().state.colors;
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            widget.text,
            style: TextStyle(
              color: colors.appPurple,
              fontSize: 16,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: colors.defaultBlack),
          controller: widget.controller,
          obscureText: widget.withObscure && _isTextObscured,
          decoration: InputDecoration(
            filled: true,
            fillColor: colors.defaultWhite,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: colors.defaultBorderColor),
            ),
            suffixIcon: widget.withObscure
                ? InkWell(
                    child: Icon(_isTextObscured ? Icons.visibility : Icons.visibility_off),
                    onTap: () {
                      setState(() {
                        _isTextObscured = !_isTextObscured;
                      });
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
