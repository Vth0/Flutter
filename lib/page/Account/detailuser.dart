// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_smartshop/data/sharepre.dart';
import 'package:flutter_application_smartshop/page/Profile/editprofilewidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user.dart';

class DetailUser extends StatefulWidget {
  const DetailUser({super.key});

  @override
  State<DetailUser> createState() => _DetailUserState();
}

class _DetailUserState extends State<DetailUser> {
  // bool _expanded_user = false;
  // bool _expanded_manager = false;

  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  User user = User.userEmpty();

  getDataUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String strUser = pref.getString('user')!;

    user = User.fromJson(jsonDecode(strUser));
    setState(() {});
  }

  TextStyle mystyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );

  // Widget _buildDetailRow(String title, String? value, TextStyle style) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       RichText(
  //           text: TextSpan(
  //               text: "$title: ",
  //               style: const TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 16,
  //                   color: Colors.black),
  //               children: [TextSpan(text: "$value", style: style)])),
  //       const Divider(),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cá nhân'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                     ClipRRect(
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
                    const SizedBox(width: 16.0),
                     const SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.fullName ?? 'N/A',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                      const Text(
                        "Thành viên",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditProfileWidget()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.receipt_long),
              title: const Text('Đơn hàng'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Xử lý sự kiện khi nhấn vào mục
              },
            ),
            ListTile(
              leading: const Icon(Icons.rate_review),
              title: const Text('Đánh giá của tôi'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Xử lý sự kiện khi nhấn vào mục
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Cài đặt'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Xử lý sự kiện khi nhấn vào mục
              },
            ),
            ListTile(
              leading: const Icon(Icons.policy),
              title: const Text('Chính sách và điều khoản'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Xử lý sự kiện khi nhấn vào mục
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Hỗ trợ'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Xử lý sự kiện khi nhấn vào mục
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Đăng xuất'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                logOut(context);
              },
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   backgroundColor: Colors.grey[200],
    //   body: SingleChildScrollView(
    //     padding: const EdgeInsets.all(16.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       children: [
    //         Container(
    //           color: Colors.blueAccent,
    //           padding: const EdgeInsets.all(16.0),
    //           child: Row(
    //             children: [
    //               ClipRRect(
    //                 child: (user.imageURL != null && user.imageURL!.isNotEmpty)
    //                     ? Image.network(
    //                         user.imageURL!,
    //                         height: 70,
    //                         width: 70,
    //                         fit: BoxFit.cover,
    //                         errorBuilder: (context, error, stackTrace) {
    //                           return const SizedBox(
    //                             height: 70,
    //                             width: 70,
    //                             child: Icon(Icons.person, size: 70),
    //                           );
    //                         },
    //                       )
    //                     : const SizedBox(
    //                         height: 70,
    //                         width: 70,
    //                         child: Icon(Icons.person, size: 70),
    //                       ),
    //               ),
    //               const SizedBox(width: 16.0),
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     user.fullName ?? 'N/A',
    //                     style: const TextStyle(
    //                       fontSize: 18,
    //                       fontWeight: FontWeight.bold,
    //                       color: Colors.white70,
    //                     ),
    //                   ),
                      
    //                   // Text(
    //                   //   "School Year: ${user.schoolYear ?? 'N/A'}",
    //                   //   style: const TextStyle(
    //                   //     fontSize: 14,
    //                   //     color: Colors.white70,
    //                   //   ),
    //                   // ),
    //                 ],
    //               ),
    //               const SizedBox(
    //                 width: 10,
    //               ),
    //               Column(
    //                 children: [
    //                   IconButton(
    //                     icon: const Icon(Icons.edit, color: Colors.white),
    //                     onPressed: () {
    //                       // Edit button action
    //                     },
    //                   ),
    //                   IconButton(
    //                     icon: const Icon(Icons.logout, color: Colors.white),
    //                     onPressed: () {
    //                       logOut(context);
    //                     },
    //                   ),
    //                 ],
    //               )
    //             ],
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 5,
    //         ),
    //         Card(
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(20.0),
    //           ),
    //           elevation: 1,
    //           child: ExpansionPanelList(
    //             expandedHeaderPadding: EdgeInsets.zero,
    //             elevation: 0,
    //             expansionCallback: (panelIndex, isExpanded) {
    //               setState(() {
    //                 _expanded_user = !_expanded_user;
    //               });
    //             },
    //             children: [
    //               ExpansionPanel(
    //                 canTapOnHeader: true,
    //                 headerBuilder: (context, isExpanded) {
    //                   return const ListTile(
    //                     title: Text(
    //                       'Thông tin cá nhân',
    //                       style: TextStyle(
    //                         fontSize: 18,
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.blueAccent,
    //                       ),
    //                     ),
    //                   );
    //                 },
    //                 body: Container(
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(20.0),
    //                     color: Colors.white, // Optional: Set background color
    //                   ),
    //                   padding: const EdgeInsets.symmetric(
    //                       horizontal: 16.0, vertical: 12.0),
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.stretch,
    //                     children: [
    //                       _buildDetailRow("Number ID", user.idNumber, mystyle),
    //                       _buildDetailRow("Full Name", user.fullName, mystyle),
    //                       _buildDetailRow(
    //                           "Phone Number", user.phoneNumber, mystyle),
    //                       _buildDetailRow("Gender", user.gender, mystyle),
    //                       _buildDetailRow("Birth Day", user.birthDay, mystyle),
    //                       _buildDetailRow(
    //                           "School Year", user.schoolYear, mystyle),
    //                       _buildDetailRow(
    //                           "School Key", user.schoolKey, mystyle),
    //                       _buildDetailRow(
    //                           "Date Created", user.dateCreated, mystyle),
    //                     ],
    //                   ),
    //                 ),
    //                 isExpanded: _expanded_user,
    //               ),
    //             ],
    //           ),
    //         ),
    //         const SizedBox(height: 5),
    //         GestureDetector(
    //           onTap: () {},
    //           child: Card(
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(4.0),
    //             ),
    //             child: const ListTile(
    //               title: Text(
    //                 'Đơn hàng',
    //                 style: TextStyle(
    //                   fontSize: 18,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.blueAccent,
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //         Card(
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(20.0),
    //           ),
    //           elevation: 3,
    //           child: ExpansionPanelList(
    //             expandedHeaderPadding: EdgeInsets.zero,
    //             elevation: 0,
    //             expansionCallback: (panelIndex, isExpanded) {
    //               setState(() {
    //                 _expanded_manager = !_expanded_manager;
    //               });
    //             },
    //             children: [
    //               ExpansionPanel(
    //                 canTapOnHeader: true,
    //                 headerBuilder: (context, isExpanded) {
    //                   return const ListTile(
    //                     title: Text(
    //                       'Quản lý',
    //                       style: TextStyle(
    //                         fontSize: 18,
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.blueAccent,
    //                       ),
    //                     ),
    //                   );
    //                 },
    //                 body: Container(
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(20.0),
    //                     color: Colors.white, // Optional: Set background color
    //                   ),
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.stretch,
    //                     children: [
    //                       GestureDetector(
    //                         onTap: () {},
    //                         child: const ListTile(
    //                           title: Text(
    //                             'Quản lý sản phẩm',
    //                             style: TextStyle(
    //                               fontSize: 16,
    //                               fontWeight: FontWeight.normal,
    //                               color: Colors.black87,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       GestureDetector(
    //                         onTap: () {},
    //                         child: const ListTile(
    //                           title: Text(
    //                             'Quản lý phân loại',
    //                             style: TextStyle(
    //                               fontSize: 16,
    //                               fontWeight: FontWeight.normal,
    //                               color: Colors.black87,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 isExpanded: _expanded_manager,
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
