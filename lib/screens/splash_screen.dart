import 'package:flutter/material.dart';
import 'package:flutter_vpn/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: size.height * 0.1,
                left: 0,
                right: 0,
                child: Image.asset('assets/images/splash-screen-image.jpeg',),
              ),
              Positioned(
                child: Container(
                  margin: EdgeInsets.only(top: size.height * 0.33),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'HOLA',
                          style: TextStyle(
                            letterSpacing: 2,
                            fontSize: 35,
                            fontFamily: 'Merriweather',
                            fontWeight: FontWeight.w900,
                            color: Color(0xff2572FE),
                          ),
                        ),
                        Text(
                          ' VPN',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff2572FE),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
