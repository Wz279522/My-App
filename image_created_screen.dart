import 'package:flutter/material.dart';

class ImageCreatedScreen extends StatelessWidget {
  final String imageUrl = ''; // Replace with the actual generated image URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Created'),
        actions: [
          IconButton(icon: Icon(Icons.settings), onPressed: () {}), // Settings
          IconButton(icon: Icon(Icons.share), onPressed: () {}), // Share
          IconButton(icon: Icon(Icons.download), onPressed: () {}), // Download
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Display Image
            Container(
              height: 300,
              color: Colors.grey[200], // Placeholder background
              child: imageUrl.isNotEmpty
                  ? Image.network(imageUrl)
                  : Center(child: Text('Image created here...')),
            ),
            SizedBox(height: 20),

            // Edit Prompt Button
            ElevatedButton(
              onPressed: () {}, // handle prompt editing
              child: Text('Edit Prompt'),
            ),

            // Delete Image Button
            ElevatedButton(
              onPressed: () {
    	   // Logic for deleting the image
              },
              child: Text('Delete Image'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: Icon(Icons.refresh), onPressed: () {}), // Regenerate
            IconButton(icon: Icon(Icons.save), onPressed: () {}), // Save
            IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}), // Favorite
          ],
        ),
      ),
    );
  }
}
