// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_smartshop/page/Account/loginwidget.dart';

import '../../data/api.dart';
import '../../model/signup.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  int _gender = 0;
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  // final TextEditingController _numberIDController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  // final TextEditingController _schoolKeyController = TextEditingController();
  // final TextEditingController _schoolYearController = TextEditingController();
  final TextEditingController _birthDayController = TextEditingController();
  final TextEditingController _imageURL = TextEditingController();
  String gendername = 'None';
  String temp = '';

  Future<String> register() async {
    return await APIRepository().register(Signup(
        accountID: _accountController.text,
        birthDay: _birthDayController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
        fullName: _fullNameController.text,
        phoneNumber: _phoneNumberController.text,
        schoolKey: 'HUFLIT',
        schoolYear: '2024',
        gender: getGender(),
        imageUrl: _imageURL.text,
        numberID: '2XDHXXXXXX'));
  }

  getGender() {
    if (_gender == 1) {
      return "Male";
    } else if (_gender == 2) {
      return "Female";
    }
    return "Other";
  }

  Widget textField(
      TextEditingController controller, String label, IconData icon) {
    return SizedBox(
      width: 370, // Kích thước rộng của TextField
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Màu nền của Container
          borderRadius: BorderRadius.circular(25.0), // Bo tròn góc
        ),
        child: TextField(
          controller: controller,
          obscureText: label.contains('mật khẩu'),
          decoration: InputDecoration(
            hintText: label,
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(icon, color: Colors.blue), // Biểu tượng bên trái
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide.none, // Không có viền bên ngoài
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                  color: Colors.blueGrey.shade300), // Viền khi không có focus
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide:
                  const BorderSide(color: Colors.blue), // Viền khi có focus
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Đăng ký",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        width: 370,
                        child: textField(_accountController,
                            'Nhập tài khoản', Icons.account_circle),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        width: 370,
                        child: textField(_passwordController,
                            'Nhập mật khẩu...', Icons.lock),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        width: 370,
                        child: textField(_confirmPasswordController,
                            'Nhập lại mật khẩu...', Icons.lock),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        width: 370,
                        child: textField(_fullNameController,
                            'Nhập họ và tên...', Icons.person),
                      ),
                      // const SizedBox(
                      //   height: 24,
                      // ),
                      // SizedBox(
                      //   width: 370,
                      //   child: textField(_numberIDController,
                      //       'Nhập email', Icons.card_membership),
                      // ),
                      const SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        width: 370,
                        child: textField(_phoneNumberController,
                            'Nhập số điện thoại...', Icons.phone),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        width: 370,
                        child: textField(_birthDayController,
                            'Nhập năm sinh...', Icons.schedule),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      // SizedBox(
                      //   width: 370,
                      //   child: textField(_schoolYearController,
                      //       'Nhập năm học...', Icons.school),
                      // ),
                      // const SizedBox(
                      //   height: 24,
                      // ),
                      // SizedBox(
                      //   width: 370,
                      //   child: textField(_schoolKeyController,
                      //       'Nhập mã trường...', Icons.school),
                      // ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        "Giới tính của bạn là?",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(0),
                              title: const Text(
                                "Nam",
                                style: TextStyle(color: Colors.white),
                              ),
                              leading: Transform.translate(
                                offset: const Offset(16, 0),
                                child: Radio(
                                  value: 1,
                                  groupValue: _gender,
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        _gender = value!;
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(0),
                              title: const Text(
                                "Nữ",
                                style: TextStyle(color: Colors.white),
                              ),
                              leading: Transform.translate(
                                offset: const Offset(16, 0),
                                child: Radio(
                                  value: 2,
                                  groupValue: _gender,
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        _gender = value!;
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(0),
                              title: const Text(
                                "Khác",
                                style: TextStyle(color: Colors.white),
                              ),
                              leading: Transform.translate(
                                offset: const Offset(16, 0),
                                child: Radio(
                                  value: 3,
                                  groupValue: _gender,
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        _gender = value!;
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 370,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            String respone = await register();
                            if (respone == "ok") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginWidget()));
                            } else {}
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          child: const Text(
                            "Đăng ký",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Bạn đã có tài khoản? ',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Đăng nhập',
                              style: const TextStyle(
                                  color: Color.fromARGB(248, 0, 72, 255),
                                  fontSize: 14),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginWidget(),
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
