import 'package:flutter/material.dart';

class BackgroundImage extends StatefulWidget {
  const BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  State<BackgroundImage> createState() => _BackgroundImageState();
}

class _BackgroundImageState extends State<BackgroundImage> {
  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
                colors: [Colors.black, Colors.black26],
                begin: Alignment.bottomCenter,
                end: Alignment.center)
            .createShader(bounds),
        blendMode: BlendMode.darken,
        child: Container(
          width: sizeWidth,
          height: sizeHeight,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background1.jpg"),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.black45, BlendMode.darken),
                  opacity: 40)),
        ),
      ),
    );
  }
}
