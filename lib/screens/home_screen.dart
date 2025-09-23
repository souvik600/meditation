import 'package:flutter/material.dart';
import 'package:meditation/screens/sound_list_screen.dart';
import '../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      drawer: _buildDrawer(context),
      body: SafeArea(
        child: _getSelectedScreen(),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _getSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomeContent(context);
      case 1:
        return SoundListScreen(title: 'Sounds');
      case 2:
        return Center(child: Text('Soul Screen', style: TextStyle(color: lightBrown, fontSize: 24)));
      case 3:
        return Center(child: Text('Top Screen', style: TextStyle(color: lightBrown, fontSize: 24)));
      case 4:
        return Center(child: Text('More Screen', style: TextStyle(color: lightBrown, fontSize: 24)));
      default:
        return _buildHomeContent(context);
    }
  }

  Widget _buildHomeContent(BuildContext context) {
    return Column(
      children: [
        Builder(
            builder: (BuildContext context) {
              return _buildTopBar(context);
            }
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCategoryTabs(),
                const SizedBox(height: 20),
                _buildGridSection(
                  title: 'Featured Wallpaper',
                  items: [
                    'assets/images/wallpaper1.png',
                    'assets/images/wallpaper2.png',
                    'assets/images/wallpaper3.png',
                  ],
                ),
                _buildGridSection(
                  title: 'Featured Quotes',
                  items: [
                    'assets/images/quote1.png',
                    'assets/images/quote2.png',
                    'assets/images/quote3.png',
                  ],
                ),
                _buildGridSection(
                  title: 'Featured Memorial Cards',
                  items: [
                    'assets/images/card1.png',
                    'assets/images/card2.png',
                    'assets/images/card3.png',
                  ],
                ),
                _buildAnnouncementSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Helper method to build the top application bar.
  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.menu, size: 34, color: lightBrown),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildTopButton('Popular', Icons.local_fire_department),
                  const SizedBox(width: 8),
                  _buildTopButton('Latest', Icons.access_time),
                  const SizedBox(width: 8),
                  _buildTopButton('grief & loss', Icons.access_time),
                  const SizedBox(width: 8),
                  _buildTopButton('poems & poetry', Icons.access_time),
                  const SizedBox(width: 8),
                  _buildTopButton('remembering', Icons.access_time),
                  const SizedBox(width: 8),
                  _buildTopButton('heavenly', Icons.access_time),
                  const SizedBox(width: 8),
                  _buildTopButton('memories', Icons.access_time),
                  const SizedBox(width: 8),
                  _buildTopButton('faith & hope', Icons.access_time),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build the drawer/sidebar menu.
  Widget _buildDrawer(BuildContext context) {
    final drawerItems = [
      {'text': 'Explore', 'icon': Icons.explore},
      {'text': 'Popular', 'icon': Icons.local_fire_department},
      {'text': 'Latest', 'icon': Icons.access_time},
      {'text': 'Cardinal Sound', 'icon': Icons.music_note},
      {'text': 'Wallpaper', 'icon': Icons.image},
      {'text': 'Natural Sound', 'icon': Icons.cloud},
      {'text': 'Sleeping Stories', 'icon': Icons.bedtime},
      {'text': 'Meditation', 'icon': Icons.self_improvement},
      {'text': 'Breathing Exercise', 'icon': Icons.air},
      {'text': 'Meditational Audios', 'icon': Icons.audiotrack},
      {'text': 'Top Quotes', 'icon': Icons.format_quote},
      {'text': 'Soul Check-In', 'icon': Icons.favorite_border},
      {'text': 'Sacred Journals', 'icon': Icons.book},
      {'text': 'Medicine Notes', 'icon': Icons.medical_services},
      {'text': 'Memorial Card', 'icon': Icons.card_membership},
      {'text': 'Save', 'icon': Icons.save},
    ];

    return Drawer(
      backgroundColor: lightBrown,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  child: Image.asset(
                    'assets/images/drawer_header.png', // Placeholder image asset
                    fit: BoxFit.contain,
                    width: 150,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: primaryBrown),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '"Happiness comes from within. Do not seek it without."',
                        style: TextStyle(
                          color: primaryBrown,
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '- Buddha',
                        style: TextStyle(
                          color: primaryBrown,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ...drawerItems.map((item) => ListTile(
            leading: Icon(item['icon'] as IconData, color: primaryBrown),
            title: Text(item['text'] as String, style: const TextStyle(color: primaryBrown)),
            onTap: () {
              // Handle item tap
              Navigator.pop(context); // Close drawer
            },
          )),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: accentPink),
            title: const Text('Log Out', style: TextStyle(color: accentPink)),
            onTap: () {
              // Handle log out
              Navigator.pop(context); // Close drawer
            },
          ),
        ],
      ),
    );
  }

  // Helper method to build a button for the top bar.
  Widget _buildTopButton(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: lightBrown,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: primaryBrown),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: primaryBrown),
          const SizedBox(width: 5),
          Text(text, style: const TextStyle(color: primaryBrown)),
        ],
      ),
    );
  }

  // Helper method to build the category tabs.
  Widget _buildCategoryTabs() {
    final categories = [
      {'text': 'Cardinal Sounds', 'icon': Icons.music_note},
      {'text': 'Wallpaper', 'icon': Icons.image},
      {'text': 'Nature Sounds', 'icon': Icons.cloud},
      {'text': 'Sleeping Stories', 'icon': Icons.bedtime},
      {'text': 'Meditation', 'icon': Icons.self_improvement},
      {'text': 'Breathing Exercises', 'icon': Icons.air},
      {'text': 'Short Meditations', 'icon': Icons.spa},
      {'text': 'Meditational Audios', 'icon': Icons.audiotrack},
      {'text': 'Top Quotes', 'icon': Icons.format_quote},
      {'text': 'Soul Check-In', 'icon': Icons.favorite_border},
      {'text': 'Sacred Journals', 'icon': Icons.book},
      {'text': 'Medicine Notes', 'icon': Icons.medical_services},
      {'text': 'Memorial Cards', 'icon': Icons.card_membership},
      {'text': 'Save', 'icon': Icons.save},
      {'text': 'Cardinal Quotes', 'icon': Icons.format_quote},
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.2,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return _buildGridButton(category['text'] as String, category['icon'] as IconData);
        },
      ),
    );
  }

  // Helper method to build a button for the category grid.
  Widget _buildGridButton(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: lightBrown,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: primaryBrown),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: primaryBrown, size: 24),
          const SizedBox(height: 5),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: primaryBrown),
          ),
        ],
      ),
    );
  }

  // Helper method to build a section with a title and horizontal scrollable list.
  Widget _buildGridSection({
    required String title,
    required List<String> items,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: lightBrown,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'See All >',
                    style: TextStyle(color: primaryBrown),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  margin: EdgeInsets.only(left: index == 0 ? 16 : 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(items[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build the announcement section at the bottom.
  Widget _buildAnnouncementSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Announcement',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: lightBrown,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See All >',
                  style: TextStyle(color: primaryBrown),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/images/announcement.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => _onItemTapped(0),
            child: _buildBottomNavItem(Icons.home_filled, 'Home', _selectedIndex == 0),
          ),
          GestureDetector(
            onTap: () => _onItemTapped(1),
            child: _buildBottomNavItem(Icons.music_note, 'Sounds', _selectedIndex == 1),
          ),
          GestureDetector(
            onTap: () => _onItemTapped(2),
            child: _buildBottomNavItem(Icons.person, 'Soul', _selectedIndex == 2),
          ),
          GestureDetector(
            onTap: () => _onItemTapped(3),
            child: _buildBottomNavItem(Icons.format_quote, 'Top', _selectedIndex == 3),
          ),
          GestureDetector(
            onTap: () => _onItemTapped(4),
            child: _buildBottomNavItem(Icons.more_horiz, 'More', _selectedIndex == 4),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isSelected ? primaryBrown : Colors.grey,
          size: 26,
        ),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? primaryBrown : Colors.grey,
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}