import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_find_app/ui/bloc/auth_bloc.dart';
import 'package:music_find_app/ui/home_page.dart';

void main() => runApp(const LoginWidget());

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Login'),
            ),
            body: Container(
              alignment: Alignment.center,
              child:
                  BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
                if (state is Authenticated) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Homepage(title: 'Music App'),
                    ),
                  );
                }
              }, builder: (context, state) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'User Name',
                            hintText: 'Enter valid mail id as abc@gmail.com'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        textInputAction: TextInputAction.done,
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter your secure password'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextButton(
                        onPressed: () {
                          signIn(context);
                        },
                        child: Text('Sign in'),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          minimumSize: Size.fromHeight(50),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            )));
  }

  void signIn(context) async {
    BlocProvider.of<AuthBloc>(context).add(SignInRequested(
        emailController.text.trim(), passwordController.text.trim()));
  }
}
