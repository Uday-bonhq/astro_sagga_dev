import 'package:astro_sagga/core/utils/common_exports.dart';
import 'package:astro_sagga/model/expert_model.dart';
import 'package:astro_sagga/model/gift_model.dart';
import 'package:astro_sagga/model/packge_model.dart';
import 'package:astro_sagga/model/review_model.dart';
import 'package:flutter/cupertino.dart';

class ExpertPageController extends GetxController {

  Rx<ExpertsModel>? expert;

  RxBool isLoading = true.obs;
  RxBool isFollow = false.obs;

  getData() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      isLoading.value = false;
    });
  }

  RxList<String> profileImages = [
    AppAssets.profile1,
    AppAssets.profile2,
    AppAssets.profile3,
    AppAssets.profile4,
  ].obs;

  RxList<GiftModel> gifts = [
    GiftModel(name: "Pooja", price: "₹ 47", icon: CupertinoIcons.wand_rays_inverse),
    GiftModel(name: "Heart", price: "₹ 23", icon: CupertinoIcons.heart_fill),
    GiftModel(name: "Badge", price: "₹ 68", icon: CupertinoIcons.rosette),
    GiftModel(name: "Gem", price: "₹ 85", icon: CupertinoIcons.staroflife_fill),
  ].obs;

  RxList<PackageModel> packageList = [
    PackageModel(name: "chat", price: "10₹/min", icon: AppAssets.bubbleChat),
    PackageModel(name: "phone", price: "15₹/min", icon: AppAssets.phone),
    PackageModel(name: "video", price: "20₹/min", icon: AppAssets.videoCall),
  ].obs;


  final List<ReviewModel> reviews = [
    ReviewModel(
      name: "Amit Deshmukh",
      rating: 4.6,
      message: "Detailed analysis and accurate timeline predictions.",
      agoTime: "30 minutes ago",
    ),
    ReviewModel(
      name: "Anjali Sharma",
      rating: 4.7,
      message: "Very helpful and kind astrologer. Gave accurate predictions.",
      agoTime: "2 hours ago",
    ),
    ReviewModel(
      name: "Karan Sinha",
      rating: 4.2,
      message: "Good guidance and practical advice. Will consult again.",
      agoTime: "5 hours ago",
    ),
    ReviewModel(
      name: "Rahul Mehta",
      rating: 4.5,
      message: "Straightforward and insightful. Helped clear my doubts.",
      agoTime: "1 day ago",
    ),
    ReviewModel(
      name: "Pooja Verma",
      rating: 5.0,
      message: "Amazing experience! The reading was spot on.",
      agoTime: "3 days ago",
    ),

    ReviewModel(
      name: "Sneha Pillai",
      rating: 4.8,
      message: "Very calming and reassuring, highly recommended.",
      agoTime: "6 days ago",
    ),

  ];


}
