import 'package:bordered_text/bordered_text.dart';
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
  int? _playingIndex;
  List<Item> items = [
    Item(
      name: "Forest Sounds",
      imagePath: "meditation_images/forest.jpeg",
      audioPath: "meditation_audios/forest.mp3",
    ),
    Item(
      name: "Ocean Breeze",
      imagePath: "meditation_images/ocean.jpeg",
      audioPath: "meditation_audios/ocean.mp3",
    ),
    Item(
      name: "Nigth Sounds",
      imagePath: "meditation_images/night.jpeg",
      audioPath: "meditation_audios/night.mp3",
    ),
    Item(
      name: "Windy Evening",
      imagePath: "meditation_images/wind.jpeg",
      audioPath: "meditation_audios/wind.mp3",
    ),
    Item(
      name: "Waterfall",
      imagePath: "meditation_images/waterfall.jpeg",
      audioPath: "meditation_audios/waterfall.mp3",
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
                leading: BorderedText(
                  strokeWidth: 4,
                  strokeColor: Colors.black,
                  child: Text(items[index].name)),
                trailing: IconButton(
                  icon: _playingIndex == index
                      ? Icon(Icons.stop, size: 34)
                      : Icon(Icons.play_arrow, size: 34),
                  onPressed: () {
                    if (_playingIndex == index) {
                      setState(() {
                        _playingIndex = null;
                      });
                      audioPlayer.stop();
                    } else {
                      audioPlayer.setAsset(items[index].audioPath);
                      audioPlayer.play();
                      setState(() {
                        _playingIndex = index;
                      });
                    }
                  },
                ),
              )),
        );
      },
    )));
  }
}
