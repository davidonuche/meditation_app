import 'package:flutter/material.dart';
import 'package:meditation_app/models/item_model.dart';
import 'package:just_audio/just_audio.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final AudioPlayer audioPlayer = AudioPlayer();
  List<Item> items = [
    Item(
      name: "Forest Sounds",
      imagePath: "meditation_images/forest.jpeg",
      audioPath: "meditation_audio/forest.mp3",
    ),
    Item(
      name: "Ocean Breeze",
      imagePath: "meditation_images/ocean.jpeg",
      audioPath: "meditation_audio/ocean.mp3",
    ),
    Item(
      name: "Nigth Sounds",
      imagePath: "meditation_images/night.jpeg",
      audioPath: "meditation_audio/night.mp3",
    ),
    Item(
      name: "Windy Evening",
      imagePath: "meditation_images/wind.jpeg",
      audioPath: "meditation_audio/wind.mp3",
    ),
    Item(
      name: "Waterfall",
      imagePath: "meditation_images/waterfall.jpeg",
      audioPath: "meditation_audio/waterfall.mp3",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(items[index].imagePath))),
              child: ListTile(
                leading: Text(items[index].name),
                trailing: IconButton(
                  onPressed: () {
                    audioPlayer.setAsset(items[index].audioPath);
                    audioPlayer.play();
                  },
                  icon: Icon(Icons.play_arrow),
                ),
              )),
        );
      },
    )));
  }
}
