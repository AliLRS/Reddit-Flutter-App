import 'package:reddit/Data/static_fields.dart';
import 'package:reddit/app_theme.dart';
import 'package:flutter/material.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
              child: Row(
                children: [
                  Expanded(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text(StaticFields.activeUser.username[0],
                          style: TextStyle(
                            fontSize: 35,
                          )),
                      radius: 50.0,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StaticFields.activeUser.username,
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          StaticFields.activeUser.email,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          "Posts",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          StaticFields.activeUser.posts == null
                              ? '0'
                              : StaticFields.activeUser.posts.length.toString(),
                          style: TextStyle(
                              color: AppTheme.mainColor,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          "Communities",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          StaticFields.activeUser.communities == null
                              ? '0'
                              : StaticFields.activeUser.communities.length
                                  .toString(),
                          style: TextStyle(
                              color: AppTheme.mainColor,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: AppTheme.mainColor,
            ),
            child: const Text('Edit Profile'),
            onPressed: () {
              setState(
                () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfile()));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
