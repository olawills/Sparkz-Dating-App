import 'package:dating_app/app/common/constants/app_style.dart';
import 'package:dating_app/app/common/constants/border_radius.dart';
import 'package:dating_app/app/common/constants/color_style.dart';
import 'package:dating_app/app/common/widgets/reusable_text.dart';

import '../../core/core.dart';

class CustomTxtField extends StatefulWidget {
  const CustomTxtField({
    super.key,
    this.hintText,
    this.keyboardType,
    this.validator,
    this.labelText,
    this.isValidationMessage = false,
    this.validationMessage,
    this.textEditingController,
    this.suffix = false,
    this.focusNode,
    this.onChanged,
    this.autofillHints,
    this.onEditingComplete,
    this.prefix,
    this.fillColor,
    this.filled,
    this.suffixIcon,
    this.inputBorder,
    this.hintStyle,
    this.focusBorder,
  });
  final String? hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? labelText;
  final bool isValidationMessage;
  final String? validationMessage;
  final TextEditingController? textEditingController;
  final bool? suffix;
  final FocusNode? focusNode;
  final Function(String?)? onChanged;
  final Iterable<String>? autofillHints;
  final Function()? onEditingComplete;
  final Widget? prefix;
  final Color? fillColor;
  final bool? filled;
  final Widget? suffixIcon;
  final InputBorder? inputBorder;
  final InputBorder? focusBorder;
  final TextStyle? hintStyle;

  @override
  State<CustomTxtField> createState() => _CustomTxtFieldState();
}

class _CustomTxtFieldState extends State<CustomTxtField> {
  bool passwordvisibility = false;
  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: knormalBorderRadius,
      borderSide: BorderSide(color: Color(kDarkGrey.value), width: 1.5),
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: kminiMediumBorderRadius,
      borderSide: BorderSide(color: Color(kDarkRed.value), width: 1.5),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReusableText(
          text: widget.labelText ?? '',
          style: appMStyle(
            17,
            Color(kDark.value),
            FontWeight.w500,
          ),
        ),
        TextFormField(
          controller: widget.textEditingController,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          obscureText: widget.suffix == true ? !passwordvisibility : false,
          onChanged: widget.onChanged,
          autofillHints: widget.autofillHints,
          onEditingComplete: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          style: appMStyle(
            17,
            Color(kDark.value),
            FontWeight.w500,
          ),
          validator: widget.validator,
          decoration: InputDecoration(
            filled: widget.filled,
            fillColor: widget.fillColor,
            prefixIcon: widget.prefix,
            hintText: widget.hintText,
            suffixIcon: widget.suffix == true
                ? IconButton(
                    onPressed: () => setState(
                      () => passwordvisibility = !passwordvisibility,
                    ),
                    icon: Icon(
                      passwordvisibility
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: passwordvisibility
                          ? Color(kDarkRed.value)
                          : Color(kDarkGrey.value),
                      size: 18,
                    ),
                  )
                : null,
            hintStyle: widget.hintStyle ??
                appMStyle(17, Color(kDark.value), FontWeight.w400),
            disabledBorder: inputBorder,
            enabledBorder: widget.inputBorder ?? inputBorder,
            focusedErrorBorder: errorBorder,
            errorBorder: errorBorder,
            focusedBorder: widget.focusBorder ?? inputBorder,
          ),
        ),
        ReusableText(
          text:
              widget.isValidationMessage ? widget.validationMessage ?? '' : '',
          style: appMStyle(17, Color(kBrightRed.value), FontWeight.w500),
        )
      ],
    );
  }
}
