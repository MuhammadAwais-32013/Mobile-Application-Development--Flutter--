import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Flutter Widgets Demo")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TEXT WIDGET
                const Text(
                  "This is a Text Widget",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                // IMAGE WIDGET (local asset)
                // Image.asset(
                //   "assets/images/p1.jpg",
                //   width: 150,
                //   height: 150,
                //   fit: BoxFit
                //       .cover, // or BoxFit.contain depending on what you want
                // ),
                // ROW WIDGET with Images
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset("assets/images/p1.jpg", width: 90, height: 80),
                    Image.asset("assets/images/p2.jpg", width: 90, height: 80),
                    Image.asset("assets/images/p3.jpg", width: 90, height: 80),
                  ],
                ),

                const SizedBox(height: 20),

                // ICON WIDGET
                const Icon(Icons.favorite, color: Colors.red, size: 40),

                const SizedBox(height: 20),

                // BUTTON WIDGET
                ElevatedButton(
                  onPressed: () {
                    debugPrint("Button Pressed!");
                  },
                  child: const Text("Click Me"),
                ),

                const SizedBox(height: 20),

                // CONTAINER WIDGET
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.blueAccent.withOpacity(0.2),
                  child: const Center(
                    child: Text(
                      "This is inside a Container",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // ROW WIDGET
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: const [
                //     Icon(Icons.star, color: Colors.orange, size: 40),
                //     Icon(Icons.star, color: Colors.orange, size: 40),
                //     Icon(Icons.star, color: Colors.orange, size: 40),
                //   ],
                // ),

                /// Multiple icons
                ///
                Column(
                  children: [
                    // First Row (Stars)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(Icons.star, color: Colors.orange, size: 40),
                        Icon(Icons.star, color: Colors.orange, size: 40),
                        Icon(Icons.star, color: Colors.orange, size: 40),
                      ],
                    ),

                    SizedBox(height: 20), // space between rows
                    // Second Row (Other Icons)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(Icons.favorite, color: Colors.red, size: 40),
                        Icon(Icons.thumb_up, color: Colors.blue, size: 40),
                        Icon(Icons.home, color: Colors.green, size: 40),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // STACK WIDGET
                Stack(
                  children: [
                    Container(height: 100, width: 100, color: Colors.green),
                    Container(height: 70, width: 70, color: Colors.yellow),
                    Container(height: 40, width: 40, color: Colors.red),
                  ],
                ),

                const SizedBox(height: 20),

                // // PADDING WIDGET
                // Padding(
                //   padding: const EdgeInsets.all(20.0),
                //   child: Container(
                //     color: Colors.purple.withOpacity(0.2),
                //     child: const Text("This container has padding inside"),
                //   ),
                // ),

                /// padding widget having text and image
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    color: Colors.purple.withOpacity(0.2),
                    child: Column(
                      mainAxisSize:
                          MainAxisSize.min, // So it only takes needed space
                      children: [
                        const Text("This container has padding inside"),
                        const SizedBox(
                          height: 10,
                        ), // Space between text & image
                        Image.asset(
                          "assets/images/p1.jpg",
                          width: 150,
                          height: 150,
                        ),
                      ],
                    ),
                  ),
                ),

                // MARGIN (via Container with EdgeInsets)
                Container(
                  margin: const EdgeInsets.all(20.0),
                  color: Colors.tealAccent.withOpacity(0.2),
                  child: const Text("This container has margin around"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
