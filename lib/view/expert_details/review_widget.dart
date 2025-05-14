

import 'package:astro_sagga/controller/expert_page_controller.dart';
import 'package:astro_sagga/core/utils/common_exports.dart';
import 'package:astro_sagga/model/review_model.dart';
import 'package:astro_sagga/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ReviewWidget extends StatelessWidget {
  final ExpertPageController controller;
  const ReviewWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildReviewHeader(),
        const SizedBox(height: 20),
        _buildReviewCard(),
      ],
    );
  }

  Widget _buildReviewHeader() {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        appText("Users Review (${controller.reviews.length} peoples)",
            fontSize: 16,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold
        ),

        appText("View all",
            fontSize: 16,
            color: AppColors.primary,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w500
        ),
      ],
    );
  }

  Widget _buildReviewCard() {
    return AnimatedListViewBuilder(
      itemCount: controller.reviews.length,
      itemBuilder: (_, i) {
        ReviewModel review = controller.reviews[i];
        return Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            color: AppColors.cardColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              const SizedBox(height: 8),



              appText(review.message,
                fontSize: 16,
                textAlign: TextAlign.start,
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  const CircleAvatar(
                    maxRadius: 15,
                    backgroundColor: AppColors.secondary,
                    child: Icon(Icons.person,
                      size: 18,
                      color: AppColors.black,),
                  ),

                  const SizedBox(width: 12),
                  appText(review.name,
                    fontSize: 12,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(width: 12),
                  appText(review.agoTime,
                    fontSize: 9,
                    color: AppColors.darkGrey,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.start,
                  ),

                  const Spacer(),
                  Row(
                      children: [
                        SvgPicture.asset(AppAssets.star, height: 18),
                        const SizedBox(width: 4),
                        appText("${review.rating}",
                            textAlign: TextAlign.center,
                            fontSize: 16, color: AppColors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ]),

                ],
              ),

            ],
          ),
        );
      },
    );
  }
}


