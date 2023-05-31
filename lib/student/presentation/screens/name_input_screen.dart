import 'package:flutter/material.dart';
import 'package:skola/student/presentation/screens/rotating_screen.dart';
import 'package:skola/student/presentation/screens/template_screens/rotating_screen_template.dart';
import 'package:skola/student/presentation/widgets/big_pink_button.dart';
import 'package:skola/theme/app_colors.dart';

class NamesInputScreen extends StatefulWidget {
  const NamesInputScreen({super.key});

  @override
  _NamesInputScreenState createState() => _NamesInputScreenState();
}

class _NamesInputScreenState extends State<NamesInputScreen> {
  final TextEditingController _name1Controller = TextEditingController();
  final TextEditingController _name2Controller = TextEditingController();
  final TextEditingController _name3Controller = TextEditingController();
  final TextEditingController _name4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'DOBRODOSLI!',
              style: TextStyle(fontSize: 90, color: AppColors.purple),
            ),
            const SizedBox(
              height: 36,
            ),
            Text(
              'Unesite svoja imena s obzirom na raspored sjedenja:',
              style: TextStyle(color: AppColors.purple, fontSize: 36),
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildTextFieldContainer(
                    _name1Controller,
                    'Prvo ime',
                    AppColors.lightBlue,
                  ),
                  const SizedBox(width: 60),
                  _buildTextFieldContainer(
                    _name2Controller,
                    'Drugo ime',
                    AppColors.lightOrange,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildTextFieldContainer(
                  _name3Controller,
                  'Trece ime',
                  AppColors.lightYellow,
                ),
                const SizedBox(width: 60),
                _buildTextFieldContainer(
                  _name4Controller,
                  'Cetvrto ime',
                  AppColors.veryLightPurple,
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 50,
              width: 250,
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GridScreen(),
                  ),
                ),
                child: BigPinkButton(
                  buttonText: 'Potvrdi',
                  iconImage: Icon(
                    Icons.check,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildTextFieldContainer(
    TextEditingController controller, String hintText, Color color) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10),
    ),
    child: SizedBox(
      width: 250,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    ),
  );
}
