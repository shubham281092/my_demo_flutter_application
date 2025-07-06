import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ajman Bank UI',
      theme: ThemeData.dark(),
      home: const AjmanBankHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AjmanBankHome extends StatefulWidget {
  const AjmanBankHome({super.key});

  @override
  State<AjmanBankHome> createState() => _AjmanBankHomeState();
}

class _AjmanBankHomeState extends State<AjmanBankHome> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int _currentIndex = 0;

  final List<Map<String, String>> carLoanCards = const [
    {
      'title': 'Apply for Car Loan',
      'desc': 'Auto finance at 2.24%.\nFast approval.',
      'image': 'https://via.placeholder.com/90x90.png?text=Man',
    },
    {
      'title': 'Exclusive Offers',
      'desc': 'Low interest rates for new cars.',
      'image': 'https://via.placeholder.com/90x90.png?text=Offer',
    },
    {
      'title': 'Quick Approval',
      'desc': 'Get approved in 24 hours.',
      'image': 'https://via.placeholder.com/90x90.png?text=Fast',
    },
  ];

  final List<Map<String, String>> allCards = const [
    {
      'title': 'Credit Card',
      'desc': ' ICICI Visa ending with 1234',
      'amount': '\u20b912,340',
    },
    {
      'title': 'Internet',
      'desc':
          'ACT Fibernet 150 Mbps Plan ACT Fibernet 150 Mbps ACT Fibernet 150 Mbps Plan ACT Fibernet 150 Mbps',
      'amount': '\u20b91,000',
    },
    {
      'title': 'Loan EMI',
      'desc':
          'Home loan EMI due soon CT Fibernet 150 Mbps Plan ACT Fibernet 150 Mbps ACT Fibernet 150 Mbps Plan ACT',
      'amount': '\u20b925,000',
    },
    {
      'title': 'Amazon Prime',
      'desc':
          'Annual plan expiring soon ACT Fibernet 150 Mbps Plan ACT Fibernet 150 Mbps',
      'amount': '\u20b91,499',
    },
    {
      'title': 'Insurance',
      'desc':
          'Test Car insurance renewal due CT Fibernet 150 Mbps Plan ACT Fibernet 150 Mbps ACT Fibernet 150 Mbps Plan ACT',
      'amount': '\u20b99,200',
    },
    {
      'title': 'Zomato Gold',
      'desc': 'Dining subscription w/ free delivery.',
      'amount': '\u20b9299',
    },
    {
      'title': 'Groceries',
      'desc':
          'Monthly food and household items CT Fibernet 150 Mbps Plan ACT Fibernet 150 Mbps ACT Fibernet 150 Mbps Plan ACT',
      'amount': '\u20b95,200',
    },
    {
      'title': 'Electricity',
      'desc': 'Bill due in 3 days. Pay soon.',
      'amount': '\u20b91,200',
    },
    {
      'title': 'Netflix',
      'desc': 'Monthly subscription plan',
      'amount': '\u20b9499',
    },
    {
      'title': 'Water Tax',
      'desc': 'Quarterly water tax.',
      'amount': '\u20b9850',
    },
    {
      'title': 'Credit Card',
      'desc': 'ICICI Visa ending with 1234',
      'amount': '\u20b912,340',
    },
    {
      'title': 'Internet',
      'desc': 'ACT Fibernet 150 Mbps Plan',
      'amount': '\u20b91,000',
    },
    {
      'title': 'Loan EMI',
      'desc': 'Home loan EMI due soon',
      'amount': '\u20b925,000',
    },
    {
      'title': 'Amazon Prime',
      'desc': 'Annual plan expiring soon',
      'amount': '\u20b91,499',
    },
    {
      'title': 'Insurance',
      'desc': 'Car insurance renewal due Monthly food and household Plan ACT Fibernet 150 Mbps ACT Fibernet 150 Mbps Plan ACT',
      'amount': '\u20b99,200',
    },
    {
      'title': 'Zomato Gold',
      'desc': 'Dining subscription w/ free delivery.',
      'amount': '\u20b9299',
    },
  ];

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.black,
    body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CircleAvatar(radius: 20, backgroundColor: Colors.amber),
              Icon(Icons.notifications_none, color: Colors.white, size: 28),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                '\u20bf 984,101',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              Text(
                '.70',
                style: TextStyle(fontSize: 20, color: Colors.white70),
              ),
              Spacer(),
              Icon(Icons.remove_red_eye_outlined, color: Colors.white70),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.search, color: Colors.white70),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _actionChip('+'),
              _actionChip('Transfer to Contact'),
              _actionChip('Pay Bills'),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 180,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: carLoanCards.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final card = carLoanCards[index];
                    return Container(
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF313C55),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  card['title']!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  card['desc']!,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: const Text('Apply now'),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: const CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 8,
                  left: 16,
                  child: Row(
                    children: List.generate(
                      carLoanCards.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? Colors.orange
                              : Colors.white30,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: allCards.length,
            itemBuilder: (context, index) {
              final card = allCards[index];
              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      card['title'] ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.teal[700],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            card['desc'] ?? '',
                            style: const TextStyle(color: Colors.white70),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            card['amount'] ?? '',
                            style: const TextStyle(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.deepOrange[400],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Invite friends",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.close, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Receive rewards points for invited friends",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.deepOrange,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      "Invite Now",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    bottomNavigationBar: Container(
  decoration: BoxDecoration(
    color: Colors.black,
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(24),
      topRight: Radius.circular(24),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withAlpha(25),
        blurRadius: 10,
        offset: const Offset(0, -1),
      ),
    ],
  ),
  child: BottomNavigationBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    currentIndex: _currentIndex,
    onTap: (index) {
      setState(() {
        _currentIndex = index;
      });
    },
    selectedItemColor: Colors.orange,
    unselectedItemColor: Colors.white,
    selectedFontSize: 12,
    unselectedFontSize: 12,
    type: BottomNavigationBarType.fixed,
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.compare_arrows),
        label: 'Payments',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.card_giftcard),
        label: 'Rewards',
      ),
    ],
  ),
),

  );
}


  Widget _actionChip(String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(label),
        labelStyle: const TextStyle(color: Colors.white),
        backgroundColor: Colors.grey[850],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
