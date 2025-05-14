import 'package:astro_sagga/controller/expert_page_controller.dart';
import 'package:astro_sagga/core/utils/common_exports.dart';
import 'package:astro_sagga/model/expert_model.dart';
import 'package:astro_sagga/model/packge_model.dart';
import 'package:astro_sagga/view/expert_details/expert_other_info_widget.dart';
import 'package:astro_sagga/view/expert_details/extert_info_widget.dart';
import 'package:astro_sagga/view/expert_details/review_widget.dart';
import 'package:flutter/material.dart';


class ExpertDetailsScreen extends StatefulWidget {
  final ExpertsModel expert;

  const ExpertDetailsScreen({super.key, required this.expert,});

  @override
  State<ExpertDetailsScreen> createState() => _ExpertDetailsScreenState();
}

class _ExpertDetailsScreenState extends State<ExpertDetailsScreen> {

  final ExpertPageController controller = Get.put(ExpertPageController());

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.expert?.value = widget.expert;
      controller.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Row(
          children: [
            appText(widget.expert.userName,
              textAlign: TextAlign.center,
              fontSize: 22,
              color: AppColors.white,
            ),
            const SizedBox(width: 8),
            const CircleAvatar(radius: 5, backgroundColor: AppColors.green),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(AppAssets.backIcon,
            color: AppColors.white,
          ),),
        actions: [
          IconButton(
            onPressed: () {
              shareApp();
            },
            icon: SvgPicture.asset(AppAssets.share,
              color: AppColors.white,
            ),
          ),
          const SizedBox(width: 18),
          SvgPicture.asset(AppAssets.moreVertical,
            color: AppColors.white,
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Obx(() {
          return SkeletonSimmer(
            isLoading: controller.isLoading.value,
            child: Column(
              children: [
                ExpertInfoWidget(controller: controller),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AnimatedColumn(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      ExpertOtherInfoWidget(controller: controller),

                      _buildChatButton(),
                      const SizedBox(height: 20),
                      ReviewWidget(controller: controller),
                      const SizedBox(height: 150),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
      bottomSheet: _buildBottomActions(),
    );
  }



  Widget _buildChatButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.cardColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          SvgPicture.asset(AppAssets.support,
              color: AppColors.black,
              height: 24),
          const SizedBox(width: 12),
          Expanded(
            child: appText("Chat With Assistant",
                fontSize: 16,
                color: AppColors.black,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w500
            ),),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }


  Widget _buildBottomActions() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: AnimatedListViewBuilder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.packageList.length,
        itemBuilder: (_, i) {
          PackageModel package = controller.packageList[i];
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    package.icon,
                    color: AppColors.white,
                  ),
                  const SizedBox(width: 4,),
                  Text(
                    package.price,
                    style: const TextStyle(
                        color: AppColors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              )
          );
        }, )
    );
  }
}
