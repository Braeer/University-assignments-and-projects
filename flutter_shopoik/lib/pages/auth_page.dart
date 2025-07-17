import 'package:flutter/cupertino.dart';
import 'package:flutter_shopoik/pages/register_page.dart';

class AuthPage extends StatefulWidget {
  static const String routeName = '/auth';
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CupertinoTextField(
            placeholder: 'Электронная почта',
            keyboardType: TextInputType.emailAddress,
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              border: Border.all(
                  color: CupertinoColors.lightBackgroundGray, width: 2),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CupertinoTextField(
            controller: passwordController,
            placeholder: 'Пароль',
            obscureText: true,
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              border: Border.all(
                  color: CupertinoColors.lightBackgroundGray, width: 2),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        const SizedBox(height: 32.0),
        CupertinoButton.filled(
          child: Text('Войти'),
          onPressed: () {
            // String email = emailController.text;
            // String password = passwordController.text;
            _showUnavailableDialog(context);
          },
        ),
        const SizedBox(height: 16.0),
        CupertinoButton(
          child: const Text('Зарегистрироваться'),
          onPressed: () {
            // Navigator.push(context, CupertinoPageRoute(builder: (context) {
            //   return RegistrationPage();
            _showUnavailableDialog(context);
          },
        )
      ]),
    );
  }
}

void _showUnavailableDialog(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text('Эта функция недоступна'),
        content: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child:
              Text('К сожалению, данная функция не доступна в данный момент.'),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text('Закрыть'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
