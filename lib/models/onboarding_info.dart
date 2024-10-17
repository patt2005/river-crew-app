class OnboardingInfo {
  final String title;
  final String description;
  final String imageAssetPath;
  final String buttonText;

  OnboardingInfo({
    required this.title,
    required this.description,
    required this.imageAssetPath,
    required this.buttonText,
  });
}

List<OnboardingInfo> onboardingInfos = [
  OnboardingInfo(
    title: "Daily Tips",
    description:
        "Receive a daily kayaking tip to improve your skills and ensure a safe adventure on the water.",
    imageAssetPath: "images/onboarding1.png",
    buttonText: "Next",
  ),
  OnboardingInfo(
    title: "Explore Categories",
    description:
        "Browse through various categories such as Safety, Techniques, Equipment, and more to find the tips you need.",
    imageAssetPath: "images/onboarding2.png",
    buttonText: "Next",
  ),
  OnboardingInfo(
    title: "Save Your Favorites",
    description:
        "Bookmark your favorite tips for quick access anytime you need them.",
    imageAssetPath: "images/onboarding3.png",
    buttonText: "Next",
  ),
  OnboardingInfo(
    title: "Share with Friends",
    description:
        "Share your favorite tips with friends and fellow kayakers to help them stay safe and informed.",
    imageAssetPath: "images/onboarding4.png",
    buttonText: "Next",
  ),
  OnboardingInfo(
    title: "Start Exploring",
    description:
        "Dive into the world of kayaking tips and enjoy your adventures on the water.",
    imageAssetPath: "images/onboarding5.png",
    buttonText: "Let`s go!",
  ),
];
