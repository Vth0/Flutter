import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sửa hồ sơ'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.0),
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/profile.png'), // Đường dẫn tới ảnh đại diện
              child: Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    // Xử lý sự kiện khi nhấn vào biểu tượng sửa ảnh
                  },
                  child: CircleAvatar(
                    radius: 15.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.edit,
                      size: 15.0,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            _buildProfileItem('Tên', 'Túc Quốc Công', context),
            _buildProfileItem('Giới tính', 'Thiết lập ngay', context),
            _buildProfileItem('Ngày sinh', 'Thiết lập ngay', context),
            _buildProfileItem('Số điện thoại', '*****111', context),
            _buildProfileItem('Email', 'tucquoccong@gmail.com', context),
            _buildProfileItem('Địa chỉ', '', context),
            _buildProfileItem('Thay đổi mật khẩu', '', context),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Xử lý sự kiện khi nhấn vào nút Lưu
              },
              child: Text('LƯU'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(String label, String value, BuildContext context) {
    return ListTile(
      title: Text(label),
      subtitle: Text(value),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Xử lý sự kiện khi nhấn vào mục
      },
    );
  }
}
