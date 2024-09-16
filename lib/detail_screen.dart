import 'package:flutter/material.dart';
import 'package:wibu_app/models/upcoming_anime.dart';

class DetailScreen extends StatelessWidget {
  final UpComingAnime anime;

  const DetailScreen({Key? key, required this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Image.network(
                      anime.animeImageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 8.0),
                child: Text(
                  anime.animeName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 8.0, top: 8),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    anime.totalEpisode,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 16, right: 16, top: 8),
                child: Text(
                  anime.description,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 16, top: 16),
                child: Text(
                  'Voice Actor',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: anime.animeActorVoice.map((voiceActor) {
                    return GestureDetector(
                      onTap: () {
                        _showVoiceActorDetail(context, voiceActor);
                      },
                      child: Container(
                        width: 150,
                        margin: EdgeInsets.only(right: 8.0),
                        child: Column(
                          children: [
                            Image.network(
                              voiceActor.actorImageUrl,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 8.0),
                            Expanded(
                              child: Text(
                                voiceActor.actorName,
                                style: TextStyle(fontWeight: FontWeight.normal),
                                maxLines: 2,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showVoiceActorDetail(BuildContext context, VoiceActor voiceActor) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return FractionallySizedBox(
            heightFactor: 0.5,
            widthFactor: 1.0,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      child: Image.network(
                        voiceActor.actorImageUrl,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    voiceActor.actorName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
