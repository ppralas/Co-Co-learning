
import 'package:flutter/material.dart';
import 'package:skola/common/presentation/widget/title_widget.dart';

class InputWithButton extends StatelessWidget {
  final String headerText;
  final String hintText;
  final String buttonText;
  final IconData buttonIcon;
  final Function(String) onButtonPressed;

  const InputWithButton({
    super.key,
    required this.headerText,
    required this.hintText,
    required this.buttonText,
    required this.buttonIcon,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(titleText: headerText),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton.icon(
              onPressed: () => onButtonPressed(_textController.text),
              icon: Icon(buttonIcon),
              label: Text(buttonText),
            ),
          ],
        ),
      ],
    );
  }
}
