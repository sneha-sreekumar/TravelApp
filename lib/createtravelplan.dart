import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CreateTravelPlanPage(),
  ));
}

class CreateTravelPlanPage extends StatefulWidget {
  @override
  _CreateTravelPlanPageState createState() => _CreateTravelPlanPageState();
}

class _CreateTravelPlanPageState extends State<CreateTravelPlanPage> {
  final _formKey = GlobalKey<FormState>();

  final _planNameController = TextEditingController();
  final _destinationController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _travelTypeController = TextEditingController();
  final _budgetController = TextEditingController();
  final _accommodationController = TextEditingController();
  final _transportController = TextEditingController();
  final _attractionsController = TextEditingController();

  @override
  void dispose() {
    _planNameController.dispose();
    _destinationController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _travelTypeController.dispose();
    _budgetController.dispose();
    _accommodationController.dispose();
    _transportController.dispose();
    _attractionsController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String destination = _destinationController.text;
      String startDate = _startDateController.text;
      String endDate = _endDateController.text;

      print("Travel Plan Created: $destination, $startDate, $endDate");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Travel Plan Created Successfully!')),
      );
    }
  }

  Widget _buildField(String hint, TextEditingController controller, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.blue[800],
          centerTitle: true,
          title: const Text(
            'Create Travel Plan',
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildField('Plan Name', _planNameController),
                _buildField('Destination', _destinationController),

                Row(
                  children: [
                    Expanded(child: _buildField('Start Date', _startDateController)),
                    const SizedBox(width: 10),
                    Expanded(child: _buildField('End Date', _endDateController)),
                  ],
                ),

                _buildField('Travel Type', _travelTypeController),
                _buildField('Estimated Budget', _budgetController),
                _buildField('Accommodation & Food', _accommodationController),
                _buildField('Transportation', _transportController),
                _buildField('Nearby Attractions', _attractionsController),

                const SizedBox(height: 24),

                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
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
      ),
    );
  }
}
