import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skola/generated/l10n.dart';
import 'package:skola/student/domain/student_notifiers/student_notifier.dart';
import 'package:skola/student/presentation/screens/grid_screen.dart';
import 'package:skola/student/presentation/widgets/big_pink_button.dart';
import 'package:skola/theme/app_colors.dart';

final name1ControllerProvider =
    Provider<TextEditingController>((ref) => TextEditingController());
final name2ControllerProvider =
    Provider<TextEditingController>((ref) => TextEditingController());
final name3ControllerProvider =
    Provider<TextEditingController>((ref) => TextEditingController());
final name4ControllerProvider =
    Provider<TextEditingController>((ref) => TextEditingController());

final name1Provider = StateProvider<String>((ref) => '');
final name2Provider = StateProvider<String>((ref) => '');
final name3Provider = StateProvider<String>((ref) => '');
final name4Provider = StateProvider<String>((ref) => '');

class NamesInputScreen extends ConsumerStatefulWidget {
  const NamesInputScreen({Key? key}) : super(key: key);

  @override
  _NamesInputScreenState createState() => _NamesInputScreenState();
}

class _NamesInputScreenState extends ConsumerState<NamesInputScreen> {
  @override
  Widget build(BuildContext context) {
    final name1Controller = ref.watch(name1ControllerProvider);
    final name2Controller = ref.watch(name2ControllerProvider);
    final name3Controller = ref.watch(name3ControllerProvider);
    final name4Controller = ref.watch(name4ControllerProvider);

    ref.watch(name1Provider);
    ref.watch(name2Provider);
    ref.watch(name3Provider);
    ref.watch(name4Provider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                    name1Controller,
                    S.current.first_name,
                    AppColors.lightBlue,
                    name1Provider,
                    ref,
                  ),
                  const SizedBox(width: 60),
                  _buildTextFieldContainer(
                    name2Controller,
                    S.current.second_name,
                    AppColors.lightOrange,
                    name2Provider,
                    ref,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildTextFieldContainer(
                  name3Controller,
                  S.current.third_name,
                  AppColors.lightYellow,
                  name3Provider,
                  ref,
                ),
                const SizedBox(width: 60),
                _buildTextFieldContainer(
                  name4Controller,
                  S.current.forth_name,
                  AppColors.veryLightPurple,
                  name4Provider,
                  ref,
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
                onTap: () {
                  //ovo se moze uljepsati listom
                  ref.read(studentNotifierProvider.notifier).addStudent(
                    [
                      name1Controller.text,
                      name2Controller.text,
                      name3Controller.text,
                      name4Controller.text
                    ],
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GridScreen(),
                    ),
                  );
                },
                child: BigPinkButton(
                  buttonText: S.current.confirm,
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
    TextEditingController controller,
    String hintText,
    Color color,
    StateProvider<String> nameProvider,
    WidgetRef ref) {
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
        onChanged: (value) =>
            ref.read(nameProvider.notifier).update((state) => value),
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    ),
  );
}
