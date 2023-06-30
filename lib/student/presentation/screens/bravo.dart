import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skola/student/presentation/widgets/button_no_icon.dart';
import 'package:skola/theme/app_colors.dart';

class BravoScreen extends StatelessWidget {
  const BravoScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: const Row(
                    children: [
                      IconButton(
                        icon: Icons.arrow_back_ios_new,
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                SvgPicture.asset('Assets/images/branch.svg'),
              ],
            ),
            Column(
              children: [
                Text(
                  'Bravo',
                  style: TextStyle(fontSize: 90, color: AppColors.purple),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'Super ste ovo riješili, samo nastavite tako!\nVježba je gotova, pozovite učiteljicu.',
                  style: TextStyle(fontSize: 30, color: AppColors.purple),
                ),
                const SizedBox(
                  height: 55,
                ),
                GestureDetector(
                  child: const ButtonNoIcon(
                    buttonText: 'ZAVRŠI',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
