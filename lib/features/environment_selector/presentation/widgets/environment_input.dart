part of '../../environment_selector.dart';

class EnvironmentInputWidget extends StatefulWidget {
  final void Function(String url) onChanged;
  final void Function(String url) onEditingComplete;

  const EnvironmentInputWidget({
    required this.onChanged,
    required this.onEditingComplete,
    Key? key,
  }) : super(key: key);

  @override
  State<EnvironmentInputWidget> createState() => _EnvironmentInputWidgetState();
}

class _EnvironmentInputWidgetState extends State<EnvironmentInputWidget> {
  final TextEditingController _controller = TextEditingController();

  Future _onTapPaste() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    _controller.text = data?.text ?? '';
    widget.onChanged.call(_controller.text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnvironmentSelectorCubit, EnvironmentSelectorState>(
      builder: (context, state) {
        return SizedBox(
          height: 80.fh,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(16.fw),
                child: SensoBackButton.withBackground(
                  onTap: () => widget.onEditingComplete.call(''),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.all(16.fw),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: _onTapPaste,
                        child: const Icon(Icons.paste),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () => widget.onEditingComplete.call(_controller.text),
                        child: const Icon(Icons.send),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 64.fw),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: (text) => widget.onChanged.call(_controller.text),
                  onEditingComplete: () => widget.onEditingComplete.call(_controller.text),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.url,
                  controller: _controller,
                  maxLines: 2,
                  decoration: InputDecoration(
                    isDense: true,
                    errorText: state == const ShowCustomEnvInput.notValidated()
                        ? (state as ShowCustomEnvInput).error
                        : null,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
