class ClassItem {
  final int classNumber;
  final String title;
  final String subtitle;
  final bool isVocational;

  const ClassItem({
    required this.classNumber,
    required this.title,
    required this.subtitle,
    this.isVocational = true,
  });
}

class SubjectItem {
  final String id;
  final String name;
  final String icon;
  final bool isTrade;
  final String? tradeCategory;
  final String description;

  const SubjectItem({
    required this.id,
    required this.name,
    required this.icon,
    this.isTrade = false,
    this.tradeCategory,
    required this.description,
  });
}

class ChapterItem {
  final String id;
  final String number;
  final String title;
  final String summary;
  final List<LessonItem> lessons;

  const ChapterItem({
    required this.id,
    required this.number,
    required this.title,
    required this.summary,
    required this.lessons,
  });
}

class LessonItem {
  final String id;
  final String title;
  final String youtubeVideoId;
  final String pdfUrl;
  final String duration;

  const LessonItem({
    required this.id,
    required this.title,
    required this.youtubeVideoId,
    required this.pdfUrl,
    required this.duration,
  });
}
