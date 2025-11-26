import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/attendance_model.dart';
import '../widgets/student_row.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) => AttendanceModel(),
        child: const AttendanceScreen(),
      ),
    );
  }
}

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildStudentList(context),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Consumer<AttendanceModel>(
        builder: (context, attendanceModel, _) {
          final presentCount = attendanceModel.getPresentCount();
          final totalCount = attendanceModel.students.length;
          return Text(
            'Attendance: $presentCount/$totalCount Present',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          );
        },
      ),
      elevation: 4,
      backgroundColor: Colors.blue.shade700,
    );
  }

 
  Widget _buildStudentList(BuildContext context) {
    return Consumer<AttendanceModel>(
      builder: (context, attendanceModel, _) {
        final students = attendanceModel.students;

        if (students.isEmpty) {
          return const Center(
            child: Text('No students available'),
          );
        }

        return ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) {
            return StudentRow(student: students[index]);
          },
        );
      },
    );
  }


  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        context.read<AttendanceModel>().markAllAbsent();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('All students marked as absent'),
            duration: Duration(seconds: 2),
          ),
        );
      },
      icon: const Icon(Icons.clear_all),
      label: const Text('Mark All Absent'),
      backgroundColor: Colors.red.shade600,
    );
  }
}
