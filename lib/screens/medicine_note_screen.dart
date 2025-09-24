import 'package:flutter/material.dart';

class MedicineNoteScreen extends StatefulWidget {
  const MedicineNoteScreen({Key? key}) : super(key: key);

  @override
  State<MedicineNoteScreen> createState() => _MedicineNoteScreenState();
}

class _MedicineNoteScreenState extends State<MedicineNoteScreen> {
  bool _showAddTodo = false;

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFC35848);
    const Color textColor = Color(0xFF333333);
    const Color overdueColor = Color(0xFFE57373);

    final List<Map<String, dynamic>> todos = [
      {
        'title': 'Viglimata',
        'subtitle': 'Everyday, 3 times a day',
        'isOverdue': false,
        'isCompleted': false
      },
      {
        'title': 'Viglimata',
        'subtitle': '2 days of interval, 3 times a day',
        'isOverdue': false,
        'isCompleted': true
      },
      {
        'title': 'Viglimata',
        'subtitle': 'Everyday, 1 times a day overdue',
        'isOverdue': true,
        'isCompleted': false
      },
      {
        'title': 'Napa',
        'subtitle': 'Everyday At 6.00 Pm',
        'isOverdue': false,
        'isCompleted': false
      },
      {
        'title': 'Viglimata',
        'subtitle': 'Everyday At 4.00 Pm',
        'isOverdue': false,
        'isCompleted': true
      },
      {
        'title': 'Napa',
        'subtitle': 'Everyday At 4.00 Pm Overdue',
        'isOverdue': true,
        'isCompleted': false
      },
      {
        'title': 'Napa',
        'subtitle': 'Everyday At 6.00 Pm',
        'isOverdue': false,
        'isCompleted': false
      },
      {
        'title': 'Viglimata',
        'subtitle': 'Everyday At 4.00 Pm',
        'isOverdue': false,
        'isCompleted': true
      },
      {
        'title': 'Napa',
        'subtitle': 'Everyday At 4.00 Pm Overdue',
        'isOverdue': true,
        'isCompleted': false
      },
    ];

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'To-dos',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: _showAddTodo ? 220.0 : 16.0,
            ),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return _buildTodoItem(todo, textColor, overdueColor);
            },
          ),
          if (_showAddTodo)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildBottomInputSection(primaryColor),
            ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  _showAddTodo = !_showAddTodo;
                });
              },
              backgroundColor: primaryColor,
              child: Icon(
                _showAddTodo ? Icons.close : Icons.add_card_sharp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodoItem(
      Map<String, dynamic> todo, Color textColor, Color overdueColor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(
          todo['isCompleted'] ? Icons.check_circle : Icons.radio_button_unchecked,
          color: todo['isCompleted'] ? Colors.green : Colors.grey,
        ),
        title: Text(
          todo['title'],
          style: TextStyle(
            color: textColor,
            decoration: todo['isCompleted'] ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          todo['subtitle'],
          style: TextStyle(
            color: todo['isOverdue'] ? overdueColor : Colors.grey[600],
            decoration: todo['isCompleted'] ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: todo['isOverdue']
            ? const Text(
          'Overdue',
          style: TextStyle(color: Colors.red),
        )
            : null,
      ),
    );
  }

  Widget _buildBottomInputSection(Color primaryColor) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _showAddTodo = false;
                  });
                },
                child: const Text('Cancel', style: TextStyle(color: Colors.white)),
              ),
              const Text(
                'New To-dos',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              TextButton(
                onPressed: () {
                  // Add todo logic here
                  setState(() {
                    _showAddTodo = false;
                  });
                },
                child: const Text('Add', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildInputField('New To-dos', Icons.calendar_today, Icons.access_time),
          const SizedBox(height: 16),
          _buildRepeatRow('Repeat', 'Everyday'),
          const SizedBox(height: 8),
          _buildRepeatRow('End Repeat', 'After 1 Month'),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, IconData icon1, IconData icon2) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: label,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
          prefixIcon: Icon(icon1, color: Colors.white),
          suffixIcon: Icon(icon2, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildRepeatRow(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white)),
          Row(
            children: [
              Text(value, style: const TextStyle(color: Colors.white)),
              const Icon(Icons.chevron_right, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}