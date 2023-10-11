import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:ways_chauffeur/welcom_selection.dart';

import 'login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  // late bool userLogin;
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _navigatetohome();

    _controller =
    VideoPlayerController.asset("assets/videos/cmpltvideo.mp4")
      ..initialize().then((value) => {setState(() {})});
    _controller.setLooping(true);
    _controller.setVolume(0.0);
    _controller.play();

  }

  _navigatetohome() async {
    // final preferences = await SharedPreferences.getInstance();
    // userLogin = preferences.getBool('userLogin') ?? false;
    await Future.delayed(const Duration(milliseconds: 6000), () {});
    // if(userLogin){
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => HomePage()));
    // }else{
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WelcomeSelection()));
    // }
    // Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: LoginSelection()));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: /*Container(
        child: Image.asset(
          'assets/images/splash.jpg',
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
        ),
      ),*/
      Stack(
        children: <Widget>[
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size?.width ?? 0,
                height: _controller.value.size?.height ?? 0,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          //FURTHER IMPLEMENTATION
        ],
      )
    );
  }

}