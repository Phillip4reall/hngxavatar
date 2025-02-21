// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AvatarControllerScreen(),
    );
  }
}

class AvatarControllerScreen extends StatefulWidget {
  const AvatarControllerScreen({super.key});

  @override
  _AvatarControllerScreenState createState() => _AvatarControllerScreenState();
}

class _AvatarControllerScreenState extends State<AvatarControllerScreen> {
  late Flutter3DController _controller1;
  late Flutter3DController _controller2;

  @override
  void initState() {
    super.initState();
    _controller1 = Flutter3DController();
    _controller2 = Flutter3DController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(title: Text('3D Avatar Animation'),backgroundColor:Colors.grey.shade300 ,),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Flutter3DViewer(
                    controller: _controller1,
                    src: 'https://models.readyplayer.me/67b5abe25bfef9852930a1ef.glb',
                  ),
                ),
                Expanded(
                  child: Flutter3DViewer(
                    controller: _controller2,
                    src: 'https://models.readyplayer.me/67b5ac6e6586d1c54677ce03.glb',
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  _controller1.playAnimation(animationName: 'Walking');
                  
                },
                child: Text('Avatar 1 - Wave'),
              ),
              ElevatedButton(
                onPressed: () {
                //  _controller2.playAnimation('idle');
                },
                child: Text('Avatar 2 - Wave'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  _controller1.playAnimation();
                },
                child: Text('Avatar 1 - Dance'),
              ),
              ElevatedButton(
                onPressed: () {
                 // _controller2.playAnimation('dance');
                  _controller2.playAnimation();
                },
                child: Text('Avatar 2 - Dance'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}