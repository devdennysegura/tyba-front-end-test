part of  tyba.ui.widgets;

class SignInInput extends StatelessWidget {
  final FocusNode fnode;
  final TextEditingController controller;
  final String hint;
  final String label;
  final bool autoFocus;
  final bool isPassword;
  final Function onComplete;
  final TextInputType type;
  final TextInputAction action;
  final bool hasError;
  final String errorText;
  final int maxLength;

  const SignInInput(
    this.fnode,
    this.controller, {
    this.hint,
    this.label,
    this.autoFocus = false,
    this.isPassword = false,
    this.onComplete,
    this.type,
    this.action,
    this.hasError,
    this.errorText,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Container(
          height: 70.0,
          width: constraint.maxWidth,
          child: TextField(
            focusNode: fnode,
            obscureText: isPassword,
            autofocus: autoFocus,
            onSubmitted: onComplete,
            controller: controller,
            keyboardType: type ?? TextInputType.text,
            textInputAction: action,
            maxLength: maxLength,
            inputFormatters: maxLength != null
                ? [
                    LengthLimitingTextInputFormatter(maxLength),
                  ]
                : null,
            style: TextStyle(
              color: black,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 6.125,
              ),
              labelText: label,
              hintText: hint,
              labelStyle: TextStyle(
                color: black,
              ),
              hintStyle: TextStyle(
                color: black.withOpacity(0.4),
              ),
              errorText: hasError ? errorText : null,
            ),
          ),
        );
      },
    );
  }
}
