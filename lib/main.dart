import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.light,
        ),
      ),
      home: const GmailHome(),
    );
  }
}

class Email {
  final String sender;
  final String subject;
  final String snippet;
  final String date;
  final Color avatarColor;
  final bool isRead;
  final bool hasAttachment;
  bool isStarred;

  Email({
    required this.sender,
    required this.subject,
    required this.snippet,
    required this.date,
    required this.avatarColor,
    this.isRead = false,
    this.hasAttachment = false,
    this.isStarred = false,
  });
}

class GmailHome extends StatefulWidget {
  const GmailHome({super.key});

  @override
  State<GmailHome> createState() => _GmailHomeState();
}

class _GmailHomeState extends State<GmailHome> {
  final List<Email> emails = [
    Email(
      sender: 'GitHub',
      subject: 'Security alert for your repository',
      snippet:
          'We noticed a new authentication method was added to your account. If this wasn\'t you, please review your security settings immediately.',
      date: '15:42',
      avatarColor: Colors.grey.shade800,
      isRead: false,
    ),
    Email(
      sender: 'Alice Freeman',
      subject: 'Meeting notes from today',
      snippet:
          'Hey! Attached are the notes from our standup. Let me know if you need anything else for the sprint planning tomorrow.',
      date: '14:20',
      avatarColor: Colors.purple,
      isRead: false,
      hasAttachment: true,
    ),
    Email(
      sender: 'LinkedIn',
      subject: 'You have 5 new notifications',
      snippet:
          'See what your network has been up to. John Doe and 3 others viewed your profile this week.',
      date: '11:30',
      avatarColor: Colors.blue.shade700,
      isRead: true,
    ),
    Email(
      sender: 'Amazon',
      subject: 'Your order has shipped',
      snippet:
          'Your package will arrive tomorrow by 8 PM. Track your delivery in real-time using the link below.',
      date: 'Yesterday',
      avatarColor: Colors.orange.shade800,
      isRead: true,
    ),
    Email(
      sender: 'Spotify',
      subject: 'Your 2024 Wrapped is here',
      snippet:
          'Your year in review is ready! Discover your top artists, songs, and podcasts from this year.',
      date: 'Yesterday',
      avatarColor: Colors.green.shade600,
      isRead: true,
    ),
    Email(
      sender: 'Figma',
      subject: 'Comment on "Mobile App Design"',
      snippet:
          'Sarah left a comment: "Can we try a darker shade for the primary button? The contrast seems off."',
      date: 'Nov 28',
      avatarColor: Colors.red.shade400,
      isRead: true,
      isStarred: true,
    ),
    Email(
      sender: 'Uber Receipts',
      subject: 'Your trip with Uber',
      snippet:
          'Thanks for riding with Uber. Your total fare was \$24.50. View full trip details in the app.',
      date: 'Nov 27',
      avatarColor: Colors.black,
      isRead: true,
    ),
    Email(
      sender: 'Notion',
      subject: 'You were mentioned in "Q4 Roadmap"',
      snippet:
          '@channel Please review the new timeline for the Q4 deliverables. We need feedback by Friday.',
      date: 'Nov 26',
      avatarColor: Colors.grey.shade700,
      isRead: false,
      hasAttachment: true,
    ),
  ];

  String _getInitials(String name) {
    return name.split(' ').map((n) => n[0]).take(2).join().toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black54),
          onPressed: () {},
        ),
        title: Container(
          height: 48,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              const SizedBox(width: 12),
              const Icon(Icons.search, color: Colors.black54),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Search in mail',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              CircleAvatar(
                radius: 14,
                backgroundColor: Colors.blue.shade100,
                child: const Text(
                  'A',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black54),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: emails.length,
        separatorBuilder: (context, index) => const SizedBox(height: 0),
        itemBuilder: (context, index) {
          final email = emails[index];
          return InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: email.avatarColor,
                    child: Text(
                      _getInitials(email.sender),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                email.sender,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: email.isRead
                                      ? FontWeight.w500
                                      : FontWeight.bold,
                                  color: Colors.black87,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              email.date,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: email.isRead
                                    ? FontWeight.normal
                                    : FontWeight.bold,
                                color: email.isRead
                                    ? Colors.grey.shade600
                                    : Colors.blue.shade700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                email.subject,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: email.isRead
                                      ? FontWeight.normal
                                      : FontWeight.bold,
                                  color: Colors.black87,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            if (email.hasAttachment)
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Icon(
                                  Icons.attachment,
                                  size: 16,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                email.snippet,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                  height: 1.3,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  email.isStarred = !email.isStarred;
                                });
                              },
                              child: Icon(
                                email.isStarred
                                    ? Icons.star
                                    : Icons.star_border,
                                color: email.isStarred
                                    ? Colors.amber
                                    : Colors.grey.shade400,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.white,
        foregroundColor: Colors.red.shade700,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        icon: const Icon(Icons.edit),
        label: const Text(
          'Compose',
          style: TextStyle(fontWeight: FontWeight.w500, letterSpacing: 0.5),
        ),
      ),
    );
  }
}