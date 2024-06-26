import 'package:example_ui/examples/workoutApp/app/theme/workout_app_theme.dart';
import 'package:example_ui/examples/workoutApp/features/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "/Users/kwe/flutter-projects/Example-UI-FLutter/example_ui/lib/examples/workoutApp/app/assets/banner_icon.svg",
                  ),
                  SvgPicture.asset(
                    "/Users/kwe/flutter-projects/Example-UI-FLutter/example_ui/lib/examples/workoutApp/app/assets/notification_bell_icon.svg",
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                width: double.maxFinite,
                height: 176,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff9747FF),
                      Color(0xff6F00FF),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 200,
                            height: 78,
                            child: Text(
                              "Start Strong and Set Your Fitness Goals",
                              style: TextStyle(
                                letterSpacing: 0,
                                wordSpacing: 0,
                                height: 1.1,
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          CustomButton(
                            buttonTheme: secondaryButtonTheme,
                            width: 126,
                            height: 42,
                            onTap: () {},
                            label: "Start Exercise",
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 190,
                      top: 40,
                      child: SizedBox(
                        width: 126,
                        height: 136,
                        child: Image.asset(
                          "/Users/kwe/flutter-projects/Example-UI-FLutter/example_ui/lib/examples/workoutApp/app/assets/sample_person.png",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Progress",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
