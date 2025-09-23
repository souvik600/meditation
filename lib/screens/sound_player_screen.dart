import 'package:flutter/material.dart';
import 'package:meditation/utils/constants.dart';

class SoundPlayerScreen extends StatelessWidget {
  final Map<String, dynamic> sound;

  const SoundPlayerScreen({Key? key, required this.sound}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBrown,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: lightBrown),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(sound['title'], style: const TextStyle(color: lightBrown)),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(sound['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 50,
                color: Colors.transparent, // Placeholder for sound waveform
                child: const Center(
                  child: Text(
                    'Sound Waveform',
                    style: TextStyle(color: lightBrown),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.skip_previous, color: lightBrown, size: 48),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.play_circle_filled, color: lightBrown, size: 80),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_next, color: lightBrown, size: 48),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
