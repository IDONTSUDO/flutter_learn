part of '../../environment_selector.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 120.fh,
        ),
        Container(
          height: 120.fh,
          width: 120.fw,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: context.colors.palette is LightPalette
                  ? const Color.fromRGBO(240, 240, 248, 1)
                  : const Color.fromRGBO(28, 28, 34, 1),
              borderRadius: BorderRadius.circular(90),
              boxShadow: [
                if (context.colors.palette is LightPalette) ...[
                  const BoxShadow(
                    color: Color.fromRGBO(166, 180, 200, 0.7),
                    offset: Offset(10, 10),
                    blurRadius: 18,
                  ),
                  const BoxShadow(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    offset: Offset(-10, -10),
                    blurRadius: 18,
                  ),
                ] else ...[
                  const BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.9),
                    offset: Offset(8, 8),
                    blurRadius: 18,
                  ),
                  const BoxShadow(
                    color: Color.fromRGBO(66, 70, 73, 0.5),
                    offset: Offset(-8, -8),
                    blurRadius: 18,
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
