# Attendance Tracker - Provider State Management Demo

This Flutter application demonstrates effective state management using the Provider package and ChangeNotifier. It implements an attendance-tracking system for a classroom with optimized UI rebuilds.

## Project Structure

```
lib/
├── main.dart                    # Main app and UI screens
├── models/
│   ├── student.dart             # Student model
│   └── attendance_model.dart    # AttendanceModel with ChangeNotifier
└── widgets/
    └── student_row.dart         # Individual student row widget
```

## Key Components

### 1. Student Model (`lib/models/student.dart`)
- Stores student information: `id`, `name`, and `isPresent` status
- Includes a `copyWith()` method for immutable updates
- Represents individual students in the classroom

### 2. AttendanceModel (`lib/models/attendance_model.dart`)
Extends `ChangeNotifier` and provides:
- **Private Student List**: Maintains internal state with 10 sample students
- **toggleAttendance(int studentId)**: Toggles a student's attendance status
- **markAllAbsent()**: Marks all students as absent
- **getPresentCount()**: Returns the number of present students
- **getStudentById(int studentId)**: Retrieves a student by ID
- **getStudentAttendance(int studentId)**: Gets attendance status for a specific student

### 3. UI Components

#### StudentRow Widget (`lib/widgets/student_row.dart`)
- Displays a single student with an attendance switch
- **Uses `context.select()`** to listen only to this specific student's attendance status
- **Uses `context.read()`** for non-listening toggle action
- Changes background color based on attendance status

#### AttendanceScreen (`lib/main.dart`)
Features:
- **AppBar**: Shows live-updating counter using `Consumer` (e.g., "Attendance: 5/10 Present")
- **Student List**: Scrollable ListView with `StudentRow` widgets
- **Floating Action Button**: Marks all students absent using `context.read()`

## State Management Approach

### Provider Setup
```dart
ChangeNotifierProvider(
  create: (context) => AttendanceModel(),
  child: const AttendanceScreen(),
)
```

### Optimized Rebuilds

1. **AppBar Title** - Uses `Consumer<AttendanceModel>` to rebuild only when present count changes
2. **Student List** - Uses `Consumer` to rebuild the entire list (efficient for this demo)
3. **Individual Student Row** - Uses `context.select()` to rebuild only when that specific student's attendance changes
4. **FAB Action** - Uses `context.read()` for one-time access without listening

### Why This Approach?

- **context.read()**: Used for actions that don't require listening (toggle, mark all absent)
- **context.select()**: Used to listen only to specific values (individual student attendance)
- **Consumer**: Used for widgets that need to react to model changes (AppBar, List)

## Features

✅ Add/remove students' attendance status with switches
✅ Live counter in AppBar showing present students
✅ Mark all students as absent with one click
✅ Optimized rebuilds - only necessary widgets rebuild
✅ Clean, intuitive UI with color coding (green for present, red for absent)
✅ Responsive scrollable list
✅ Feedback via SnackBar when marking all absent

## How to Run

1. Ensure Flutter is installed and up to date
2. Get dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

## Sample Students

The app initializes with 10 sample students:
- Alice Johnson
- Bob Smith
- Charlie Brown
- Diana Prince
- Ethan Hunt
- Fiona Green
- George Miller
- Hannah Montana
- Isaac Newton
- Julia Roberts

## Testing Scenarios

1. **Toggle Individual Attendance**: Click a switch to mark a student present/absent
2. **Watch Counter Update**: AppBar counter updates in real-time
3. **Mark All Absent**: Click FAB to reset all students
4. **Observe Rebuild Optimization**: Only affected widgets rebuild on changes

## Dependencies

- `flutter`: Flutter SDK
- `provider: ^6.0.0`: State management solution

## Learning Outcomes

This application demonstrates:
- ✅ ChangeNotifier for state management
- ✅ ChangeNotifierProvider at app root
- ✅ Selective widget rebuilds with context.select()
- ✅ Non-listening access with context.read()
- ✅ Consumer for reactive rebuilds
- ✅ Model-driven architecture
- ✅ Immutable updates with copyWith()
