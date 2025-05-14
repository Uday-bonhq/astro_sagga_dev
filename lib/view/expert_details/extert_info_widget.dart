
import 'package:astro_sagga/controller/expert_page_controller.dart';
import 'package:astro_sagga/core/utils/common_exports.dart';
import 'package:flutter/material.dart';



class ExpertInfoWidget extends StatelessWidget {
  final ExpertPageController controller;
  const ExpertInfoWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return _buildBasicInfoCard();
  }

  Widget _buildBasicInfoCard() {
    return Stack(
      children: [

        Container(
          width: Get.width,
          height: Get.height * 0.32,

          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: AppColors.cardColor.withOpacity(0.2),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(AppAssets.astrologer))
          ),
        ),


        Padding(
          padding: EdgeInsets.only(top: Get.height * 0.20,),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: appText(controller.expert?.value.userName ?? "",
                    textAlign: TextAlign.center,
                    fontSize: 22,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: const Offset(2, 3),
                        blurRadius: 2,
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                // padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppColors.lightCard,
                    borderRadius: BorderRadius.circular(11),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(2, 3),
                        blurRadius: 2,
                        color: Colors.black.withOpacity(0.15),
                      ),
                    ]
                ),
                child: Column(
                  children: [

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      decoration: const BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(11),),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                              children: [
                                SvgPicture.asset(AppAssets.star, height: 18),
                                const SizedBox(width: 4),
                                appText(
                                    "${controller.expert?.value.rating ?? ""}",
                                    textAlign: TextAlign.center,
                                    fontSize: 16, color: AppColors.black,
                                    fontWeight: FontWeight.bold
                                ),
                                appText(" Rating",
                                    textAlign: TextAlign.center,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal
                                ),
                              ]),
                          Row(children: [
                            const SizedBox(width: 4),
                            appText("${controller.expert?.value.exp ?? ""}",
                                textAlign: TextAlign.center,
                                fontSize: 16, color: AppColors.black,
                                fontWeight: FontWeight.bold
                            ),
                            appText(" Experience",
                                textAlign: TextAlign.center,
                                fontSize: 12,
                                fontWeight: FontWeight.normal
                            ),
                          ]),
                          Row(children: [
                            const SizedBox(width: 4),
                            appText("10K",
                                textAlign: TextAlign.center,
                                fontSize: 16, color: AppColors.black,
                                fontWeight: FontWeight.bold
                            ),
                            appText(" Followers",
                                textAlign: TextAlign.center,
                                fontSize: 12,
                                fontWeight: FontWeight.normal
                            ),
                          ]),
                        ],
                      ),
                    ),


                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(children: [
                          SvgPicture.asset(AppAssets.phone,
                              color: AppColors.primary,
                              height: 18),
                          const SizedBox(width: 4),

                          appText("10k",
                              textAlign: TextAlign.center,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                          appText(" mins",
                              textAlign: TextAlign.center,
                              fontSize: 12,
                              fontWeight: FontWeight.normal
                          ),
                        ]),
                        Row(children: [
                          SvgPicture.asset(AppAssets.bubbleChat,
                              color: AppColors.primary,
                              height: 18),
                          const SizedBox(width: 4),

                          appText("22k",
                              textAlign: TextAlign.center,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                          appText(" mins",
                              textAlign: TextAlign.center,
                              fontSize: 12,
                              fontWeight: FontWeight.normal
                          ),
                        ]),
                        MaterialButton(
                          onPressed: () {
                            controller.isFollow.value =
                            controller.isFollow.value == true ? false : true;
                            Toast.show(controller.isFollow.value == true
                                ? "Started Following!!"
                                : "Unfollow user successfully");
                          },
                          color: AppColors.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)
                          ),
                          child: Obx(() {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18.0),
                              child: appText(
                                  controller.isFollow.value ? "Following" :
                                  "Follow",
                                  textAlign: TextAlign.center,
                                  fontSize: 14,
                                  color: AppColors.goldenYellow,
                                  fontWeight: FontWeight.bold
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
