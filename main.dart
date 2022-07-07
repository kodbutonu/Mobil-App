import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sport/HomePage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  runApp(const Mylo());
}

class Mylo extends StatelessWidget {
  const Mylo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mylo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );
  void initState() {
    Future.delayed(
        const Duration(seconds: 10),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Anasayfa()),
            ));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
          child: Column(
        children: [
          const SizedBox(width: 20.0, height: 100.0),
          DefaultTextStyle(
              style: GoogleFonts.aladin(
                fontStyle: FontStyle.italic,
                color: Colors.black,
                fontSize: 40,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('Engelsiz Yasam'),
                  WavyAnimatedText('Engel olma destek ol'),
                ],
              )),
          Container(
            margin: EdgeInsets.only(top: 50),
            height: 150,
            width: 150,
            child: ScaleTransition(
              scale: _animation,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/a.png'),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
