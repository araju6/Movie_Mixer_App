import 'package:flutter/material.dart';
import 'package:movie_mixer/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:movie_mixer/presentation/journeys/favorite/favorite_screen.dart';
import 'package:movie_mixer/presentation/journeys/history/history_screen.dart';
import 'package:movie_mixer/presentation/journeys/home/home_screen.dart';
import 'package:movie_mixer/presentation/journeys/recommendations/recommendations_screen.dart';
import 'package:movie_mixer/presentation/journeys/watchlist/watchlist_screen.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width/1.5,
      height: MediaQuery.of(context).size.height,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 8,
                bottom: 18,
                left: 8,
                right: 8,
              ),
              child: Center(
                child: Text(
                  "Menu", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            NavigationListItem(
              title: 'Home',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomeScreen(),),
                );
              },
            ),
            NavigationListItem(
              title: 'Favorite Movies',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FavoriteScreen(),),
                );
              },
            ),

            NavigationListItem(
              title: 'Watchlist',
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => WatchlistScreen(),),
                );},
            ),
            NavigationListItem(
              title: 'History',
              onPressed: () {
            Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => HistoryScreen(),),
            );
              },
            ),
            NavigationListItem(
              title: 'Recommendations',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RecommendationsScreen(),),
                );
              },

            ),


          ],
        ),
      ),
    );
  }
}