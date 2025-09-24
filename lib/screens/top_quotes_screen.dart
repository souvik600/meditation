import 'package:flutter/material.dart';
import 'package:meditation/screens/saved_content_screen.dart';
import 'package:meditation/utils/constants.dart';

class TopQuotesScreen extends StatelessWidget {
  final String title;
  const TopQuotesScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quotes = [
      {
        'text':
        '\nJust one small positive thought in the morning can change your whole day.',
        'author': 'Dalai Lama',
        'image': 'assets/images/quote_background_1.png',
        'tags': ['Ambition', 'Inspiration', 'Motivational'],
        'type': 'image',
      },
      {
        'text':
        '\nYou cannot let a fear of failure or a fear of comparison or a fear of judgment stop you from doing the things that will make you great.\n',
        'author': '',
        'image': '',
        'tags': ['Ambition', 'Inspiration', 'Motivational'],
        'type': 'pink',
      },
      {
        'text':
        'Either we heal as a team or we\'re gonna crumble inch by inch, play by play, till we\'re finished. We\'re in hell right now, gentlemen, believe me. And we can stay here and get the s-- kicked out of us, or we can fight our way back into the light.',
        'author': '',
        'image': 'assets/images/quote_background_3.png',
        'tags': ['Ambition', 'Inspiration', 'Motivational'],
        'type': 'white',
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
        title: Text(title, style: const TextStyle(color: lightBrown)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: lightBrown),
            onPressed: () {
              // Handle search functionality
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: quotes.length,
        itemBuilder: (context, index) {
          final quote = quotes[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SavedContentScreen()),
              );
            },
            child: _buildQuoteListItem(
              context,
              quote['text'] as String,
              quote['author'] as String,
              quote['image'] as String,
              quote['tags'] as List<String>,
              type: quote['type'] as String,
            ),
          );
        },
      ),
    );
  }

  Widget _buildQuoteListItem(BuildContext context, String text, String author,
      String image, List<String> tags,
      {required String type}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: type == "pink"
                  ? Colors.pink[100]
                  : type == "white"
                  ? Colors.white
                  : null,
              borderRadius: BorderRadius.circular(12),
              image: type == "image"
                  ? DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              )
                  : null,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  if (type == "white") ...[
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Icon(Icons.format_quote,
                          size: 32, color: Colors.redAccent),
                    ),
                    const SizedBox(height: 8),
                  ],
                  if (type == "image")
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '"$text"',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    )
                  else
                    Text(
                      '"$text"',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  if (author.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      author,
                      style: TextStyle(
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                        color: type == "image"
                            ? Colors.white70
                            : Colors.black54,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Tags Row
          Row(
            children: tags
                .map((tag) => Padding(
              padding: const EdgeInsets.only(right: 6),
              child: Text(
                '#$tag',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ))
                .toList(),
          ),

          const SizedBox(height: 6),

          // Actions Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.visibility, size: 16, color: Colors.black45),
                  SizedBox(width: 4),
                  Text('567.57k',
                      style: TextStyle(fontSize: 12, color: Colors.black54)),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.share, size: 16, color: Colors.black45),
                  SizedBox(width: 4),
                  Text('Share',
                      style: TextStyle(fontSize: 12, color: Colors.black54)),
                  SizedBox(width: 12),
                  Icon(Icons.download, size: 16, color: Colors.black45),
                  SizedBox(width: 4),
                  Text('Download',
                      style: TextStyle(fontSize: 12, color: Colors.black54)),
                  SizedBox(width: 12),
                  Icon(Icons.bookmark_border,
                      size: 16, color: Colors.black45),
                  SizedBox(width: 4),
                  Text('Save',
                      style: TextStyle(fontSize: 12, color: Colors.black54)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
