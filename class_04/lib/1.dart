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
        appBar: AppBar(
          title: const Text("Flutter Practice Demo"),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                /// 1. CONTAINER with TEXT inside
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(16),
                  color: Colors.amber.shade200,
                  child: const Text(
                    "Hello, I am waqas Ahmed any issue come to me",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                /// 2. IMAGE in Circle + Text Below (Column)
                Column(
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("assets/images/p3.jpg"),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "This is an image in a circle",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// 3. ICONS in Grid layout (with updated spacing)
                // 3. ICONS in 2 Columns & 2 Rows (instead of GridView)
Column(
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        // Email
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.email, color: Colors.red, size: 40),
            SizedBox(height: 6),
            Text("Email"),
          ],
        ),
        // Location
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on, color: Colors.purple, size: 40),
            SizedBox(height: 6),
            Text("Location"),
          ],
        ),
      ],
    ),
    const SizedBox(height: 20), // spacing between the two rows
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        // Favorite
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite, color: Colors.pink, size: 40),
            SizedBox(height: 6),
            Text("Favorite"),
          ],
        ),
        // Settings
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.settings, color: Colors.blue, size: 40),
            SizedBox(height: 6),
            Text("Settings"),
          ],
        ),
      ],
    ),
  ],
),

                const SizedBox(height: 20),

                /// 4. STACK with Text over Image
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/p3.jpg",
                        width: 250,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
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
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 150, 25, 0)),
                      onPressed: () => debugPrint("Delete!"),
                      icon: const Icon(Icons.delete),
                      label: const Text("Delete"),
                    ),
                    OutlinedButton(
                      onPressed: () => debugPrint("Cancelled!"),
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () => debugPrint("Save!"),
                      child: const Text("Save"),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// 6. CARD with IMAGE + TEXT side by side
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Image.asset("assets/images/p3.jpg",
                            width: 100, height: 100, fit: BoxFit.cover),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Text(
                            "This is an image with some description text placed beside it inside a Card widget",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// 7. CONTAINER with Margin (different style)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  decoration: BoxDecoration(
                    color: Colors.teal.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.teal, width: 2),
                  ),
                  child: const ListTile(
                    leading: Icon(Icons.info, color: Colors.teal),
                    title: Text("This container has margin & border"),
                    subtitle: Text("Styled using ListTile for better readability"),
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
