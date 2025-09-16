import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/about/data/models/message_model.dart';
import 'package:portfolio/features/about/presentation/cubit/contact.dart';
import 'package:portfolio/features/home/presentation/widgets/styled_button.dart';

class CooperationPage extends StatelessWidget {
  CooperationPage({super.key});

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      hintText: label,
      filled: true,
      fillColor: Colors.green.withOpacity(0.1), // ✨ لون مختلف عشان تميزها
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: Colors.green,
        title: const Text("🤝 Cooperation With Me"),
      ),
      body: BlocConsumer<ContactCubit, ContactState>(
        listener: (context, state) {
          if (state is ContactSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("✅ Cooperation request sent!")),
            );
          } else if (state is ContactFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("❌ Failed: ${state.error}")),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✨ عنوان مميز للصفحة
                const Text(
                  "Let's Collaborate 🚀",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Fill out this form if you’d like to collaborate on projects, partnerships, or any professional opportunities.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 30),

                // Name + Email
                TextField(
                  controller: _nameController,
                  decoration: _inputDecoration("Your Name"),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _emailController,
                  decoration: _inputDecoration("Your Email"),
                ),
                const SizedBox(height: 16),

                // Subject
                TextField(
                  controller: _subjectController,
                  decoration: _inputDecoration("Collaboration Subject"),
                ),
                const SizedBox(height: 16),

                // Message
                TextField(
                  controller: _messageController,
                  maxLines: 5,
                  decoration: _inputDecoration("Collaboration Details"),
                ),
                const SizedBox(height: 30),

                // Button
                Center(
                  child: state is ContactLoading
                      ? const CircularProgressIndicator()
                      : PrimaryButton(
                          onPressed: () {
                            if (_nameController.text.isEmpty ||
                                _emailController.text.isEmpty ||
                                _subjectController.text.isEmpty ||
                                _messageController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("⚠️ Please fill all fields")),
                              );
                              return;
                            }

                            final msg = ContactMessage(
                              name: _nameController.text,
                              email: _emailController.text,
                              subject: _subjectController.text,
                              message: _messageController.text,
                            );

                            context.read<ContactCubit>().sendMessage(msg);
                          },
                          title: "Send Cooperation Request",
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
