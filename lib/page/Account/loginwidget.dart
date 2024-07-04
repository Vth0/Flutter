import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_smartshop/page/Account/registerwidget.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Đăng nhập",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/images/backgroundAccount.png",
              fit: BoxFit.cover,
            ),
            Container(
              color: const Color.fromARGB(255, 102, 133, 160)
                  .withOpacity(0.5), // Lớp màu xanh trắng mờ
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Đăng nhập",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: 400,
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Email...',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: 400,
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: "Password...",
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: 400,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        "Đăng nhập",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "Quên mật khẩu?",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Bạn chưa có tài khoản? ',
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Đăng ký',
                          style:
                              const TextStyle(color: Colors.blue, fontSize: 14),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Chuyển đến trang đăng nhập
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RegisterWidget()),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Hoặc đăng nhập với',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Image.asset(
                            "assets/images/facebookicon.png",
                            width: 50,
                            height: 25,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),

                      // Nút đăng nhập Google
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            // Xử lý sự kiện đăng nhập Google
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Image.asset(
                            "assets/images/googleicon.png",
                            width: 50,
                            height: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
