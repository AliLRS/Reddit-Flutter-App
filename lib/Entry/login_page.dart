import 'package:reddit/MainPages/feed_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reddit/Entry/signup_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../app_theme.dart';
import 'dart:async';
import 'dart:ui';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  AnimationController controller1;
  AnimationController controller2;
  Animation<double> animation1;
  Animation<double> animation2;
  Animation<double> animation3;
  Animation<double> animation4;

  TextEditingController _usernameController, _passwordController;
  bool _passwordVisibility = false, firstEntry = true;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    controller1 = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    animation1 = Tween<double>(begin: .1, end: .15).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });
    animation2 = Tween<double>(begin: .02, end: .04).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    animation3 = Tween<double>(begin: .41, end: .38).animate(CurvedAnimation(
      parent: controller2,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });
    animation4 = Tween<double>(begin: 170, end: 190).animate(
      CurvedAnimation(
        parent: controller2,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    Timer(const Duration(milliseconds: 2500), () {
      controller1.forward();
    });

    controller2.forward();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const Color(0xff192028);
    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Positioned(
                  top: size.height * (animation2.value + .58),
                  left: size.width * .21,
                  child: CustomPaint(
                    painter: MyPainter(50),
                  ),
                ),
                Positioned(
                  top: size.height * .98,
                  left: size.width * .1,
                  child: CustomPaint(
                    painter: MyPainter(animation4.value - 30),
                  ),
                ),
                Positioned(
                  top: size.height * .5,
                  left: size.width * (animation2.value + .8),
                  child: CustomPaint(
                    painter: MyPainter(30),
                  ),
                ),
                Positioned(
                  top: size.height * animation3.value,
                  left: size.width * (animation1.value + .1),
                  child: CustomPaint(
                    painter: MyPainter(60),
                  ),
                ),
                Positioned(
                  top: size.height * .1,
                  left: size.width * .8,
                  child: CustomPaint(
                    painter: MyPainter(animation4.value),
                  ),
                ),
                Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.only(top: size.height * .1),
                        child: Text(
                          'Reddit',
                          style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            wordSpacing: 4,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.only(top: size.height * .1),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            wordSpacing: 4,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          component1(Icons.account_circle_outlined,
                              'User name...', false, false),
                          component1(
                              Icons.lock_outline, 'Password...', true, false),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              component2(
                                'Log in',
                                2.58,
                                () {
                                  HapticFeedback.lightImpact();
                                  firstEntry = false;
                                  if (validateUsername(
                                              _usernameController.text) ==
                                          null &&
                                      validatePassword(
                                              _passwordController.text) ==
                                          null) {
                                    Fluttertoast.showToast(
                                        msg: 'Log in was successful',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.TOP,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: AppTheme.mainColor,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const FeedPage()));
                                  } else if (validateUsername(
                                          _usernameController.text) !=
                                      null) {
                                    Fluttertoast.showToast(
                                        msg: validateUsername(
                                            _usernameController.text),
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.TOP,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: AppTheme.mainColor,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else if (validatePassword(
                                          _passwordController.text) !=
                                      null) {
                                    Fluttertoast.showToast(
                                        msg: validatePassword(
                                            _passwordController.text),
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.TOP,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: AppTheme.mainColor,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          component2(
                            'Sign up',
                            2,
                            () {
                              HapticFeedback.lightImpact();
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        const SignupPage(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero),
                              );
                            },
                          ),
                          SizedBox(height: size.height * .05),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget component1(
      IconData icon, String hintText, bool isPassword, bool isEmail) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 15,
          sigmaX: 15,
        ),
        child: Container(
          height: size.width / 8,
          width: size.width / 1.2,
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: size.width / 30),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            controller: isPassword ? _passwordController : _usernameController,
            style: TextStyle(color: Colors.white.withOpacity(.8)),
            cursorColor: Colors.white,
            obscureText: isPassword ? !_passwordVisibility : false,
            keyboardType:
                isEmail ? TextInputType.emailAddress : TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: Colors.white.withOpacity(.7),
              ),
              border: InputBorder.none,
              hintMaxLines: 1,
              hintText: hintText,
              hintStyle:
                  TextStyle(fontSize: 14, color: Colors.white.withOpacity(.5)),
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: (ThemeMode.system == ThemeMode.dark
                            ? (_passwordVisibility
                                ? Colors.blueGrey
                                : Colors.white)
                            : (_passwordVisibility
                                ? Colors.orange
                                : Colors.black)),
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisibility = !_passwordVisibility;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }

  Widget component2(String string, double width, VoidCallback voidCallback) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: voidCallback,
          child: Container(
            height: size.width / 8,
            width: size.width / width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.05),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              string,
              style: TextStyle(color: Colors.white.withOpacity(.8)),
            ),
          ),
        ),
      ),
    );
  }

  String validateUsername(String value) {
    if (value.isEmpty && !firstEntry) {
      return 'Username is required';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty && !firstEntry) {
      return 'Password is required';
    }
    return null;
  }
}

class MyPainter extends CustomPainter {
  final double radius;

  MyPainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
              colors: [Colors.orange, Colors.deepOrangeAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)
          .createShader(Rect.fromCircle(
        center: const Offset(0, 0),
        radius: radius,
      ));

    canvas.drawCircle(Offset.zero, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
