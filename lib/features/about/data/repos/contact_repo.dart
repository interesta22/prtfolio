import 'package:http/http.dart' as http;
import 'package:portfolio/features/about/data/models/message_model.dart';

class ContactRepository {
  final String endpoint =
      "https://script.google.com/macros/s/AKfycbxD36yNQ2sWNu6SqIIN2mkObrBb3q2R4z7wCsBRQ3TuxL3HZfb-90Td_R2rczXZBqXm/exec"; // ✨ غيرها باللينك بتاعك

  Future<void> sendMessage(ContactMessage message) async {
    final response = await http.post(
      Uri.parse(endpoint),
      body: message.toMap(),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to send message: ${response.body}");
    }
  }
}
