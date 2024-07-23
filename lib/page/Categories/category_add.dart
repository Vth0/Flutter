// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_smartshop/data/api.dart';
import 'package:flutter_application_smartshop/model/category.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryAdd extends StatefulWidget {
  final bool isUpdate;
  final Category? categoryModel;
  const CategoryAdd({super.key, this.isUpdate = false, this.categoryModel});

  @override
  State<CategoryAdd> createState() => _CategoryAddState();
}

class _CategoryAddState extends State<CategoryAdd> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  String titleText = "";

  String? _imagePath;
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _getImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
        _imagePath = image.path; // Lưu đường dẫn vào biến _imagePath
      });
    }
  }

  Future<void> _onSave() async {
    final name = _nameController.text;
    final description = _descController.text;
    final image = _imagePath;
    var pref = await SharedPreferences.getInstance();
    await APIRepository().addCategory(
        Category(
            id: 0, name: name, imageUrl: image ?? '', desc: description),
        pref.getString('accountID').toString(),
        pref.getString('token').toString());
    // await _databaseService
    //     .insertCategory(CategoryModel(name: name, desc: description));
    setState(() {});
    Navigator.pop(context);
  }

  Future<void> _onUpdate(int id) async {
    final name = _nameController.text;
    final description = _descController.text;
    final image = _imagePath;
    var pref = await SharedPreferences.getInstance();

    //update
    await APIRepository().updateCategory(
        id,
        Category(
            id: widget.categoryModel!.id,
            name: name,
            imageUrl: image ?? '',
            desc: description),
        pref.getString('accountID').toString(),
        pref.getString('token').toString());
    Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.categoryModel != null && widget.isUpdate) {
      _nameController.text = widget.categoryModel!.name;
      _descController.text = widget.categoryModel!.desc;
    }
    if (widget.isUpdate) {
      titleText = "Update Category";
    } else {
      titleText = "Add New Category";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            titleText,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          elevation: 0, // Optional: Adjust elevation as needed
          backgroundColor: Colors.blue, // Example custom color
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Existing widgets with updated styling
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey), // Example border color
                    ),
                    hintText: 'Enter name',
                  ),
                ),
                const SizedBox(height: 12.0),
                Row(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: _getImageFromGallery,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.blue, // Example custom button color
                        textStyle: const TextStyle(fontSize: 16.0),
                      ),
                      child: const Text('Select Image', style: TextStyle(color: Colors.white),),
                    ),
                    const SizedBox(width: 12.0),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey), // Example border color
                      ),
                      child: _image == null
                          ? const Placeholder()
                          : Image.file(_image!, fit: BoxFit.cover),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                TextField(
                  controller: _descController,
                  maxLines: 7,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey), // Example border color
                    ),
                    hintText: 'Enter description',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    widget.isUpdate
                        ? _onUpdate(widget.categoryModel!.id)
                        : _onSave();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Example custom button color
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0), // Example padding
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
