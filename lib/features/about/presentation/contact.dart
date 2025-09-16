import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/about/data/models/message_model.dart';
import 'package:portfolio/features/about/presentation/cubit/contact.dart';
import 'package:portfolio/features/home/presentation/widgets/styled_button.dart';
import 'package:portfolio/core/extension/extensions.dart'; // ✅ مهم عشان context.loc

class ContactSection extends StatelessWidget {
  ContactSection({super.key});

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      hintText: label,
      filled: true,
      fillColor: Colors.deepPurple.withOpacity(0.1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  String? _validateRequired(String? value, String field) {
    if (value == null || value.trim().isEmpty) {
      return "⚠️ ${field}";
    }
    return null;
  }

  String? _validateEmail(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return "⚠️ ${context.loc.enterEmail}";
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return "⚠️ ${context.loc.invalidEmail}";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactCubit, ContactState>(
      listener: (context, state) {
        if (state is ContactSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("✅ ${context.loc.messageSent}")),
          );
          _nameController.clear();
          _emailController.clear();
          _subjectController.clear();
          _messageController.clear();
        } else if (state is ContactFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("❌ ${context.loc.messageFailed}: ${state.error}")),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Name
                TextFormField(
                  controller: _nameController,
                  decoration: _inputDecoration(context.loc.name),
                  validator: (value) => _validateRequired(value, context.loc.enterName),
                ),
                const SizedBox(height: 16),

                // Email
                TextFormField(
                  controller: _emailController,
                  decoration: _inputDecoration(context.loc.email),
                  validator: (value) => _validateEmail(context, value),
                ),
                const SizedBox(height: 16),

                // Subject
                TextFormField(
                  controller: _subjectController,
                  decoration: _inputDecoration(context.loc.subject),
                  validator: (value) => _validateRequired(value, context.loc.enterSubject),
                ),
                const SizedBox(height: 16),

                // Message
                TextFormField(
                  controller: _messageController,
                  maxLines: 5,
                  decoration: _inputDecoration(context.loc.message),
                  validator: (value) => _validateRequired(value, context.loc.enterMessage),
                ),
                const SizedBox(height: 20),

                // Submit Button
                state is ContactLoading
                    ? const CircularProgressIndicator()
                    : Row(
                        children: [
                          PrimaryButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                final msg = ContactMessage(
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  subject: _subjectController.text,
                                  message: _messageController.text,
                                );
                                context.read<ContactCubit>().sendMessage(msg);
                              }
                            },
                            title: context.loc.submit,
                          ),
                        ],
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
