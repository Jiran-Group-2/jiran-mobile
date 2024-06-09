import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key, required this.controller, this.title = 'Title', this.hintText, this.isRequired = false, this.keyboardType, this.textInputAction, this.inputFormatters, this.readOnly = false, this.minLength});

  final TextEditingController controller;
  final String title;
  final String? hintText;
  final bool isRequired;
  final bool readOnly;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final int? minLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.text,
          textInputAction: textInputAction ?? TextInputAction.next,
          inputFormatters: inputFormatters,
          readOnly: readOnly,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: hintText ?? '',
            labelStyle: const TextStyle(color: Colors.black),
            // border InputBorder.none,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (value) {
            if (!isRequired) {
              return null;
            }

            if (value == null || value.isEmpty) {
              return 'Please enter $title';
            }

            if (minLength != null && value.length < minLength!) {
              return 'Please enter at least $minLength characters';
            }

            return null;
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}