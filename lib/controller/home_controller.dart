

import 'package:astro_sagga/core/utils/common_exports.dart';
import 'package:astro_sagga/model/banner_model.dart';
import 'package:astro_sagga/model/expert_model.dart';
import 'package:astro_sagga/model/service_model.dart';

class HomeController extends GetxController{

  RxInt currentIndex = 0.obs;

  RxDouble walletAmount = 1150.49.obs;

  RxInt notificationCount = 2.obs;

  RxBool isLoading = true.obs;


  setData(){
    ///set service data
    setServices();

    ///set banner data
    setBannerData();

    ///set expertsList data
    setExpertsList();
  }
  getDataDelay(){
    Future.delayed(const Duration(milliseconds: 2500),(){
      isLoading.value = false;
    });
  }

  RxList<ServiceModel> services = <ServiceModel>[].obs;

  setServices(){
    services = [
      ServiceModel(
        icon: AppAssets.matchMaking,
        label: "Match Making",
        color: AppColors.matchMaking,
      ),
      ServiceModel(
        icon: AppAssets.subhMahurat,
        label: "Subh Muhurat",
        color: AppColors.subhMuhrat,
      ),
      ServiceModel(
        icon: AppAssets.horoscope,
        label: "Horoscope",
        color: AppColors.horoscope,
      ),
      ServiceModel(
        icon: AppAssets.kundali,
        label: "Kundali",
        color: AppColors.kundali,
      ),
      ServiceModel(
        icon: AppAssets.videoCall,
        label: "Live Call",
        color: AppColors.primary,
      ),
      ServiceModel(
        icon: AppAssets.support,
        label: "Support",
        color: AppColors.green,
      ),
      ServiceModel(
        icon: AppAssets.wallet,
        label: "Wallet",
        color: AppColors.lightGrey,
      ),
      ServiceModel(
        icon: AppAssets.share,
        label: "Share App",
        color: AppColors.goldenYellow,
      ),
    ].obs;
  }



   RxList<BannerModel> bannersList = <BannerModel>[].obs;

  setBannerData(){
    bannersList = [
      BannerModel(
        text: "Explore your zodiac and cosmic insights live!",
        userName: "Rakesh Kaushik",
        views: "10K",
        image: AppAssets.banner1,
      ),
      BannerModel(
        text: "Find your perfect match based on astrology!",
        userName: "Ravi Kaushik",
        views: "5M",
        image: AppAssets.banner2,
      ),
      BannerModel(
        text: "Unlock your personalized horoscope today!",
        userName: "Neha Sharma",
        views: "2.4K",
        image: AppAssets.banner1,
      ),
      BannerModel(
        text: "Talk to experts live and get real-time guidance.",
        userName: "Ankur Tiwari",
        views: "9K",
        image: AppAssets.banner2,
      ),
      BannerModel(
        text: "Get your daily Kundali predictions instantly.",
        userName: "Divya Mehra",
        views: "1.2M",
        image: AppAssets.banner1,
      ),
      BannerModel(
        text: "What do the stars say about your career?",
        userName: "Sandeep Rathore",
        views: "3.8K",
        image: AppAssets.banner2,
      ),
      BannerModel(
        text: "Shubh Muhurat timings curated by top astrologers.",
        userName: "Megha Joshi",
        views: "800K",
        image: AppAssets.banner1,
      ),
    ].obs;
  }


  RxList<ExpertsModel> expertsList = <ExpertsModel>[].obs;

  setExpertsList(){
    expertsList = [
      ExpertsModel(
        rating: 4.7,
        userName: "Rakesh Kaushik",
        exp: 10,
        discountPrice: "10₹/min",
        originalPrice: "20₹/min",
      ),
      ExpertsModel(
        rating: 4.9,
        userName: "Anjali Sharma",
        exp: 8,
        discountPrice: "15₹/min",
        originalPrice: "25₹/min",
      ),
      ExpertsModel(
        rating: 4.5,
        userName: "Rajiv Bhatia",
        exp: 12,
        discountPrice: "12₹/min",
        originalPrice: "22₹/min",
      ),
      ExpertsModel(
        rating: 4.8,
        userName: "Meena Iyer",
        exp: 6,
        discountPrice: "11₹/min",
        originalPrice: "21₹/min",
      ),
      ExpertsModel(
        rating: 4.6,
        userName: "Nikhil Verma",
        exp: 9,
        discountPrice: "13₹/min",
        originalPrice: "23₹/min",
      ),
      ExpertsModel(
        rating: 4.3,
        userName: "Pooja Rani",
        exp: 7,
        discountPrice: "9₹/min",
        originalPrice: "18₹/min",
      ),
      ExpertsModel(
        rating: 4.4,
        userName: "Sameer Khan",
        exp: 11,
        discountPrice: "14₹/min",
        originalPrice: "24₹/min",
      ),
      ExpertsModel(
        rating: 4.2,
        userName: "Shreya Joshi",
        exp: 5,
        discountPrice: "10₹/min",
        originalPrice: "19₹/min",
      ),
      ExpertsModel(
        rating: 4.1,
        userName: "Amit Desai",
        exp: 13,
        discountPrice: "16₹/min",
        originalPrice: "26₹/min",
      ),
      ExpertsModel(
        rating: 5.0,
        userName: "Divya Menon",
        exp: 14,
        discountPrice: "18₹/min",
        originalPrice: "30₹/min",
      ),
    ].obs;
  }

}