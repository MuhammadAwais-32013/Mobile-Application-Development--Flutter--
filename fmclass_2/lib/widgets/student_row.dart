import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/attendance_model.dart';
import '../models/student.dart';

class StudentRow extends StatelessWidget {
  final Student student;

  const StudentRow({
    Key? key,
    required this.student,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    final isPresent = context.select<AttendanceModel, bool>(
      (model) => model.getStudentAttendance(student.id),
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isPresent ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
      ),
      child: ListTile(
        title: Text(
          student.name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: isPresent ? Colors.green.shade700 : Colors.grey.shade700,
          ),
        ),
        trailing: Switch(
          value: isPresent,
          onChanged: (value) {
          
            context.read<AttendanceModel>().toggleAttendance(student.id);
          },
          activeColor: Colors.green,
        ),
      ),
    );
  }
}
