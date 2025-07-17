import 'package:flutter/cupertino.dart';

class RegistrationPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoTextField(
              controller: nameController,
              placeholder: 'Имя',
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
              controller: emailController,
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
              padding: EdgeInsets.all(12.0),
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
            child: Text('Зарегистрироваться'),
            onPressed: () {
              String name = nameController.text;
              String email = emailController.text;
              String password = passwordController.text;
              // Здесь вы можете добавить свою логику регистрации
              print('Name: $name, Email: $email, Password: $password');
            },
          ),
          SizedBox(height: 16.0),
          CupertinoButton(
            child: Text('Уже есть аккаунт? Войти'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
