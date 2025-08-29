import 'package:flutter/material.dart';
import 'package:portfolio/core/style/app_colors.dart';
import 'package:portfolio/core/extension/extensions.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  InputDecoration _inputDecoration(String label, BuildContext context) {
    return InputDecoration(
      focusColor: AppColors.primaryColor,

      hintText: label,
      filled: true,
      fillColor: AppColors.primaryColor.withOpacity(0.1),
      hintStyle: context.textStyles.bodyLgMedium.copyWith(
        fontWeight: FontWeight.w500,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 700;

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      context.loc.contact,
                      style: context.textStyles.titleMdMedium.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      height: 4,
                      width: 60,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Name + Email
                isDesktop
                    ? Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: _inputDecoration("Name", context),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: TextField(
                              decoration: _inputDecoration(
                                "Email Address",
                                context,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          TextField(
                            decoration: _inputDecoration("Name", context),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            decoration: _inputDecoration(
                              "Email Address",
                              context,
                            ),
                          ),
                        ],
                      ),
                const SizedBox(height: 16),

                // I am + Subject
                isDesktop
                    ? Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              decoration: _inputDecoration("I am a", context),
                              dropdownColor: Colors.grey[900],
                              items:
                                  <String>[
                                    'Student',
                                    'Professional',
                                    'Other',
                                  ].map((value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                              onChanged: (value) {},
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: TextField(
                              decoration: _inputDecoration("Subject", context),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          DropdownButtonFormField<String>(
                            decoration: _inputDecoration("I am a", context),
                            dropdownColor: Colors.grey[900],
                            items: <String>['Student', 'Professional', 'Other']
                                .map((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                })
                                .toList(),
                            onChanged: (value) {},
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            decoration: _inputDecoration("Subject", context),
                          ),
                        ],
                      ),
                const SizedBox(height: 16),

                // Message
                TextField(
                  decoration: _inputDecoration("Message", context),
                  maxLines: 5,
                ),

                const SizedBox(height: 30),

                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
