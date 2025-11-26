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
        appBar: AppBar(title: const Text("Flutter Practice Demo")),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                /// 1. CONTAINER with TEXT inside
                Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(16),
                  color: Colors.amber.shade200,
                  child: const Text(
                    "Hello, I am inside a Container",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 20),

                /// 2. IMAGE in Circle + Text Below (Column)
                Column(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        "assets/images/p2.jpg",
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("This is an image in a circle"),
                  ],
                ),

                const SizedBox(height: 20),

                /// 3. ROW with ICONS and TEXT
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.phone, color: Colors.green, size: 40),
                    Text("Call"),
                    Icon(Icons.message, color: Colors.blue, size: 40),
                    Text("Message"),
                    Icon(Icons.share, color: Colors.orange, size: 40),
                    Text("Share"),
                  ],
                ),

                const SizedBox(height: 20),

                /// 4. STACK with Text over Image
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "assets/images/p3.jpg",
                      width: 250,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.black54,
                      padding: const EdgeInsets.all(8),
                      child: const Text(
                        "Stack Overlay Text",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// 5. BUTTON Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => debugPrint("Saved!"),
                      icon: const Icon(Icons.save),
                      label: const Text("Save"),
                    ),
                    OutlinedButton(
                      onPressed: () => debugPrint("Cancelled!"),
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () => debugPrint("Skipped!"),
                      child: const Text("Skip"),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// 6. PADDING with IMAGE + TEXT side by side
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Image.asset("assets/images/p1.jpg",
                          width: 100, height: 100, fit: BoxFit.cover),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          "This is an image with some description text placed beside it inside Padding",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// 7. CONTAINER with Margin (different style)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  padding: const EdgeInsets.all(16),
              
              
                  decoration: BoxDecoration(
                    color: Colors.teal.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.teal, width: 2),
                  ),
                  child: const Text(
                    "This container has margin & border",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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

