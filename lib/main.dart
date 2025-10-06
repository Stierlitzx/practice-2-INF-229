import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice_2/registration.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.white,
        systemNavigationBarContrastEnforced: false,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
    ),
  );

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.white,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen2(),
      ),
    );
  }
}

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6FBFA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: -37.0,
                    left: 85.0,
                    width: 365.0,
                    height: 365.0,
                    child: Image(
                      image: AssetImage("assets/circles1.png")
                    ),
                  ),
                  Positioned(
                    top: 215.0,
                    right: 160.0,
                    width: 303.0,
                    height: 303.0,
                    child: Image(
                      image: AssetImage("assets/circles2.png")
                    ),
                  ),
                  Positioned(
                    top: 157.0,
                    width: 327.0,
                    height: 261.0,
                    child: Image(
                      image: AssetImage("assets/education.png")
                    ),
                  ),
                ],
              )
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(height: 42.0,),
                  Text(
                    "Welcome To MyCourses",
                    style: TextStyle(
                      color: Color(0xff092724),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 16.0,),
                  Padding(
                    padding: const EdgeInsets.only(left: 21.0, right: 21.0),
                    child: Text(
                      "Enjoy the various best courses we have, choose the category according to your wishes.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff697B7A),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 34.0,),
                  Image(
                    image: AssetImage("assets/dots.png"),
                    width: 38.0,
                    height: 6.0,
                  ),
                  SizedBox(height: 30.0,),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffF2C94C),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 109.0),
                        textStyle: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        )
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Registration(),
                          ),
                        );
                      },
                      child: Text(
                        "Mother fucker"
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0,),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Color(0xffF2C94C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 63.0),
                      textStyle: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      )
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Registration())
                      );
                    }, 
                    child: const Text("Already Have an Account"),
                  ),
                  SizedBox(height: 24.0,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}