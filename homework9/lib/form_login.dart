import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() {
    return _FormLoginState();
  }
}

class _FormLoginState extends State<FormLogin> {
  final _formLoginKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool obscureText = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitLoginForm() {
    final result = _formLoginKey.currentState!.validate();
    if (result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Вход выполнен успешно'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  void _changeObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formLoginKey,
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                prefix: Icon(Icons.email),
                hintText: 'example@mail.com',
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, введите email!';
                }
                if (!value.contains('@')) {
                  return 'Email должен содержать знак @';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            TextFormField(
              obscureText: obscureText,
              controller: _passwordController,
              decoration: InputDecoration(
                prefix: Icon(Icons.password),
                hintText: 'Пароль',
                labelText: 'Пароль',
                suffix: IconButton(
                  onPressed: () {
                    _changeObscureText();
                  },
                  icon: Icon(Icons.remove_red_eye),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Введите пароль!';
                } else if (value.length < 6) {
                  return 'Пароль должен содержать более 6 сиимволов!';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                child: Text(
                  'Забыли пароль?',
                  style: TextStyle(color: Colors.blue, fontSize: 17),
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Функция восстановления пароля'),
                      backgroundColor: Colors.grey,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                onPressed: _submitLoginForm,
                child: const Text('Войти', style: TextStyle(fontSize: 18)),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: SizedBox(
                    width: 150,
                    child: Divider(color: Colors.black),
                  ),
                ),
                Text('или'),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: SizedBox(
                    width: 150,
                    child: Divider(color: Colors.black),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            InkWell(
              child: const Text(
                'Создать новый аккаунт?',
                style: TextStyle(color: Colors.blue, fontSize: 17),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Переход к регистрации'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
