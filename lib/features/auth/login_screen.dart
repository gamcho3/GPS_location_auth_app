import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/features/auth/providers/login_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final provider = LoginProvider();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/logo.png',
                    width: 130,
                  ),
                  Text(
                    "다양한 기능을 사용하려면 로그인이 필요합니다.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "이메일을 입력해 주세요.",
                          labelText: "이메일",
                          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "비밀번호를 입력해 주세요.",
                            labelText: "비밀번호",
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.2)))),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent),
                        onPressed: () {
                          context
                              .read<LoginProvider>()
                              .signUp("test@test.com", "1qaz2wsx");
                        },
                        child: Text(
                          "로그인",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Expanded(child: Divider()),

                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Text("OR")),
                          Expanded(child: Divider())
                        ],
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {
                          // context.read<LoginProvider>().signUp("test@test.com", "1qaz2wsx");
                        },
                        child: Text("구글로 로그인"),
                      )
                    ],
                  )),
                ],
              ),
            )),
      ),
    );
  }
}
