import '../models/lesson_model.dart';

class SampleData {
  static const List<ClassItem> classes = [
    ClassItem(
      classNumber: 9,
      title: '৯ম শ্রেণি',
      subtitle: 'এসএসসি ভোকেশনাল ও দাখিল',
      isVocational: true,
    ),
    ClassItem(
      classNumber: 10,
      title: '১০ম শ্রেণি',
      subtitle: 'এসএসসি ভোকেশনাল সমাপনী',
      isVocational: true,
    ),
    ClassItem(
      classNumber: 11,
      title: 'একাদশ শ্রেণি',
      subtitle: 'এইচএসসি ভোকেশনাল / বিএমটি',
      isVocational: true,
    ),
    ClassItem(
      classNumber: 12,
      title: 'দ্বাদশ শ্রেণি',
      subtitle: 'এইচএসসি ভোকেশনাল সমাপনী',
      isVocational: true,
    ),
    ClassItem(
      classNumber: 6,
      title: '৬ষ্ঠ শ্রেণি',
      subtitle: 'সাধারণ গণিত ও বিজ্ঞান',
      isVocational: false,
    ),
    ClassItem(
      classNumber: 7,
      title: '৭ম শ্রেণি',
      subtitle: 'সাধারণ গণিত ও বিজ্ঞান',
      isVocational: false,
    ),
    ClassItem(
      classNumber: 8,
      title: '৮ম শ্রেণি',
      subtitle: 'বিজ্ঞান ও গণিত প্রস্তুতি',
      isVocational: false,
    ),
  ];

  static const List<SubjectItem> commonSubjects = [
    SubjectItem(
      id: 'phy',
      name: 'পদার্থবিজ্ঞান',
      icon: '⚛️',
      description: 'ভোকেশনাল কারিকুলাম পদার্থবিজ্ঞান (থিওরি ও ব্যবহারিক)',
    ),
    SubjectItem(
      id: 'chem',
      name: 'রসায়ন বিজ্ঞান',
      icon: '🧪',
      description: 'সাধারণ রসায়ন ও ল্যাব টেস্ট',
    ),
    SubjectItem(
      id: 'math',
      name: 'সাধারণ গণিত',
      icon: '📐',
      description: 'বীজগণিত, জ্যামিতি ও ত্রিকোণমিতি',
    ),
    SubjectItem(
      id: 'bangla',
      name: 'বাংলা',
      icon: '📖',
      description: 'বাংলা সাহিত্য ও ব্যাকরণ (১ম ও ২য় পত্র)',
    ),
    SubjectItem(
      id: 'english',
      name: 'ইংরেজি',
      icon: '🔤',
      description: 'English for Today & Communicative Grammar',
    ),
    SubjectItem(
      id: 'religion',
      name: 'ধর্ম ও নৈতিক শিক্ষা',
      icon: '🕌',
      description: 'ইসলাম ও নৈতিক শিক্ষা / অন্যান্য ধর্ম',
    ),
  ];

  static const List<SubjectItem> trades = [
    SubjectItem(
      id: 'trade_elec',
      name: 'ইলেকট্রিক্যাল',
      icon: '⚡',
      isTrade: true,
      tradeCategory: 'General Electrical Works',
      description: 'হাউজ ওয়্যারিং, সার্কিট, ট্রান্সফরমার ও ইলেকট্রিক্যাল মেইনটেন্যান্স',
    ),
    SubjectItem(
      id: 'trade_iot',
      name: 'আইওটি বেসিকস',
      icon: '💻',
      isTrade: true,
      tradeCategory: 'IoT Basics & Computer',
      description: 'কম্পিউটার ফান্ডামেন্টালস, মাইক্রোকন্ট্রোলার ও আইওটি অ্যাপ্লিকেশন',
    ),
    SubjectItem(
      id: 'trade_machine',
      name: 'মেশিন',
      icon: '🔧',
      isTrade: true,
      tradeCategory: 'Machine Tools Operation',
      description: 'লেদ মেশিন, ফিটিং, ড্রিলিং, শেপিং ও মেকানিক্যাল টুলস',
    ),
    SubjectItem(
      id: 'trade_civil',
      name: 'সিভিল',
      icon: '🏗️',
      isTrade: true,
      tradeCategory: 'Civil Construction',
      description: 'বিল্ডিং ড্রয়িং, সার্ভেইং, রাজমিস্ত্রি কাজ ও কনস্ট্রাকশন এস্টিমেটিং',
    ),
  ];

