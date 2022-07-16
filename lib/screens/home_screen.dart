import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool _isConnected = false;

  Duration _duration = const Duration();
  Timer? _timer;

  startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      const addSeconds = 1;
      setState(() {
        final seconds = _duration.inSeconds + addSeconds;
        _duration = Duration(seconds: seconds);
      });
    });
  }

  stopTimer() {
    setState(() {
      _timer?.cancel();
      _duration = const Duration();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color(0xff246CE2),
            statusBarBrightness: Brightness.light, // For iOS: (dark icons)
            statusBarIconBrightness: Brightness.light, // For Android: (dark icons)
          ),
        ),
      ),
      backgroundColor: const Color(0xff246CE2),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(18, 20, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: const Icon(
                      Icons.segment,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.electric_bolt,
                        color: Colors.orangeAccent,
                        size: 22,
                      ),
                      SizedBox(width: 10,),
                      Text(
                        'Trustpiegeon',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.settings_outlined, color: Colors.white,),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: () {
                _isConnected ? stopTimer() : startTimer();
                setState(() => _isConnected = !_isConnected);
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    width: 115,
                    height: 115,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.power_settings_new,
                            size: 36,
                            color: Color(0xff246CE2),
                          ),
                          Text(
                            _isConnected ? 'Disconnect' : 'Connect',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff246CE2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: double.infinity,
              height: 80,
              child: _isConnected ? Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      'Connected',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff246CE2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  _countDownWidget(),
                ],
              ) : null,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration:  const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xffB4B4C7),
                        borderRadius: BorderRadius.circular(3)
                      ),
                      height: 4,
                      width: 35,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          'assets/images/usa.jpeg',
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          const Text(
                                            'USA',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            height: 22,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffFEF7F0),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: const Text(
                                              'Free Server',
                                              style: TextStyle(
                                                  color: Colors.orange,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5,),
                                      Text(
                                        'NEW YORK CITY',
                                        style: TextStyle(
                                            color: Colors.grey.shade400,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(flex: 3,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: const BoxDecoration(
                                          color: Colors.orange,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.equalizer_rounded,
                                          color: Colors.white,
                                          size: 28,
                                        ),
                                      ),
                                      const SizedBox(height: 5,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            '10',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                          Text(
                                            ' ms',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5,),
                                      Text(
                                        'PING',
                                        style: TextStyle(
                                            color: Colors.grey.shade400,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(flex: 2,),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 60),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: const BoxDecoration(
                                          color: Color(0xff20C4F8),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.arrow_downward,
                                          color: Colors.white,
                                          size: 28,
                                        ),
                                      ),
                                      const SizedBox(height: 5,),
                                      Row(
                                        children: const [
                                          Text(
                                            '15,47',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                          Text(
                                            ' mbps',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5,),
                                      Text(
                                        'DOWNLOAD',
                                        style: TextStyle(
                                            color: Colors.grey.shade400,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: const BoxDecoration(
                                          color: Color(0xff8220F9),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.arrow_upward,
                                          color: Colors.white,
                                          size: 28,
                                        ),
                                      ),
                                      const SizedBox(height: 5,),
                                      Row(
                                        children: const [
                                          Text(
                                            '250',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                          Text(
                                            ' mbps',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5,),
                                      Text(
                                        'PING',
                                        style: TextStyle(
                                            color: Colors.grey.shade400,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 20, 20),
                              child: Row(
                                children: [
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.location_pin,
                                        color: Colors.orange,
                                      ),
                                      Text(
                                        ' Change Location',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: const BoxDecoration(
                                      color: Color(0xff246CE2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.keyboard_arrow_right_outlined, size: 25, color: Colors.white,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _countDownWidget() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(_duration.inMinutes.remainder(60));
    final seconds = twoDigits(_duration.inSeconds.remainder(60));
    final hours = twoDigits(_duration.inHours.remainder(60));

    return Text(
      '$hours : $minutes : $seconds',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 27
      ),
    );
  }
}
