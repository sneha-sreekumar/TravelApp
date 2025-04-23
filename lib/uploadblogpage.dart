import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: UploadBlogPagee(),
  ));
}

class UploadBlogPagee extends StatefulWidget {
  @override
  State<UploadBlogPagee> createState() => _UploadBlogScreenState();
}

class _UploadBlogScreenState extends State<UploadBlogPagee> {
  final _formKey = GlobalKey<FormState>();
  File? _selectedFile;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg', 'mp4', 'mov', 'avi'],
    );

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    } else {
      // User canceled the picker
    }
  }

  // Form Submission Method
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Blog Posted Successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Blog', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[700],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Blog Title
              _buildTextField('Blog Title', 'Enter Blog Title', Icons.title),

              const SizedBox(height: 16),

              // Category
              _buildTextField('Category', 'Enter Category', Icons.category),

              const SizedBox(height: 16),

              // Location
              _buildTextField('Location', 'Enter Location', Icons.location_on),

              const SizedBox(height: 16),

              // Blog Content
              TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Write your blog content here...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) =>
                value!.isEmpty ? 'Please enter blog content' : null,
              ),

              const SizedBox(height: 20),

              // File Upload Section
              // File Upload Section
              GestureDetector(
                onTap: _pickFile, // <-- UNCOMMENT this
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.upload, size: 40, color: Colors.grey),
                      const SizedBox(height: 8),
                      Text(
                        _selectedFile != null
                            ? 'File: ${_selectedFile!.path.split('/').last}'
                            : 'Upload images/videos',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),


              const SizedBox(height: 20),

              // Tags
              _buildTextField('Add tags..', 'Enter tags', Icons.tag),

              const SizedBox(height: 30),

              // Post Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _submitForm,
                child: const Text(
                  'Post',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to Build Input Fields
  Widget _buildTextField(String label, String hint, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) => value!.isEmpty ? 'Please enter $label' : null,
    );
  }
}
