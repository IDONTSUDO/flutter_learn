import 'package:flutter/material.dart';
import 'package:learn/core/core.dart';
import 'package:learn/ui/ui.dart';

enum _Type {
  default_,
  texted,
  leading,
}

enum ButtonType {
  filled,
  tinted,
  elevated,
}

class DefaultButton extends StatelessWidget {
  final double height;
  final String text;
  final TextStyle? textStyle;
  final Widget? child;
  final Widget? prefixChild;
  final Widget? postfixChild;
  final bool isEnabled;
  final double disabledOpacity;
  final void Function() onPressed;

  final _Type _type;
  final ButtonType type;

  const DefaultButton({
    required this.child,
    required this.onPressed,
    Key? key,
    this.height = 50,
    this.textStyle,
    this.prefixChild,
    this.postfixChild,
    this.isEnabled = true,
    this.disabledOpacity = 1,
    this.type = ButtonType.filled,
  })  : text = '',
        _type = _Type.default_,
        super(key: key);

  const DefaultButton.texted({
    required this.text,
    required this.onPressed,
    Key? key,
    this.height = 50,
    this.textStyle,
    this.prefixChild,
    this.postfixChild,
    this.isEnabled = true,
    this.disabledOpacity = 1,
    this.type = ButtonType.filled,
  })  : child = null,
        _type = _Type.texted,
        super(key: key);

  const DefaultButton.leading({
    required this.text,
    required this.onPressed,
    required Widget leading,
    Key? key,
    this.height = 50,
    this.textStyle,
    this.child,
    this.postfixChild,
    this.isEnabled = true,
    this.disabledOpacity = 1,
    this.type = ButtonType.filled,
  })  : prefixChild = leading,
        _type = _Type.leading,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isEnabled,
      child: AnimatedOpacity(
        duration: AnimationType.base.duration,
        opacity: isEnabled ? 1 : disabledOpacity,
        child: Container(
          height: height,
          width: MediaQuery.of(context).size.width,
          decoration: _buildButtonDecoration(context: context),
          child: Material(
            borderRadius: BorderRadius.circular(30),
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                if (isEnabled) {
                  final focusScope = FocusScope.of(context);
                  if (focusScope.hasFocus) {
                    focusScope.unfocus();
                  }
                  onPressed.call();
                }
              },
              radius: 300,
              customBorder: RoundedRectangleBorder(
                side: BorderSide(color: context.colors.disabled),
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              child: SizedBox.expand(
                child: _buildButtonBody(
                  type: _type,
                  context: context,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonBody({
    required _Type type,
    required BuildContext context,
  }) {
    switch (type) {
      case _Type.texted:
      case _Type.default_:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixChild != null) prefixChild!,
            Flexible(
              child: _buildButtonText(context: context),
            ),
            if (postfixChild != null) postfixChild!,
          ],
        );
      case _Type.leading:
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: prefixChild!,
            ),
            const Spacer(flex: 2),
            _buildButtonText(context: context),
            const Spacer(flex: 3),
          ],
        );
    }
  }

  Widget _buildButtonText({
    required BuildContext context,
  }) {
    return Text(
      text,
      maxLines: 1,
      softWrap: false,
      style: textStyle,
      textAlign: TextAlign.center,
    );
  }

  FontColor _buildTextColor() {
    switch (type) {
      case ButtonType.filled:
        return FontColor.light;
      case ButtonType.tinted:
        return FontColor.primary;
      case ButtonType.elevated:
        return FontColor.primary;
    }
  }

  BoxDecoration _buildButtonDecoration({
    required BuildContext context,
  }) {
    switch (type) {
      case ButtonType.filled:
        return BoxDecoration(
          color: isEnabled ? context.colors.accent : context.colors.disabled,
          borderRadius: const BorderRadius.all(Radius.circular(100.0)),
        );
      case ButtonType.tinted:
        return BoxDecoration(
          border: Border.all(
            color: isEnabled ? context.colors.accent : context.colors.disabled,
            width: 2,
          ),
          color: isEnabled ? context.colors.basePrimary : context.colors.disabled,
          borderRadius: const BorderRadius.all(Radius.circular(100.0)),
        );
      case ButtonType.elevated:
        return BoxDecoration(
          color: isEnabled ? context.colors.basePrimary : context.colors.disabled,
          borderRadius: const BorderRadius.all(Radius.circular(100.0)),
        );
    }
  }
}
