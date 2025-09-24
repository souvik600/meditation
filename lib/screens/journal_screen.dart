import 'package:flutter/material.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF5D3F37);
    const Color secondaryColor = Color(0xFFF9E4C5);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background Image - positioned lower and contained
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: size.height * 0.7, // 70% of screen height
                child: Image.asset(
                  'assets/images/journal_background.png',
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
            // Main Content
            Column(
              children: [
                // Top Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: primaryColor),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.menu, color: primaryColor),
                        onPressed: () {
                          // Handle menu action
                        },
                      ),
                    ],
                  ),
                ),
                // Journal Content with left alignment
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Left align content
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'Title',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Note',
                          style: TextStyle(
                            fontSize: 16,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Bottom Navigation Bar
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Top row - 4 icons in a row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.camera_alt, color: secondaryColor, size: 22),
                          constraints: BoxConstraints.tightFor(width: 40, height: 40),
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit, color: secondaryColor, size: 22),
                          constraints: BoxConstraints.tightFor(width: 40, height: 40),
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.attach_file, color: secondaryColor, size: 22),
                          constraints: BoxConstraints.tightFor(width: 40, height: 40),
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.list, color: secondaryColor, size: 22),
                          constraints: BoxConstraints.tightFor(width: 40, height: 40),
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                        ),
                      ],
                    ),

                    // Bottom section - Edited text aligned to the right
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 8.0, top: 4.0),
                      child: Text(
                        'Edited 11 may 2025 11:41 PM',
                        style: TextStyle(
                          fontSize: 10,
                          color: secondaryColor,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}