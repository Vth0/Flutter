import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart'; // Ensure Dio is imported

import '../../model/user.dart'; // Make sure User model is properly imported

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  User user = User.userEmpty();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _birthDayController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  Future<void> getDataUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String strUser = pref.getString('user')!;

    user = User.fromJson(jsonDecode(strUser));
    _fullNameController.text = user.fullName ?? '';
    _genderController.text = user.gender ?? '';
    _birthDayController.text = user.birthDay ?? '';
    _phoneNumberController.text = user.phoneNumber ?? '';
    _emailController.text = user.idNumber ?? '';
    setState(() {});
  }

  Future<void> _updateProfile() async {
    user.fullName = _fullNameController.text;
    user.gender = _genderController.text;
    user.birthDay = _birthDayController.text;
    user.phoneNumber = _phoneNumberController.text;
    user.idNumber = _emailController.text;

    bool success = await updateProfile(user);
    if (success) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cập nhật hồ sơ thành công!')),
      );
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cập nhật hồ sơ thất bại!')),
      );
    }
  }

  Future<bool> updateProfile(User user) async {
    try {
      final Dio dio = Dio();
      final body = FormData.fromMap({
        "numberID": user.idNumber,
        "fullName": user.fullName,
        "phoneNumber": user.phoneNumber,
        "imageURL": user.imageURL,
        "birthDay": user.birthDay,
        "gender": user.gender,
        "schoolYear": user.schoolYear,
        "schoolKey": user.schoolKey,
      });
      Response res = await dio.put(
        'https://huflit.id.vn:4321/api/Auth/updateProfile',
        data: body,
      );
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sửa hồ sơ'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16.0),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: (user.imageURL != null && user.imageURL!.isNotEmpty)
                      ? Image.network(
                          user.imageURL!,
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox(
                              height: 70,
                              width: 70,
                              child: Icon(Icons.person, size: 70),
                            );
                          },
                        )
                      : const SizedBox(
                          height: 70,
                          width: 70,
                          child: Icon(Icons.person, size: 70),
                        ),
                ),
              ),
              const SizedBox(height: 16.0),
              _buildProfileItem('Tên', _fullNameController),
              _buildProfileItem('Giới tính', _genderController),
              _buildProfileItem('Ngày sinh', _birthDayController),
              _buildProfileItem('Số điện thoại', _phoneNumberController),
              _buildProfileItem('Email', _emailController),

              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _updateProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text('LƯU'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem(String label, TextEditingController? controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Nhập $label',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
