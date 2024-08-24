import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sticky Note UI',
      home: Scaffold(
        backgroundColor: Color(0xFF10316B),
        appBar: AppBar(
          title: Center(
            child: Text(
              'Sticky Note',
              style: TextStyle(
                color: Color(0xFFFEFFEA), // Title text color
              ),
            ),
          ),
          backgroundColor: Color(0xFF10316B),
          elevation: 0,
        ),
        body: Stack(
          children: [
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF10316B),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white, // Text color for input
                  ),
                ),
              ),
            ),
            Positioned(
              top: 80,
              left: 16,
              child: StickyNote(),
            ),
            Positioned(
              top: 300,
              left: 16,
              child: StickyNote(),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add, color: Colors.white),
                    onPressed: () {

                      print('Add icon pressed');
                    },
                    iconSize: 30, // Size of the icon
                    padding: EdgeInsets.all(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StickyNote extends StatefulWidget {
  @override
  _StickyNoteState createState() => _StickyNoteState();
}

class _StickyNoteState extends State<StickyNote> {
  bool _isChecked = false; // State for the checkbox
  final TextEditingController _controller = TextEditingController(
    text: '',
  );
  final TextEditingController _titleController = TextEditingController(
    text: '',
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 200,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFFFED78),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value ?? false;
                  });
                },
              ),
              Expanded(
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title...',
                    hintStyle: TextStyle(color: Colors.black54),
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Expanded(
            child: TextField(
              controller: _controller,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter note content here...',
                hintStyle: TextStyle(color: Colors.black54),
              ),
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
