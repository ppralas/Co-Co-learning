import 'package:flutter/material.dart';
import 'package:skola/common/presentation/widget/title_text_bolded.dart';

//pretvoriti ovo u stateful widget varijabla u stateu textediting controller i instanciarti u init stateu u kontroler
//ili dodat u text input onChanged i spremat vrijednost
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
    final TextEditingController textController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextBolded(titleText: headerText),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton.icon(
              onPressed: () => onButtonPressed(textController.text),
              icon: Icon(buttonIcon),
              label: Text(buttonText),
            ),
          ],
        ),
      ],
    );
  }
}
