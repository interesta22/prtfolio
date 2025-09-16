import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/about/data/models/message_model.dart';
import 'package:portfolio/features/about/presentation/cubit/contact.dart';
import 'package:portfolio/features/home/presentation/widgets/styled_button.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ContactCubit, ContactState>(
        listener: (context, state) {
          if (state is ContactSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("✅ Message sent successfully")),
            );
          } else if (state is ContactFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("❌ Failed: ${state.error}")));
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            // 👈 هنا
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: _inputDecoration("Name"),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _emailController,
                  decoration: _inputDecoration("Email Address"),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _subjectController,
                  decoration: _inputDecoration("Subject"),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _messageController,
                  maxLines: 5,
                  decoration: _inputDecoration("Message"),
                ),
                const SizedBox(height: 20),
                state is ContactLoading
                    ? const CircularProgressIndicator()
                    : Row(
                        children: [
                          PrimaryButton(
                            onPressed: () {
                              final msg = ContactMessage(
                                name: _nameController.text,
                                email: _emailController.text,
                                subject: _subjectController.text,
                                message: _messageController.text,
                              );
                              context.read<ContactCubit>().sendMessage(msg);
                            },
                            title: 'Submit',
                          ),
                        ],
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
