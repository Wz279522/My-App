
import 'package:flutter/material.dart';
import '../openai_service.dart';

class MainInputScreen extends StatefulWidget {
  @override
  _MainInputScreenState createState() => _MainInputScreenState();
}

class _MainInputScreenState extends State<MainInputScreen> {
  final TextEditingController _promptController = TextEditingController();
  final OpenAIService _openAIService = OpenAIService();
  String imageUrl = '';
  bool isLoading = false;
  List<bool> _selectedStyle = [false, false, false, false]; // Styles toggle state
  List<bool> _selectedRatio = [true, false, false, false]; // Aspect ratio toggle state

  Future<void> generateArt() async {
    setState(() {
      isLoading = true;
    });

    // Call the OpenAI service to generate the image
    final String? generatedImageUrl = await _openAIService.generateArt(_promptController.text);
    
    setState(() {
      imageUrl = generatedImageUrl ?? '';
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Digital Z AI Art'),
        actions: [
          IconButton(icon: Icon(Icons.help_outline), onPressed: () {}), // Help
          IconButton(icon: Icon(Icons.account_circle), onPressed: () {}), // Account
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input Prompt
            TextField(
              controller: _promptController,
              decoration: InputDecoration(
                labelText: 'Input Prompt',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {}, // handle image input logic
              child: Text('+ To Input Image'),
            ),
            SizedBox(height: 20),

            // Art Style Options
            Text('Art Style'),
            SizedBox(height: 10),
            ToggleButtons(
              children: [Text('No Style'), Text('Realistic'), Text('Cartoon'), Text('Anime')],
              isSelected: _selectedStyle,
              onPressed: (index) {
                setState(() {
                  for (int i = 0; i < _selectedStyle.length; i++) {
                    _selectedStyle[i] = (i == index);
                  }
                });
              },
            ),
            SizedBox(height: 20),

            // Aspect Ratio
            Text('Aspect Ratio'),
            SizedBox(height: 10),
            ToggleButtons(
              children: [Text('1:1'), Text('9:16'), Text('3:4'), Text('4:3')],
              isSelected: _selectedRatio,
              onPressed: (index) {
                setState(() {
                  for (int i = 0; i < _selectedRatio.length; i++) {
                    _selectedRatio[i] = (i == index);
                  }
                });
              },
            ),
            SizedBox(height: 20),

            // Create Image Button
            ElevatedButton(
              onPressed: generateArt, // Call generateArt to generate an image
              child: Text('CREATE IMAGE'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),

            // Display the loading spinner or generated image
            isLoading
                ? CircularProgressIndicator()
                : imageUrl.isNotEmpty
                    ? Image.network(imageUrl)
                    : Text('Enter a prompt and press "CREATE IMAGE" to generate art'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Log Out'),
          BottomNavigationBarItem(icon: Icon(Icons.brush), label: 'Design Options'),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Saved Images'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Discover'),
        ],
      ),
    );
  }
}
