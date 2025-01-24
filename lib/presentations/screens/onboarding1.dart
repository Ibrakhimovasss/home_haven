import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_haven/common/utils/app_colors.dart';
import 'package:home_haven/common/utils/app_images.dart';
import 'package:home_haven/presentations/screens/login_screen.dart';
import 'package:home_haven/presentations/screens/onboarding1.dart';
import 'package:home_haven/presentations/screens/Onboarding2.dart';
import 'package:home_haven/presentations/widgets/bold_text.dart';
import 'package:home_haven/presentations/widgets/custom_container.dart';
import 'package:home_haven/presentations/widgets/normal_text.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({super.key});

  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              width: double.infinity,
              AppImages.image1,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  BoldText(
                    text: "Online Home Store and Furniture",
                    textColor: AppColors.blackColor,
                    fontsize: 32,
                  ),
                  NormalText(
                    text:
                        "Discover all style and budgets of furniture, appliances, kitchen, and more from 500+ brands in your hand.",
                    textColor: AppColors.grayColor,
                    fontsize: 18,
                  ),
                  // Spacer(),
                  SizedBox(
                    height: 100,
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Onboarding2(),
                          ));
                    },
                    child: CustomContainer(
                      color: AppColors.mainColor,
                      fontSize: 16,
                      height: 50,
                      text: "Next",
                      textColor: AppColors.whiteColor,
                      width: 335,
                      bordercolor: AppColors.mainColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
