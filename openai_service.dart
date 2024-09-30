
import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAIService {
  final String apiKey = ;

  Future<String?> generateArt(String prompt) async {
    final url = Uri.parse('https://api.openai.com/v1/images/generations');

    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'prompt': prompt,
          'n': 1,
          'size': '1024x1024',
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        // Get the first generated image URL from the response
        return data['data'][0]['url'];
      } else {
        print('Failed to generate art: ${response.statusCode}');
        print('Response: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
