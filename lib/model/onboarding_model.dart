class OnboardingModel {
  final String title;
  final String image;
  final String desc;

  OnboardingModel({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingModel> contents = [
  OnboardingModel(
    title: "Welcome to UMPSA Scheduler",
    image: "assets/images/image1.png",
    desc: "Organize your academic journey effortlessly",
  ),
  OnboardingModel(
    title: "Tailored Schedules, Effortlessly Generated",
    image: "assets/images/image2.png",
    desc:
        "Experience hassle-free scheduling based on your chosen courses fetched from Open Registration (OR) system",
  ),
  OnboardingModel(
    title: "Find and Add Courses Instantly",
    image: "assets/images/image3.png",
    desc:
        "Discover and add desired courses swiftly with our intuitive search function",
  ),
];
