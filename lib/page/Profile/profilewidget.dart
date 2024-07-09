import 'package:flutter/material.dart';
import 'package:flutter_application_smartshop/page/Profile/editprofilewidget.dart';

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cá nhân'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage('assets/images/image.png'), // Đường dẫn tới ảnh đại diện
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Túc Quốc Công',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Thành viên',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EditProfileWidget()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.receipt_long),
              title: Text('Đơn hàng'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Xử lý sự kiện khi nhấn vào mục
              },
            ),
            ListTile(
              leading: Icon(Icons.rate_review),
              title: Text('Đánh giá của tôi'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Xử lý sự kiện khi nhấn vào mục
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Cài đặt'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Xử lý sự kiện khi nhấn vào mục
              },
            ),
            ListTile(
              leading: Icon(Icons.policy),
              title: Text('Chính sách và điều khoản'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Xử lý sự kiện khi nhấn vào mục
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Hỗ trợ'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Xử lý sự kiện khi nhấn vào mục
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Đăng xuất'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Xử lý sự kiện khi nhấn vào mục
              },
            ),
          ],
        ),
      ),
      
    );
  }
}
