import 'package:flutter/material.dart';

class FormV extends StatefulWidget {
  State<FormV> createState() => VForm();
}

class VForm extends State<FormV> {
  final _Fkey = GlobalKey<FormState>();
  final emailC = TextEditingController();
  final passC = TextEditingController();

  String? VE(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Email";
    }

    if (!value.contains("@")) {
      return "Invalid Email";
    }

    return null;
  }

  String? VP(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Password";
    }

    if (value.length < 6) {
      return "Must be > 6";
    }

    return null;
  }

  void submit() {
    if (_Fkey.currentState!.validate()) {
      // SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Submitted "),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      print("invalide");
    }
  }

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello")),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _Fkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailC,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: VE,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),

              SizedBox(height: 20),

              TextFormField(
                controller: passC,

                decoration: InputDecoration(
                  labelText: 'Password',
                  prefix: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),

                obscureText: _obscureText,
                validator: VP,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: submit,
                child: Text("Submit"),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
