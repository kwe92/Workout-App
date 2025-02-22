import 'package:example_ui/features/dashboard/model/exercise_category.dart';
import 'package:example_ui/features/dashboard/model/notification.dart';
import 'package:example_ui/features/dashboard/model/workout_progress.dart';
import 'package:example_ui/features/shared/services/notification_service.dart';
import 'package:example_ui/features/shared/services/toast_service.dart';
import 'package:example_ui/features/shared/utility/extended_change_notifier.dart';
import 'package:flutter/material.dart';

// TODO: add exercises place holder data for WorkoutProgress instances

class DashboardViewModel extends ExtendedChangeNotifier {
  int _selectedCategory = 0;

  final _categories = ["All", "Warm Up", "Yoga", "Biceps", "Chest", "Legs"];

  final NotificationService _notificationService;

  final ToastService _toastService;

  int get selectedCategory => _selectedCategory;

  List<String> get categories => _categories;

  List<AppNotification> get notifications => _notificationService.notifications;

  DashboardViewModel(this._notificationService, this._toastService);

  void setSelectedCategory(int index) {
    _selectedCategory = index;

    debugPrint("$_selectedCategory");

    notifyListeners();
  }

  void getNotifications() {
    setBusy(true);
    debugPrint('notifications future started.');

    final Future<void> notificationsFuture = _notificationService.getNotifications();

    notificationsFuture.timeout(const Duration(seconds: 5)).whenComplete(() {
      setBusy(false);
      debugPrint('notifications future complete.');
    }).catchError((err) {
      debugPrint('Error in getNotifications: ${err.toString()}');
      _toastService.showSnackBar(
        'There was an issue retrieving notifications, please check your connection.',
        Colors.red.shade400,
      );
    });
  }

  Future<void> notificationsModal() async => await _toastService.notificationsModal();

  Future<void> continueExerciseModal(WorkoutProgress workoutProgress) async => _toastService.continueExerciseBottomModal(workoutProgress);

  List<WorkoutProgress> get workoutProgress => [
        WorkoutProgress(
          workoutType: "Chest Workout",
          minutesRemaining: 15,
          completed: 5,
          total: 12,
          exercises: [
            "Standard Push-Ups",
            "Legs Crossed Push-Ups",
            "Decline Push-Ups",
            "Plyometric Push-Ups",
            "Wide Push-Ups",
            "Diamond Push-Ups",
            "Shuffle Push-Ups",
            "One-leg Push-Ups",
            "Off-set Push-Ups",
            "Spider-Man Push-Ups",
            "Incline push-Ups",
            "Archer push Ups",
          ],
        ),
        WorkoutProgress(
          workoutType: "Legs Workout",
          minutesRemaining: 23,
          completed: 3,
          total: 20,
          exercises: [],
        ),
        WorkoutProgress(
          workoutType: "Back Workout",
          minutesRemaining: 8,
          completed: 10,
          total: 12,
          exercises: [],
        ),
        WorkoutProgress(
          workoutType: "Biceps Workout",
          minutesRemaining: 5,
          completed: 7,
          total: 8,
          exercises: [],
        ),
      ];

  List<ExerciseCategory> exerciseCategories = const [
    ExerciseCategory(
      name: "Full Body Warm Up",
      exercises: [
        "Arm Circles",
        "Leg Swings",
        "Hip Circles",
        "Cat-Cow",
        "Shoulder Rolls",
        "Torso Twists",
        "Walking Lunges",
        "High Knees",
        "Butt Kicks",
        "Side Shuffle",
        "Jumping Jacks",
        "Mountain Climbers",
        "Burpees",
        "Jumping Rope",
        "Jogging in Place",
        "Wrist Circles",
        "Ankle Circles",
        "Neck Stretches",
        "Foam Rolling",
        "Dynamic Flexibility Exercises",
      ],
      exerciseCount: 20,
      totalMinutes: 22,
      image: "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/assets/warm_up_icon.png",
    ),
    ExerciseCategory(
      name: "Strength Exercise",
      exercises: [],
      exerciseCount: 12,
      totalMinutes: 14,
      image: "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/assets/strength_exercise_icon.png",
    ),
    ExerciseCategory(
      name: "Both Side Plank",
      exercises: [],
      exerciseCount: 15,
      totalMinutes: 18,
      image: "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/assets/plank_exercise_icon.png",
    ),
    ExerciseCategory(
      name: "Abs Workout",
      exercises: [],
      exerciseCount: 16,
      totalMinutes: 18,
      image: "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/assets/abs_exercise_icon.png",
    ),
    ExerciseCategory(
      name: "Torso and Trap Workout",
      exercises: [],
      exerciseCount: 8,
      totalMinutes: 10,
      image: "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/assets/torso_and_trap_exercise_icon.png",
    ),
    ExerciseCategory(
      name: "Lower Back Exercise",
      exercises: [],
      exerciseCount: 14,
      totalMinutes: 18,
      image: "/Users/kwe/flutter-projects/Example-UI-Flutter/example_ui/assets/lower_back_exercise_icon.png",
    ),
  ];
}
