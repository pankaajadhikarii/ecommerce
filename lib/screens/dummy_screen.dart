
import 'package:ecommerce/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DummyScreen extends StatefulWidget {
  const DummyScreen({super.key});

  @override
  State<DummyScreen> createState() => _DummyScreenState();
}

class _DummyScreenState extends State<DummyScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _imageUrlController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [
            SizedBox(height: 70),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text("Go back", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),)),
              SizedBox(height: 30),
            TextFormField(
              textCapitalization: TextCapitalization.sentences,
              controller: _titleController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Title",
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 192, 188, 188),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 128, 122, 122),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                fillColor: Colors.grey[300],
                filled: true,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              textCapitalization: TextCapitalization.sentences,
              controller: _priceController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Price",
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 192, 188, 188),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 128, 122, 122),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                fillColor: Colors.grey[300],
                filled: true,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              textCapitalization: TextCapitalization.sentences,
              controller: _imageUrlController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Image Url",
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 192, 188, 188),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 128, 122, 122),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                fillColor: Colors.grey[300],
                filled: true,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              textCapitalization: TextCapitalization.sentences,
              controller: _descriptionController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Description",
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 192, 188, 188),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 128, 122, 122),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                fillColor: Colors.grey[300],
                filled: true,
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final title = _titleController.text;
                  final price = double.tryParse(_priceController.text) ?? 0;
                  final imageUrl = _imageUrlController.text;
                  final description = _descriptionController.text;
              
                  if (title.isEmpty ||
                      price == 0.0||
                      imageUrl.isEmpty ||
                      description.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please fill the all content"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    final success = await productProvider.addProduct(
                      title,
                      price,
                      imageUrl,
                      description,
                    );
              
                    if (success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Submitted Successfully"),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Something went wrong")),
                      );
                    }
                  }
                  _titleController.clear();
                  _priceController.clear();
                  _imageUrlController.clear();
                  _descriptionController.clear();
                },
                child: Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
