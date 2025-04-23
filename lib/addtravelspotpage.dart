import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AddTravelSpotPage(),
  ));
}

class AddTravelSpotPage extends StatefulWidget {
  @override
  _AddTravelSpotPageState createState() => _AddTravelSpotPageState();
}

class _AddTravelSpotPageState extends State<AddTravelSpotPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  final _spotNameController = TextEditingController();
  final _categoryController = TextEditingController();
  final _locationController = TextEditingController();
  final _shortDescController = TextEditingController();
  final _detailedDescController = TextEditingController();

  @override
  void dispose() {
    _spotNameController.dispose();
    _categoryController.dispose();
    _locationController.dispose();
    _shortDescController.dispose();
    _detailedDescController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Travel spot submitted successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.blue[800],
          centerTitle: true,
          title: Text(
            'Add Travel Spot',
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cursive',
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildInputField('Spot Name', _spotNameController),
              _buildInputField('Category', _categoryController),
              _buildInputField('Location', _locationController),
              _buildInputField('Short Description', _shortDescController, maxLines: 2),
              _buildInputField('Detailed Description', _detailedDescController, maxLines: 4),

              const SizedBox(height: 20),

              // Upload Box (Placeholder)
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.upload, size: 40, color: Colors.black54),
                    const SizedBox(height: 8),
                    const Text('Upload images/videos'),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        // File picker logic goes here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('Choose File'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Post',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
      String hint, TextEditingController controller, {
        int maxLines = 1,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding:
          const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please enter $hint';
          }
          return null;
        },
      ),
    );
  }
}

