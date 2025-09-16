class ContactMessage {
  final String name;
  final String email;
  final String subject;
  final String message;

  ContactMessage({
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
  });

  Map<String, String> toMap() {
    return {
      "name": name,
      "email": email,
      "subject": subject,
      "message": message,
    };
  }
}
