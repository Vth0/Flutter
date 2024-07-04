import 'package:flutter/material.dart';
import 'package:flutter_application_smartshop/page/Account/loginwidget.dart';
import 'package:flutter_application_smartshop/page/Account/registerwidget.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({super.key});

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color:
              const Color.fromARGB(213, 239, 239, 239), // Lớp màu xanh trắng mờ
        ),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: const Color.fromARGB(255, 67, 99, 127)
                  .withOpacity(0.5), // Lớp màu xanh trắng mờ
            ),
            const Text(
              "Smart Shop",
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              "assets//images/image.png",
              height: 150,
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginWidget()));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.blue),
                  ),
                  child: const Text(
                    "Đăng nhập",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterWidget()));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.blue),
                  ),
                  child: const Text("Đăng ký",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                )),
            const SizedBox(
              height: 16,
            ),
          ],
        ))
      ],
    );
  }
}
