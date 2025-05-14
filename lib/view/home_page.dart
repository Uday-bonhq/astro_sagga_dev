import 'package:astro_sagga/controller/home_controller.dart';
import 'package:astro_sagga/core/utils/common_exports.dart';
import 'package:astro_sagga/core/utils/skeliton_shimmer.dart';
import 'package:astro_sagga/core/utils/utils.dart';
import 'package:astro_sagga/view/expert_details/expert_detail_page.dart';
import 'package:astro_sagga/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final HomeController homeController = Get.put(HomeController());


  @override
  void initState() {
    homeController.setData();
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {

      homeController.getDataDelay();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: SvgPicture.asset(AppAssets.homePageLogo,
            height: 36, width: 36,
          ),
        ),
        actions: [
          SvgPicture.asset(AppAssets.search, height: 24),
          const SizedBox(width: 20),
          Stack(
            children: [
              SvgPicture.asset(AppAssets.notification, height: 24),

              Obx(() {
                return Visibility(
                  visible: homeController.notificationCount.value > 0,
                  child: Positioned(
                    right: 0, top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: AppColors.matchMaking,
                        shape: BoxShape.circle,
                      ),
                      child: appText(
                        homeController.notificationCount.value.toString(),
                        color: AppColors.white,
                        fontSize: 8,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }),

            ],
          ),
          const SizedBox(width: 20),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.textColor)
            ),
            child: Row(
              children: [
                SvgPicture.asset(AppAssets.wallet, height: 24),
                const SizedBox(width: 4),
                Obx(() {
                  return appText(
                    "${homeController.walletAmount.value.toStringAsFixed(2)} ₹",
                    color: AppColors.textColor,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                  );
                }),
              ],
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        // padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(() {
          return SkeletonSimmer(
            isLoading: homeController.isLoading.value,
            child: AnimatedColumn(
              milliseconds: 500,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                _buildServiceIcons(),
                const SizedBox(height: 20),
                _buildBannerList(),
                const SizedBox(height: 20),
                _buildExpertListHeader(),
                const SizedBox(height: 10),
                _buildExpertGrid(),
                const SizedBox(height: 16),
              ],
            ),
          );
        }),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: homeController.currentIndex.value,
          selectedItemColor: AppColors.primary,
          showUnselectedLabels: true,
          unselectedItemColor: AppColors.darkGrey,
          onTap: (index) {
            homeController.currentIndex.value = index;
          },
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppAssets.home,
                  color: homeController.currentIndex.value == 0 ?
                  AppColors.primary : AppColors.darkGrey,
                ), label: "Home"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppAssets.course,
                  color: homeController.currentIndex.value == 1 ?
                  AppColors.primary : AppColors.darkGrey,
                ), label: "Courses"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppAssets.shop,
                  color: homeController.currentIndex.value == 2 ?
                  AppColors.primary : AppColors.darkGrey,
                ), label: "Shop"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppAssets.profile,
                  color: homeController.currentIndex.value == 3 ?
                  AppColors.primary : AppColors.darkGrey,
                ), label: "Profile"),
          ],
        );
      }),
    );
  }

  Widget _buildServiceIcons() {
    return SizedBox(
      height: 90,
      child: Obx(() {
        return AnimatedListViewBuilder(
          milliseconds: 1200,
          scrollDirection: Axis.horizontal,
          itemCount: homeController.services.length,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (_, index) {
            final service = homeController.services[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: SizedBox(
                width: 80,
                child: Column(
                  children: [
                    Container(
                      height: 54,
                      width: 54,
                      padding: const EdgeInsets.all(10),

                      decoration: BoxDecoration(
                        color: service.color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.asset(service.icon, height: 25),
                    ),
                    const SizedBox(height: 6),
                    appText(
                      service.label,
                      fontSize: 12,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }

  _buildBannerList() {
    final width = Get.width;
    return SizedBox(
      height: 130,
      // width: 200,
      child: Obx(() {
        return AnimatedListViewBuilder(
          milliseconds: 1200,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          itemCount: homeController.bannersList.length,
          itemBuilder: (_, index) {
            final banner = homeController.bannersList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: GestureDetector(
                onTap: () {
                  // buildGetPage(ExpertDetailsScreen(name: banner.userName,));
                },
                child: Container(
                  width: width * 0.85,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(banner.image)),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        // stops: [0.9, 0.1],
                        colors: [AppColors.cardColor, AppColors.lightGrey]),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(flex: 2,),
                      SizedBox(
                        width: width * 0.5,
                        child: appText(
                          banner.text,
                          color: AppColors.white,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(
                              offset: const Offset(1, 3),
                              blurRadius: 2,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(flex: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 32, width: 32,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AppColors.white)
                                ),
                              ),
                              const SizedBox(width: 8),
                              appText(banner.userName, fontSize: 12,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppColors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(AppAssets.view, height: 16),
                                const SizedBox(width: 4),
                                appText(banner.views, fontSize: 12,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(flex: 1,),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }

  Widget _buildExpertListHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appText("Our Experts", fontSize: 20,
              color: AppColors.textColor,
              textAlign: TextAlign.left,
              fontWeight: FontWeight.w600),
          SvgPicture.asset(AppAssets.filter, height: 24, width: 24,),
        ],
      ),
    );
  }

  Widget _buildExpertGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Obx(() {
        return AnimatedGridViewBuilder(
          itemCount: homeController.expertsList.length,
          milliseconds: 1200,
          crossAxisCount: Get.width > 600 ? 3 : 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          itemBuilder: (_, index) {
            var expert = homeController.expertsList[index];
            return GestureDetector(
              onTap: () {
                buildGetPage(ExpertDetailsScreen(expert: expert,));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.cardColor),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: AnimatedColumn(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 70,
                            child: Stack(
                              children: [
                                SvgPicture.asset(AppAssets.appLogo,),
                                const Align(
                                  alignment: Alignment.topRight,
                                  child: CircleAvatar(
                                      radius: 5,
                                      backgroundColor: AppColors.green),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: appText(
                              expert.userName,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              appText("Rating: ",
                                fontSize: 12,
                                color: AppColors.lightGrey,
                                fontWeight: FontWeight.normal,
                              ),
                              SvgPicture.asset(AppAssets.star, height: 14),
                              appText(" ${expert.rating}",
                                  fontSize: 12,
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.normal),
                            ],
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              appText("Exp : ",
                                fontSize: 12,
                                color: AppColors.lightGrey,
                                fontWeight: FontWeight.normal,
                              ),
                              appText("${expert.exp} years",
                                  fontSize: 12,
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.normal),
                            ],
                          ),

                          const SizedBox(height: 4),

                        ],
                      ),
                    ),
                    // const Spacer(),
                    Positioned(
                      bottom: 0, right: 0, left: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(11),),
                          border: Border.all(color: AppColors.cardColor),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            appText(expert.discountPrice, fontSize: 14,
                                color: AppColors.black,
                                fontWeight: FontWeight.bold),

                            const SizedBox(width: 4),
                            appText(expert.originalPrice, fontSize: 14,
                                style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 11)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