  static const List<ChapterItem> physicsChapters = [
    ChapterItem(
      id: 'ch_1',
      number: '০১',
      title: 'ভৌত রাশি এবং পরিমাপ',
      summary: 'ভৌত রাশি, মাত্রা সমীকরণ, স্লাইড ক্যালিপার্স ও স্ক্রু গজ',
      lessons: [
        LessonItem(
          id: 'l_1_1',
          title: 'লেকচার ১: রাশি ও এককের আন্তর্জাতিক পদ্ধতি (SI)',
          youtubeVideoId: 'dQw4w9WgXcQ',
          pdfUrl: 'https://drive.google.com/',
          duration: '১৫:২০ মিনিট',
        ),
        LessonItem(
          id: 'l_1_2',
          title: 'লেকচার ২: স্লাইড ক্যালিপার্স ও ভার্নিয়ার ধ্রুবক নির্ণয়',
          youtubeVideoId: 'dQw4w9WgXcQ',
          pdfUrl: 'https://drive.google.com/',
          duration: '১৮:৪৫ মিনিট',
        ),
        LessonItem(
          id: 'l_1_3',
          title: 'লেকচার ৩: স্ক্রু গজ ও পরিমাপে যান্ত্রিক ত্রুটি',
          youtubeVideoId: 'dQw4w9WgXcQ',
          pdfUrl: 'https://drive.google.com/',
          duration: '১২:১০ মিনিট',
        ),
      ],
    ),
    ChapterItem(
      id: 'ch_2',
      number: '০২',
      title: 'গতি (Motion)',
      summary: 'দূরত্ব, সরণ, দ্রুতি, বেগ, ত্বরণ ও গতির গাণিতিক সমীকরণ',
      lessons: [
        LessonItem(
          id: 'l_2_1',
          title: 'লেকচার ১: সরণ, দ্রুতি ও বেগের সুস্পষ্ট ধারণা',
          youtubeVideoId: 'dQw4w9WgXcQ',
          pdfUrl: 'https://drive.google.com/',
          duration: '১৪:৩০ মিনিট',
        ),
        LessonItem(
          id: 'l_2_2',
          title: 'লেকচার ২: গতির ৪টি মৌলিক সমীকরণ প্রমাণ ও প্রয়োগ',
          youtubeVideoId: 'dQw4w9WgXcQ',
          pdfUrl: 'https://drive.google.com/',
          duration: '২০:১৫ মিনিট',
        ),
      ],
    ),
    ChapterItem(
      id: 'ch_3',
      number: '০৩',
      title: 'বল (Force)',
      summary: 'নিউটনের তিনটি গতিসূত্র, জড়তা, ভরবেগ ও ঘর্ষণ বল',
      lessons: [
        LessonItem(
          id: 'l_3_1',
          title: 'লেকচার ১: নিউটনের প্রথম ও দ্বিতীয় গতিসূত্র (F = ma)',
          youtubeVideoId: 'dQw4w9WgXcQ',
          pdfUrl: 'https://drive.google.com/',
          duration: '১৬:০০ মিনিট',
        ),
      ],
    ),
    ChapterItem(
      id: 'ch_4',
      number: '০৪',
      title: 'কাজ, ক্ষমতা ও শক্তি',
      summary: 'কাজ, গতিশক্তি, বিভবশক্তি, শক্তির সংরক্ষণশীলতা নীতি ও কর্মদক্ষতা',
      lessons: [
        LessonItem(
          id: 'l_4_1',
          title: 'লেকচার ১: কাজ ও শক্তির রূপান্তর',
          youtubeVideoId: 'dQw4w9WgXcQ',
          pdfUrl: 'https://drive.google.com/',
          duration: '১৫:১০ মিনিট',
        ),
      ],
    ),
    ChapterItem(
      id: 'ch_5',
      number: '০৫',
      title: 'পদার্থের অবস্থা ও চাপ',
      summary: 'চাপ, ঘনত্ব, আর্কিমিডিসের সূত্র, প্লবতা ও প্যাসকেলের সূত্র',
      lessons: [
        LessonItem(
          id: 'l_5_1',
          title: 'লেকচার ১: ঘনত্ব, চাপ ও তরলের গভীরতায় চাপ নির্ণয়',
          youtubeVideoId: 'dQw4w9WgXcQ',
          pdfUrl: 'https://drive.google.com/',
          duration: '১৭:৪৫ মিনিট',
        ),
      ],
    ),
  ];
}
