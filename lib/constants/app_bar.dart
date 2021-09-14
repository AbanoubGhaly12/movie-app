import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/ui/search_for_movie.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.teal,
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.search,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
      title: Text(
        'Movies-App'.toUpperCase(),
        style: Theme.of(context).textTheme.caption!.copyWith(
              color: Colors.black45,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
      ),
      bottom: TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.tv),
            child: Text(
              'Now Playing',
              style: TextStyle(
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Tab(
            icon: Icon(Icons.rate_review),
            child: Text(
              'Most Rated',
              style: TextStyle(
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Tab(
            icon: Icon(Icons.search),
            child: Text(
              'Search',
              style: TextStyle(
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(130);
}
