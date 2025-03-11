import 'package:flutter/material.dart';

class MyFormWidget extends StatefulWidget {
  const MyFormWidget({super.key});

  @override
  _MyFormWidgetState createState() => _MyFormWidgetState();
}

class _MyFormWidgetState extends State<MyFormWidget> {
  // Declare the GlobalKey for the FormState
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Custom TextFormField widget with a GlobalKey passed
  Widget myTextFormField(
      Widget? icon, String hintText, GlobalKey<FormState> formKey) {
    return Form(
      key: formKey, // Use the passed GlobalKey here
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This Field is required';
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            myTextFormField(
              const Icon(Icons.person), // Example icon
              'Enter your name', // Hint text
              _formKey, // Pass the GlobalKey here
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Validate the form when the button is pressed
                if (_formKey.currentState?.validate() ?? false) {
                  // If valid, do something (e.g., submit the form)
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Form is valid')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
