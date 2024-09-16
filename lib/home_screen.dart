import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:wibu_app/detail_screen.dart';
import 'package:wibu_app/models/banner_wibu.dart';
import 'package:wibu_app/models/upcoming_anime.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CarouselSlider(
                items: bannerWibu.map((banner) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(banner.imageBannerUrl),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                    height: 250, autoPlay: true, viewportFraction: 1.0),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Top Upcoming Anime",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: upComingAnime.map((anime) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(anime: anime),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        margin: EdgeInsets.only(right: 8.0),
                        child: Column(
                          children: [
                            Image.network(
                              anime.animeImageUrl,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 8.0),
                            Expanded(
                              child: Text(
                                anime.animeName,
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
              SizedBox(
                height: 16,
              ),
              Container(
                margin: const EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Most Popular Anime",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: upComingAnime.map((anime) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(anime: anime),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        margin: EdgeInsets.only(right: 8.0),
                        child: Column(
                          children: [
                            Image.network(
                              anime.animeImageUrl,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 8.0),
                            Expanded(
                              child: Text(
                                anime.animeName,
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
              SizedBox(
                height: 16,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Top Airing Anime",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: upComingAnime.map((anime) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(anime: anime),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        margin: EdgeInsets.only(right: 8.0),
                        child: Column(
                          children: [
                            Image.network(
                              anime.animeImageUrl,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 8.0),
                            Expanded(
                              child: Text(
                                anime.animeName,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
