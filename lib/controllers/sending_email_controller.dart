import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SendingEmailController extends GetxController {
  //sending email constants
  final String _servicesId = "service_x3zm8pk";
  final String _templateId = "template_r1f10tq";
  final String _publicKey = "6Rgh3--P04KjFpBiE";

  //text editing for email
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  //formkey
  final formKey = GlobalKey<FormState>();

  RxString resultMessage = ''.obs;

  // Validation methods
  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) return 'Name is required';
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Email is required';
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value.trim())) return 'Enter a valid email';
    return null;
  }

  String? validateSubject(String? value) {
    if (value == null || value.trim().isEmpty) return 'Subject is required';
    return null;
  }

  String? validateMessage(String? value) {
    if (value == null || value.trim().isEmpty) return 'Message is required';
    if (value.trim().length < 10) return 'Message must be at least 10 characters';
    return null;
  }

  Future<void> sendEmail() async {
    if (!formKey.currentState!.validate()) return;

    // Show loading overlay
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.5),
    );
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    //print all controllers texts

    final Map<String, dynamic> payload = {
      'service_id': _servicesId,
      'template_id': _templateId,
      'user_id': _publicKey,
      'template_params': {
        'user_name': nameController.text,
        'user_email': emailController.text,
        'user_subject': subjectController.text,
        'user_message': messageController.text,
      },
    };

    try {
      final response = await http.post(
        url,
        headers: {
          'origin': 'http://localhost', // required by EmailJS
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );

      // Close loading dialog
      if (Get.isDialogOpen!) Get.back();

      if (response.statusCode == 200) {
        Get.snackbar(
          'Success',
          'Email sent successfully!',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: EdgeInsets.all(16),
          duration: Duration(seconds: 3),
        );

        formKey.currentState!.reset();
        nameController.clear();
        emailController.clear();
        subjectController.clear();
        messageController.clear();
      } else {
        Get.snackbar(
          'Error',
          'Failed to send email',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: EdgeInsets.all(16),
          duration: Duration(seconds: 3),
        );
      }
    } catch (e) {
      if (Get.isDialogOpen!) Get.back();

      Get.snackbar(
        'Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: EdgeInsets.all(16),
        duration: Duration(seconds: 3),
      );
    }
  }
}
