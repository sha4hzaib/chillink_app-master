import 'package:flutter/material.dart';

class StoryScreen extends StatefulWidget {
  final String title;
  final String imagePath;
  final String content;

  StoryScreen({
    required this.title,
    required this.imagePath,
    required this.content,
  });

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationOpacity;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      duration: Duration(seconds: 2), // Duration of the animation
      vsync: this,
    );

    // Define a simple opacity animation
    _animationOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the AnimationController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Story')),
      body: SafeArea(
        child: FadeTransition(
          opacity: _animationOpacity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Image with smooth opacity effect
                Container(
                  height: 300, // Custom size for the image
                  width: 300, // Custom size for the image
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16), // Border radius
                    image: DecorationImage(
                      image: AssetImage(widget.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Story title
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      // Story content
                      Text(
                        widget.content,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
