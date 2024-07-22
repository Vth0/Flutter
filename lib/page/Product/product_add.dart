// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/api.dart';
import '../../model/category.dart';
import '../../model/product.dart';

class ProductAdd extends StatefulWidget {
  final bool isUpdate;
  final Product? productModel;

  const ProductAdd({super.key, this.isUpdate = false, this.productModel});

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  String? selectedCate;
  List<Category> categorys = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _desController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _catIdController = TextEditingController();

  String? _imagePath;
  File? _image;
  final ImagePicker _picker = ImagePicker();
  String titleText = "";

  Future<void> _getImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
        _imagePath = image.path; 
      });
    }
  }

  Future<void> _onSave() async {
    final name = _nameController.text;
    final des = _desController.text;
    final price = double.parse(_priceController.text);
    final img = _imagePath;
    final catId = _catIdController.text;
    var pref = await SharedPreferences.getInstance();
    await APIRepository().addProduct(
        Product(
            id: 0,
            name: name,
            imageUrl: img ?? '',
            categoryId: int.parse(catId),
            categoryName: '',
            price: price,
            description: des),
        pref.getString('token').toString());
    setState(() {});
    Navigator.pop(context);
  }

  Future<void> _onUpdate() async {
    final name = _nameController.text;
    final des = _desController.text;
    final price = double.parse(_priceController.text);
    final img = _imagePath;
    final catId = _catIdController.text;
    var pref = await SharedPreferences.getInstance();
    //update
    await APIRepository().updateProduct(
        Product(
            id: widget.productModel!.id,
            name: name,
            imageUrl: img ?? '',
            categoryId: int.parse(catId),
            categoryName: '',
            price: price,
            description: des),
        pref.getString('accountID').toString(),
        pref.getString('token').toString());
    setState(() {});
    Navigator.pop(context);
  }

  _getCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var temp = await APIRepository().getCategory(
      prefs.getString('accountID') ?? '',
      prefs.getString('token') ?? '',
    );

    setState(() {
      if (temp.isNotEmpty) {
        selectedCate = temp.first.id.toString();
        _catIdController.text = selectedCate.toString();
      } else {
        selectedCate = '';
        _catIdController.text = '';
      }
      categorys = temp;
    });
  }

  @override
  void initState() {
    super.initState();
    _getCategories();

    if (widget.productModel != null && widget.isUpdate) {
      _nameController.text = widget.productModel!.name;
      _desController.text = widget.productModel!.description;
      _priceController.text = widget.productModel!.price.toString();
      if (widget.productModel!.imageUrl.isNotEmpty) {
        setState(() {
          _image = File(widget.productModel!.imageUrl);
        });
      }
      _catIdController.text = widget.productModel!.categoryId.toString();

      // Set the image if available
    }
    if (widget.isUpdate) {
      titleText = "Update Product";
    } else {
      titleText = "Add New Product";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Name:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter name',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Price:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _priceController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter price',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 175,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: _getImageFromGallery,
                      child: Text('Select Image'),
                    ),
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: _image == null
                        ? Placeholder()
                        : Image.file(_image!, fit: BoxFit.cover),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Desciption:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _desController,
                maxLines: 5,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter description',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Category:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 50, color: Colors.white))),
                value: selectedCate,
                items: categorys
                    .map((item) => DropdownMenuItem<String>(
                          value: item.id.toString(),
                          child: Text(item.name,
                              style: const TextStyle(fontSize: 20)),
                        ))
                    .toList(),
                //onChanged: (item) => setState(() => selectedCate = item),
                onChanged: (item) {
                  // final selectedCategoryId = int.tryParse(item ?? '');
                  setState(() {
                    selectedCate = item;
                    _catIdController.text = item.toString();
                    print(_catIdController.text);
                  });
                },
              ),
              //image
              const SizedBox(height: 16.0),
              const SizedBox(height: 20),
              SizedBox(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () async {
                    widget.isUpdate ? _onUpdate() : _onSave();
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
