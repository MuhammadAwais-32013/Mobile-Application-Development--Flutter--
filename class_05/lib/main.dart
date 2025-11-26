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
      title: 'Flutter UI Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter UI Task'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RippleEffectScreen()),
                );
              },
              child: const Text('Ripple Effect Demo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GestureScreen()),
                );
              },
              child: const Text('Gesture Detection Demo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ValidationFormScreen()),
                );
              },
              child: const Text('Validation Form Demo'),
            ),
          ],
        ),
      ),
    );
  }
}

class RippleEffectScreen extends StatelessWidget {
  const RippleEffectScreen({super.key});

  void _showCustomSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.1,
          left: 20,
          right: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ripple Effect Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Light ripple effect
            Material(
              color: Colors.blue[100],
              child: InkWell(
                onTap: () => _showCustomSnackbar(context, 'Light ripple tapped'),
                splashColor: Colors.blue.withOpacity(0.3),
                child: const SizedBox(
                  width: 200,
                  height: 60,
                  child: Center(child: Text('Light Ripple')),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Medium ripple effect
            Material(
              color: Colors.blue[300],
              child: InkWell(
                onTap: () => _showCustomSnackbar(context, 'Medium ripple tapped'),
                splashColor: Colors.blue.withOpacity(0.5),
                child: const SizedBox(
                  width: 200,
                  height: 60,
                  child: Center(child: Text('Medium Ripple')),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Dark ripple effect
            Material(
              color: Colors.blue[500],
              child: InkWell(
                onTap: () => _showCustomSnackbar(context, 'Dark ripple tapped'),
                splashColor: Colors.blue.withOpacity(0.7),
                child: const SizedBox(
                  width: 200,
                  height: 60,
                  child: Center(child: Text('Dark Ripple')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GestureScreen extends StatefulWidget {
  const GestureScreen({super.key});

  @override
  State<GestureScreen> createState() => _GestureScreenState();
}

class _GestureScreenState extends State<GestureScreen> {
  String _lastAction = 'No action yet';

  void _updateAction(String action) {
    setState(() {
      _lastAction = action;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gesture Detection Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Last Action: $_lastAction',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () => _updateAction('Single Tap'),
              onDoubleTap: () => _updateAction('Double Tap'),
              onLongPress: () => _updateAction('Long Press'),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  border: Border.all(color: Colors.black),
                ),
                child: const Center(
                  child: Text('Try different gestures here'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ValidationFormScreen extends StatefulWidget {
  const ValidationFormScreen({super.key});

  @override
  State<ValidationFormScreen> createState() => _ValidationFormScreenState();
}

class _ValidationFormScreenState extends State<ValidationFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _dobController = TextEditingController();

  void _showCustomSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.1,
          left: 20,
          right: 20,
        ),
      ),
    );
  }

  String? _validateDOB(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your date of birth';
    }

    // Regular expression for "Month DD, YYYY" format
    // Month must be a word, Day must be 2 digits, Year must be 4 digits
    final RegExp dobRegex = RegExp(
      r'^(January|February|March|April|May|June|July|August|September|October|November|December)\s([0-2][0-9]|3[0-1]),\s\d{4}$',
      caseSensitive: false,
    );

    if (!dobRegex.hasMatch(value)) {
      return 'Please enter date in format: Month DD, YYYY\nExample: April 05, 1994';
    }

    return null;
  }

  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Validation Form Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Enter your date of birth:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _dobController,
                decoration: const InputDecoration(
                  hintText: 'Example: April 05, 1994',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: _validateDOB,
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _showCustomSnackbar('Date of birth is valid!');
                    }
                  },
                  child: const Text('Validate'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
