import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/lesson_model.dart';

class LessonViewerScreen extends StatefulWidget {
  final ChapterItem chapter;
  final String subjectName;

  const LessonViewerScreen({
    super.key,
    required this.chapter,
    required this.subjectName,
  });

  @override
  State<LessonViewerScreen> createState() => _LessonViewerScreenState();
}

class _LessonViewerScreenState extends State<LessonViewerScreen> {
  late YoutubePlayerController _youtubeController;
  late LessonItem _selectedLesson;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _selectedLesson = widget.chapter.lessons.first;

    _youtubeController = YoutubePlayerController(
      initialVideoId: _selectedLesson.youtubeVideoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        enableCaption: true,
      ),
    )..addListener(_listener);
  }

  void _listener() {
    if (_isPlayerReady && mounted && !_youtubeController.value.isFullScreen) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  void _changeLesson(LessonItem lesson) {
    setState(() {
      _selectedLesson = lesson;
    });
    _youtubeController.load(lesson.youtubeVideoId);
  }

  Future<void> _openPdf(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('পিডিএফ লিংকটি খুলতে সমস্যা হচ্ছে')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.chapter.title),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.play_circle_fill), text: 'ভিডিও ক্লাস'),
              Tab(icon: Icon(Icons.picture_as_pdf), text: 'লেকচার শিট (PDF)'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Video Player & Playlist
            _buildVideoTab(),

            // Tab 2: PDF Notes
            _buildPdfTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoTab() {
    return Column(
      children: [
        // YouTube Player
        YoutubePlayer(
          controller: _youtubeController,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.red,
          progressColors: const ProgressBarColors(
            playedColor: Colors.red,
            handleColor: Colors.redAccent,
          ),
          onReady: () {
            setState(() {
              _isPlayerReady = true;
            });
          },
        ),

        // Video Info & Playlist
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                _selectedLesson.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.schedule, size: 14, color: Colors.grey.shade600),
                  const SizedBox(width: 4),
                  Text(
                    _selectedLesson.duration,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                  const SizedBox(width: 12),
                  const Icon(Icons.verified, size: 14, color: Colors.indigo),
                  const SizedBox(width: 4),
                  const Text(
                    'পদার্থবিজ্ঞান শিক্ষক',
                    style: TextStyle(fontSize: 12, color: Colors.indigo),
                  ),
                ],
              ),
              const Divider(height: 24),
              const Text(
                'এই অধ্যায়ের অন্যান্য ভিডিও ক্লাস:',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ...widget.chapter.lessons.map((lesson) {
                final isSelected = lesson.id == _selectedLesson.id;
                return Card(
                  color: isSelected ? Colors.indigo.shade50 : null,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: isSelected
                          ? Colors.indigo.shade300
                          : Colors.grey.withOpacity(0.15),
                    ),
                  ),
                  child: ListTile(
                    dense: true,
                    leading: Icon(
                      isSelected
                          ? Icons.play_circle_filled
                          : Icons.play_circle_outline,
                      color: isSelected ? Colors.indigo : Colors.grey,
                    ),
                    title: Text(
                      lesson.title,
                      style: TextStyle(
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected ? Colors.indigo.shade900 : null,
                      ),
                    ),
                    trailing: Text(
                      lesson.duration,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    onTap: () => _changeLesson(lesson),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPdfTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.red.shade100),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: const Text('📑', style: TextStyle(fontSize: 24)),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.chapter.title} - সম্পূর্ণ হ্যান্ডনোট',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'গুগল ড্রাইভে সংরক্ষিত (ফ্রি অ্যাক্সেস)',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'নোটটিতে কী কী আছে:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                const SizedBox(height: 6),
                const Text('• গুরুত্বপূর্ণ সংজ্ঞা ও সূত্রাবলী'),
                const Text('• মাত্রা সমীকরণ ও একক নির্ণয়'),
                const Text('• বোর্ড পরীক্ষার গাণিতিক উদাহরণ সমাধান'),
                const Text('• বহুনির্বাচনী (MCQ) স্পেশাল টিপস'),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade700,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(Icons.picture_as_pdf),
                    label: const Text(
                      'পিডিএফ পড়ুন অথবা ডাউনলোড করুন',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => _openPdf(_selectedLesson.pdfUrl),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
