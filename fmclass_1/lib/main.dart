import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Fake API Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HttpRequestScreen(),
    );
  }
}

class HttpRequestScreen extends StatefulWidget {
  const HttpRequestScreen({super.key});

  @override
  State<HttpRequestScreen> createState() => _HttpRequestScreenState();
}

class _HttpRequestScreenState extends State<HttpRequestScreen> {
  String _responseData = '';
  bool _isLoading = false;

  // POST Request Implementation
  Future<void> sendPostRequest() async {
    setState(() {
      _isLoading = true;
      _responseData = '';
    });

    try {
      // API endpoint for POST request
      final url = Uri.parse('https://jsonplaceholder.typicode.com/todos');

      // Data to send
      final data = {
        'title': 'Flutter HTTP Class',
        'body': 'Http Tasks Done',
        'userId': 1,
      };

      // Send POST request
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      // Check response status
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        setState(() {
          _responseData = 'POST Success!\n\n${jsonEncode(responseBody)}';
        });

        // Show success SnackBar
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Task Added successfully! Status: ${response.statusCode}'),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      } else {
        throw Exception('Failed to send data: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        _responseData = 'Error: $e';
      });

      // Show error SnackBar
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error sending data: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // GET Request Implementation
  Future<void> sendGetRequest() async {
    setState(() {
      _isLoading = true;
      _responseData = '';
    });

    try {
      // API endpoint for GET request
      final url = Uri.parse('https://jsonplaceholder.typicode.com/todos');

      // Send GET request
      final response = await http.get(url);

      // Check response status
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        setState(() {
          _responseData = 'GET Success!\n\n${jsonEncode(responseBody)}';
        });

        // Show success SnackBar
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Task received successfully! Status: ${response.statusCode}'),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        _responseData = 'Error: $e';
      });

      // Show error SnackBar
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error fetching data: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Weather API GET Request (Alternative Example)
  // Future<void> getWeatherData() async {
  //   setState(() {
  //     _isLoading = true;
  //     _responseData = '';
  //   });

  //   try {
  //     // Using a free weather API (no key required for basic access)
  //     final url = Uri.parse('https://api.open-meteo.com/v1/forecast?latitude=33.6844&longitude=73.0479&current=temperature_2m,wind_speed_10m');

  //     final response = await http.get(url);

  //     if (response.statusCode == 200) {
  //       final responseBody = jsonDecode(response.body);
  //       setState(() {
  //         _responseData = 'Weather Data Success!\n\n${jsonEncode(responseBody)}';
  //       });

  //       if (mounted) {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text('Weather data received! Status: ${response.statusCode}'),
  //             backgroundColor: Colors.green,
  //             duration: const Duration(seconds: 3),
  //           ),
  //         );
  //       }
  //     } else {
  //       throw Exception('Failed to fetch weather: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     setState(() {
  //       _responseData = 'Error: $e';
  //     });

  //     if (mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Error fetching weather: $e'),
  //           backgroundColor: Colors.red,
  //           duration: const Duration(seconds: 3),
  //         ),
  //       );
  //     }
  //   } finally {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Fake API Test'),
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // POST Request Button
            ElevatedButton.icon(
              onPressed: _isLoading ? null : sendPostRequest,
              icon: const Icon(Icons.send),
              label: const Text('Add Todo'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),

            const SizedBox(height: 12),

            // GET Request Button
            ElevatedButton.icon(
              onPressed: _isLoading ? null : sendGetRequest,
              icon: const Icon(Icons.download),
              label: const Text('Get  Task '),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),

            const SizedBox(height: 12),

            // // Weather API Button
            // ElevatedButton.icon(
            //   onPressed: _isLoading ? null : getWeatherData,
            //   icon: const Icon(Icons.cloud),
            //   label: const Text('Get Weather Data (Rawalpindi)'),
            //   style: ElevatedButton.styleFrom(
            //     padding: const EdgeInsets.symmetric(vertical: 15),
            //     backgroundColor: Colors.orange,
            //     foregroundColor: Colors.white,
            //   ),
            // ),

            const SizedBox(height: 20),

            // Loading Indicator
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),

            // Response Display Area
            if (_responseData.isNotEmpty && !_isLoading)
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      _responseData,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'monospace',
                      ),
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