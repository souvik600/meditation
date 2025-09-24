import 'package:flutter/material.dart';
import 'package:meditation/utils/constants.dart';

class SavedContentScreen extends StatefulWidget {
  const SavedContentScreen({Key? key}) : super(key: key);

  @override
  State<SavedContentScreen> createState() => _SavedContentScreenState();
}

class _SavedContentScreenState extends State<SavedContentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quotes = [
      {
        'text': 'Just one small positive thought in the morning can change your whole day.',
        'author': 'Dalai Lama',
        'image': 'assets/images/quote_background_1.png',
      },
      {
        'text': 'You cannot let a fear of failure or a fear of comparison or a fear of judgment stop you from doing the things that will make you great.',
        'author': '',
        'image': 'assets/images/quote_background_2.png',
      },
      {
        'text': 'Either we heal as a team or we\'re gonna crumble inch by inch, play by play, till we\'re finished.',
        'author': 'Al Pacino',
        'image': 'assets/images/quote_background_3.png',
      },
      {
        'text': 'The only way to do great work is to love what you do.',
        'author': 'Steve Jobs',
        'image': 'assets/images/quote_background_1.png',
      },
      {
        'text': 'Success is not final, failure is not fatal: it is the courage to continue that counts.',
        'author': 'Winston Churchill',
        'image': 'assets/images/quote_background_2.png',
      },
      {
        'text': 'The future belongs to those who believe in the beauty of their dreams.',
        'author': 'Eleanor Roosevelt',
        'image': 'assets/images/quote_background_3.png',
      },
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
        title: const Text('Save', style: TextStyle(color: lightBrown)),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: lightBrown,
          labelColor: lightBrown,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(icon: Icon(Icons.music_note), text: 'Audios'),
            Tab(icon: Icon(Icons.format_quote), text: 'Quotes'),
            Tab(icon: Icon(Icons.image), text: 'Wallpapers'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const Center(child: Text('Audio content goes here')),
          GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: quotes.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              final quote = quotes[index];
              return _buildGridItem(
                context,
                quote['text'] as String,
                quote['author'] as String,
                quote['image'] as String,
              );
            },
          ),
          const Center(child: Text('Wallpaper content goes here')),
        ],
      ),
    );
  }

  Widget _buildGridItem(
      BuildContext context, String text, String author, String image) {
    return Container(
      decoration: BoxDecoration(
        color: lightBrown,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.6),
                ],
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {
                // Handle menu action
              },
            ),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            right: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                if (author.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    author,
                    style: const TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
