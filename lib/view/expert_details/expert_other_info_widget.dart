import 'package:astro_sagga/controller/expert_page_controller.dart';
import 'package:astro_sagga/core/utils/common_exports.dart';
import 'package:astro_sagga/model/gift_model.dart';
import 'package:flutter/material.dart';

class ExpertOtherInfoWidget extends StatelessWidget {
  final ExpertPageController controller;
  const ExpertOtherInfoWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        _buildImagesSection(),
        const SizedBox(height: 20),
        _buildSendGiftsSection(),
        const SizedBox(height: 20),
        _buildTextSection("Profile Summary",
            "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, to Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, to....."),
        const SizedBox(height: 20),
        _buildTextSection("Specialization",
            "Expert in Love, Marriage, Career, Bossiness"),
        const SizedBox(height: 20),
        _buildTextSection("Languages",
            "Kannada, Telugu, Tamil, English, Hindi"),
        const SizedBox(height: 20),
      ],
    );
  }


  Widget _buildImagesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appText("Images",
            textAlign: TextAlign.center,
            fontSize: 14, color: AppColors.black,
            fontWeight: FontWeight.bold
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 100,
          child: AnimatedListViewBuilder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.profileImages.length,
            itemBuilder: (_, i) =>
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: AssetImage(controller.profileImages[i]))
                  ),
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildSendGiftsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appText("Send Gifts",
            textAlign: TextAlign.center,
            fontSize: 14, color: AppColors.black,
            fontWeight: FontWeight.bold
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 100,
          child: Obx(() {
            return AnimatedListViewBuilder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.gifts.length,
              itemBuilder: (_, i) {
                GiftModel gift = controller.gifts[i];
                return Container(
                  width: 80,
                  decoration: BoxDecoration(
                    color: AppColors.cardColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(6),
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(gift.icon, color: AppColors.primary,),
                      const SizedBox(height: 4),
                      appText(gift.name,
                        fontSize: 10,
                      ),

                      appText(gift.price,
                        fontSize: 10,
                      ),
                    ],
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }

  Widget _buildTextSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appText(title,
            fontSize: 16,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold
        ),
        const SizedBox(height: 4),
        appText(content,
          fontSize: 14,
          textAlign: TextAlign.start,
          color: AppColors.darkGrey,
        ),

      ],
    );
  }
}
