
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mahmoud_fathi_start_tech_task/core/utils/values_manager.dart';

class DefaultTextFormField extends StatelessWidget {
  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? obscureText;

  const DefaultTextFormField({
    super.key,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.inputFormatters,
    this.keyboardType,
    this.onChanged,
    this.validator, this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: AppSize.s15),
      textAlign: TextAlign.center,
      controller: controller,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText??false,
      decoration: InputDecoration(
          hintText: hint, prefixIcon: prefixIcon, suffixIcon: suffixIcon),
    );
  }
}