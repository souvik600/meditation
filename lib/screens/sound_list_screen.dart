import 'package:flutter/material.dart';
import 'package:meditation/screens/sound_player_screen.dart';
import 'package:meditation/utils/constants.dart';

class SoundListScreen extends StatelessWidget {
  final String title;

  const SoundListScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sounds = [
      {'title': 'Wiper', 'image': 'assets/images/sound1.png', 'tags': ['Ambition', 'Inspiration', 'Motivatioanal']},
      {'title': 'Rain', 'image': 'assets/images/sound1.png', 'tags': ['Calm', 'Relax', 'Nature']},
      {'title': 'Ocean Waves', 'image': 'assets/images/sound1.png', 'tags': ['Peace', 'Sleep', 'Tranquility']},
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: lightBrown),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(title, style: const TextStyle(color: lightBrown)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: sounds.length,
        itemBuilder: (context, index) {
          final sound = sounds[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SoundPlayerScreen(sound: sound)),
              );
            },
            child: _buildSoundListItem(
              context,
              sound['title'] as String,
              sound['image'] as String,
              sound['tags'] as List<String>,
            ),
          );
        },
      ),
    );
  }

  Widget _buildSoundListItem(BuildContext context, String title, String image, List<String> tags) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: lightBrown,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(image, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Music: $title',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: primaryBrown,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: tags.map((tag) => Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Text(
                      '#$tag',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  )).toList(),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.visibility, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text('567.57k', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.share, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text('Share', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        SizedBox(width: 10),
                        Icon(Icons.download, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text('Download', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        SizedBox(width: 10),
                        Icon(Icons.bookmark_border, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text('Save', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
