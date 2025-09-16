class Project {
  final String name;
  final String shortDescription;
  final String longDescription;
  final String coverImage; // مسار الصورة أو URL
  final List<String> techStack; // مثلا ['Flutter', 'Firebase', 'API']
  final List<String> galleryImages; // صور إضافية
  final String? liveDemoLink;
  final String? downloadLink;

  Project({
    required this.name,
    required this.shortDescription,
    required this.longDescription,
    required this.coverImage,
    required this.techStack,
    required this.galleryImages,
    this.liveDemoLink,
    this.downloadLink,
  });
}
