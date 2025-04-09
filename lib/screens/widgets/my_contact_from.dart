import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/constants/styles.dart';
import 'package:http/http.dart' as http;
import 'package:porfolio/screens/widgets/nav_bar.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ContactPage(),
  ));
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaQuery.of(context).size.width > 600 ? NavBar() : null,
      body: Container(
        decoration: Styles.gradientDecoration,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Card(
              color: Colors.white,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    return const RowLayout();
                  } else {
                    return const ColumnLayout();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RowLayout extends StatelessWidget {
  const RowLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * .61,
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Image.asset('images/person.png', fit: BoxFit.contain),
            ),
          ),
        ),
        const Expanded(
          child: ContactForm(),
        ),
      ],
    );
  }
}

class ColumnLayout extends StatelessWidget {
  const ColumnLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: SizedBox(
                height: 200, // Adjust this height as needed
                child: Image.asset('images/person.png', fit: BoxFit.contain),
              ),
            ),
            const ContactForm(),
          ],
        ),
      ]),
    );
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _subjectController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool isLoading = false;
  String statusMessage = "";
  bool formSubmitted = false;

  @override
  void dispose() {
    _subjectController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Get in Touch",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              TextFormField(
                autovalidateMode: formSubmitted
                    ? AutovalidateMode.disabled
                    : AutovalidateMode.onUserInteraction,
                controller: _subjectController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline),
                  hintText: "Subject",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter subject' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                autovalidateMode: formSubmitted
                    ? AutovalidateMode.disabled
                    : AutovalidateMode.onUserInteraction,
                controller: _emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter email';
                  } else if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}")
                      .hasMatch(value)) {
                    return 'Enter valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                autovalidateMode: formSubmitted
                    ? AutovalidateMode.disabled
                    : AutovalidateMode.onUnfocus,
                controller: _messageController,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: "Message",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter message' : null,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                        statusMessage = "";
                        formSubmitted = false; // Reset formSubmitted flag
                      });

                      String subject = _subjectController.text;
                      String email = _emailController.text;
                      String message = _messageController.text;

                      bool success = await SendEmail(
                        name: subject,
                        email: email,
                        subject: subject,
                        message: message,
                      );

                      setState(() {
                        isLoading = false;
                        formSubmitted = true; // Mark the form as submitted

                        if (success) {
                          statusMessage = "Email sent successfully!";
                          // Clear the text fields after submission
                          _subjectController.clear();
                          _emailController.clear();
                          _messageController.clear();
                        } else {
                          statusMessage = "Failed to send email.";
                        }
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.studio, // Your custom color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Rounded corners
                    ),
                  ),
                  child: const Text(
                    "Send",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              // Add a SizedBox between the button and CircularProgressIndicator
              const SizedBox(height: 20),
              if (isLoading) const Center(child: CircularProgressIndicator()),
              // Add a SizedBox between CircularProgressIndicator and status message
              const SizedBox(height: 20),
              if (statusMessage.isNotEmpty)
                Center(
                  child: Text(
                    statusMessage,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<bool> SendEmail({
  required String name,
  required String email,
  required String subject,
  required String message,
}) async {
  const serviceId = "service_6p3mlyg";
  const templateId = "template_189za5h";
  const userIdId = "2fY1BwQ1bQLCiTuK9";

  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

  try {
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-type': 'application/json',
      },
      body: jsonEncode({
        "service_id": serviceId,
        "template_id": templateId,
        "user_id": userIdId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'to_email': 'your-email@example.com',
          'user_subject': subject,
          'user_message': message,
        },
      }),
    );

    return response.statusCode == 200;
  } catch (e) {
    print('Error: $e');
    return false;
  }
}
