import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavigationApp(),
    );
  }
}

class NavigationApp extends StatefulWidget {
  @override
  _NavigationAppState createState() => _NavigationAppState();
}

class _NavigationAppState extends State<NavigationApp> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Perform some action based on the selected tab
    switch (index) {
      case 0:
        print('Data Diri tab pressed');
        // Add your action for Data Diri tab press
        break;
      case 1:
        print('Riwayat Pekerjaan tab pressed');
        // Add your action for Riwayat Pekerjaan tab press
        break;
      case 2:
        print('Data Pendidikan tab pressed');
        // Add your action for Data Pendidikan tab press
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title: Text('Emergency Response (Covid-19)'),
        actions: [
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree_rounded),
            label: 'Fitur',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_sharp),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Halo, Muhamad Irfan Aldiansyah',
          style: TextStyle(color: Colors.white), // Set the text color
        ),
        backgroundColor: Colors.cyan, // Set to the primary color
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle the tap on the notification icon
              print('Notification icon pressed');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20), // Adjust the spacing between the top and the text
            Text(
              'Masuk ke Ruang Publik?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10), // Adjust the spacing between the text and buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle the first button press
                      print('Atur Check-in Pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan, // Set the background color for the first button
                    ),
                    child: Text('Atur Check-in'),
                  ),
                ),
                SizedBox(width: 10), // Adjust the spacing between the buttons
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle the second button press
                      print('Check-in Pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan, // Set the background color for the second button
                    ),
                    child: Text('Check-in'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Announcement\n',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 150,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView(
                    controller: _pageController,
                    children: [
                      Image.network(
                        'https://rsjd-surakarta.jatengprov.go.id/wp-content/uploads/2020/05/Wajib-Masker-1024x652.jpeg',
                        height: 150,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        'https://covid19.go.id/storage/app/media/slider/faskesvaksin.jpeg',
                        height: 150,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        'https://dinkes.tanahlautkab.go.id/asset/foto_berita/upload_1630511712.jpg',
                        height: 150,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 10,
                    child: PageIndicator(
                      controller: _pageController,
                      itemCount: 3, // Number of pages
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  final PageController controller;
  final int itemCount;

  PageIndicator({required this.controller, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(itemCount, (index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (index == controller.page?.round()) ? Colors.blue : Colors.grey,
            ),
          );
        }),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Fitur',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          // First Row of IconButtons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // First IconButton with Text
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.medical_services_sharp,
                        size: 50,
                        color: Colors.deepPurpleAccent,
                      ),
                      onPressed: () {
                        // Handle the press for the first button
                        print('Cari Obat Pressed');
                      },
                    ),
                    SizedBox(height: 10),
                    Text('Cari Obat', textAlign: TextAlign.center),
                  ],
                ),
              ),
              // Second IconButton with Text
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.medical_information,
                        size: 50,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        // Handle the press for the second button
                        print('Hasil Tes COVID Pressed');
                      },
                    ),
                    SizedBox(height: 10),
                    Text('Hasil Tes COVID', textAlign: TextAlign.center),
                  ],
                ),
              ),
              // Third IconButton with Text
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.medication_liquid_outlined,
                        size: 50,
                        color: Colors.orange,
                      ),
                      onPressed: () {
                        // Handle the press for the third button
                        print('Rawat Inap Pressed');
                      },
                    ),
                    SizedBox(height: 10),
                    Text('Rawat Inap', textAlign: TextAlign.center),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30), // Adjust the spacing between the rows
          // Second Row of IconButtons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Fourth IconButton with Text
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.account_box,
                        size: 50,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        // Handle the press for the fourth button
                        print('Diari Kesehatan Pressed');
                      },
                    ),
                    SizedBox(height: 10),
                    Text('Diari Kesehatan', textAlign: TextAlign.center),
                  ],
                ),
              ),
              // Fifth IconButton with Text
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.add_business_rounded,
                        size: 50,
                        color: Colors.purple,
                      ),
                      onPressed: () {
                        // Handle the press for the fifth button
                        print('Vaksin dan Imunisasi Pressed');
                      },
                    ),
                    SizedBox(height: 10),
                    Text('Vaksin dan Imunisasi', textAlign: TextAlign.center),
                  ],
                ),
              ),
              // Sixth IconButton with Text
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.contact_phone,
                        size: 50,
                        color: Colors.teal,
                      ),
                      onPressed: () {
                        // Handle the press for the sixth button
                        print('Pelayanan Kesehatan Pressed');
                      },
                    ),
                    SizedBox(height: 10),
                    Text('Pelayanan Kesehatan', textAlign: TextAlign.center),
                  ],
                ),
              ),
            ],
          ),
          // Add the rest of your content here
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              'Profile',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          // Profile Content
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Add your onPressed logic here
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan, // Set the button background color
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Icon(
                          Icons.person_rounded,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(height: 5), // Adjust spacing between icon and text
                        Text(
                          'Muhamad Irfan Aldiansyah',
                          style: TextStyle(color: Colors.white), // Set the text color
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10), // Adjust spacing between the rows
                  Container(
                    child: Column(
                      children: [
                        Icon(
                          Icons.perm_phone_msg,
                          size: 27, // Adjust the size as needed
                          color: Colors.white, // Set the icon color
                        ),
                        SizedBox(height: 5), // Adjust spacing between icon and text
                        Text(
                          'fanaldian07@gmail.com',
                          style: TextStyle(color: Colors.white), // Set the text color
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10), // Adjust spacing between the rows
                  Container(
                    child: Column(
                      children: [
                        Icon(
                          Icons.perm_media_rounded,
                          size: 27, // Adjust the size as needed
                          color: Colors.white, // Set the icon color
                        ),
                        SizedBox(height: 5), // Adjust spacing between icon and text
                        Text(
                          '20190801353\n',
                          style: TextStyle(color: Colors.white), // Set the text color
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,), // Adding space between profile content and tabs
          // Tabs Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabButton(
                '',
                labelText: '\nKartu Status Vaksin dan\nHasil Test Covid-19\n\nMUHAMAD IRFAN ALDIANSYAH\n',
                rightIcon: Icons.navigate_next, // Replace with the desired icon
                iconAlignment: MainAxisAlignment.end, // Align the icon to the right corner
                iconSize: 40.0,
                  backgroundColor: Colors.cyan,
              ),
              SizedBox(height: 20,),
              TabButton(
                '',
                labelText: '\nVerifikasi profil Anda untuk\nKeamanan yang lebih terjamin!\n',
                leftIcon: Icons.verified_user,
                rightIcon: Icons.navigate_next,// Add the desired icon for the second button
                iconAlignment: MainAxisAlignment.start, // Align the icon to the left corner
                iconSize: 30.0,
                backgroundColor: Colors.cyan, // Set the background color for the second button
              ),
            ],
          ),
          SizedBox(height: 20), // Add space before the additional text
          // Additional text outside TabButton
          Text(
            ' Informasi Umum',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10), // Add space before the ordered list
          TabButton(
            '',
            leftIcon: Icons.question_answer_outlined,
            rightIcon: Icons.navigate_next,
            labelText: '\nPusat Bantuan\n',
            iconSize: 30.0,
            backgroundColor: Colors.cyan,
          ),
          TabButton(
            '',
            leftIcon: Icons.phone,
            rightIcon: Icons.navigate_next,
            labelText: '\nNomor Gawat Darurat\n',
            iconSize: 30.0,
            backgroundColor: Colors.cyan,
          ),
          TabButton(
            '',
            leftIcon: Icons.book_outlined,
            rightIcon: Icons.navigate_next,
            labelText: '\nTentang\n',
            iconSize: 30.0,
            backgroundColor: Colors.cyan,
          ),
        ],
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  final String text;
  final String labelText;
  final IconData? icon;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final MainAxisAlignment iconAlignment;
  final double iconSize;
  final Color? backgroundColor; // Add the backgroundColor parameter

  // Make labelText a required parameter
  const TabButton(
      this.text, {
        required this.labelText,
        this.icon,
        this.leftIcon,
        this.rightIcon,
        this.iconAlignment = MainAxisAlignment.start,
        this.iconSize = 30.0,
        this.backgroundColor, // Initialize the backgroundColor parameter
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Add your tab onPressed logic here
        },
        style: ElevatedButton.styleFrom(
          primary: backgroundColor, // Set the button background color
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (leftIcon != null) // Check if left icon is provided
              Icon(
                leftIcon,
                size: iconSize,
                color: Colors.white,
              ),
            Text(
              labelText,
              style: TextStyle(color: Colors.white), // Set the text color
            ),
            if (rightIcon != null) // Check if right icon is provided
              Icon(
                rightIcon,
                size: iconSize,
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}
