import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_haven/common/utils/app_colors.dart';
import 'package:home_haven/common/utils/app_images.dart';
import 'package:home_haven/data/models/furniture_model.dart';
import 'package:home_haven/presentations/widgets/bold_text.dart';
import 'package:home_haven/presentations/widgets/furniture_card.dart';
import 'package:home_haven/presentations/widgets/normal_text.dart';
import 'package:home_haven/providers/provide.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();
  int? _currentIndex;
  List items = ["asfd", "abhjn", 'sjahbfj'];

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () async {
        await Provider.of<FurnitureProvider>(context, listen: false)
            .fetchFurnitureList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Consumer<FurnitureProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: AppColors.whiteColor,
                      filled: true,
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search candles',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        // borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        // borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.camera_alt_outlined),
                        onPressed: () {
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: PageView(
                    onPageChanged: (value) {
                      setState(() {
                        _currentIndex = value;
                      });
                    },
                    controller: pageController,
                    children: [
                      SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/banner.png",
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/banner.png",
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          "assets/images/banner.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                if (_currentIndex != 3)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SmoothPageIndicator(
                      axisDirection: Axis.horizontal,
                      effect: JumpingDotEffect(
                        activeDotColor: AppColors.mainColor,
                      ),
                      controller: pageController,
                      count: 3,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BoldText(
                          text: "Special Offers",
                          textColor: AppColors.blackColor,
                          fontsize: 24),
                      NormalText(
                          text: "See More",
                          textColor: AppColors.mainColor,
                          fontsize: 14),
                    ],
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.furnitureList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: FurnitureCard(
                          furnitureData: value.furnitureList[index],
                        ),
                      );
                    },
                  ),
                ),
                BoldText(
                    text: "Shop by Categories",
                    textColor: AppColors.blackColor,
                    fontsize: 28)
              ],
            ),
          );
        },
      )),
    );
  }
}
