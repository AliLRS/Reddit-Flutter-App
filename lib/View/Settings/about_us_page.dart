import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  // this page is a about us page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            width: double.infinity,
            height: 140,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.blueGrey,
                    Colors.orange,
                  ],
                ),
              ),
              alignment: const Alignment(0.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Reddit",
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "AP PROJECT SBU-CE-2022",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Text('About Us',
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.orange,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400)),
          ),
          const Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                  'This program is the final project of Dr.Vahidi\'s advanced programming lesson.'
                      '\n\nprogrammers:'
                      '\nAli Lamei & MohammadAmin Safari.'
                      '\n\n\nShare your comments with us'
                      '\n\nEmail:'
                      '\nsourush.lamei@gmail.com'
                      '\nsafarimoamin@gmail.com'
                      '\n\nour github page:'
                      '\nhttps://github.com/MoaminSafari/Reddit-Flutter-App',
              style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }
}
