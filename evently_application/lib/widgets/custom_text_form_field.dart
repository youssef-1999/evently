import 'package:evently_application/common/app_text_styles.dart';
import 'package:evently_application/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.label,
    this.hintText,
    this.imagePath,
    this.validator,
    this.isPassword = false, this.controller,
    this.maxLines = 1,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
  });

  final String? label;
  final String? hintText;
  final bool isPassword;
  final String? imagePath;
  final int maxLines;
  final EdgeInsetsGeometry padding;
  final TextEditingController? controller;
  final String? Function(String?)? validator;


  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool enablePassword = widget.isPassword;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: TextFormField(
        controller: widget.controller,
        onTapOutside: (event) => {
          FocusScope.of(context).unfocus(),
        },
        validator: widget.validator,
        obscureText: enablePassword,
        maxLines: widget.isPassword ? 1 : widget.maxLines,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: AppTextStyles.styleW400s16().copyWith(
            color: Theme.of(context).hoverColor,
          ),
          hintText: widget.hintText,
          prefixIcon: widget.imagePath == null
              ? null
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset(widget.imagePath!),
                ),
          suffixIcon: widget.isPassword
              ?InkWell(
                onTap: () {
                  setState(() {
                    enablePassword = !enablePassword;
                  });
                },
                child: Icon(enablePassword ? Icons.visibility_off : Icons.visibility),
              )
              : null,
          border: _buildBorder(),
          focusedBorder: _buildBorder(),
          enabledBorder: _buildBorder(),
          errorBorder: _buildBorder(color: AppColors.errorColor),
          focusedErrorBorder: _buildBorder(),
        ),
      ),
    );
  }

  InputBorder _buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color ?? Theme.of(context).hintColor),
    );
  }
}
