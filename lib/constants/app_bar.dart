import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.teal,
      centerTitle: true,
      elevation: 0,

      title: Text(
        'Movies-App'.toUpperCase(),
        style: Theme.of(context).textTheme.caption!.copyWith(
          color: Colors.white,
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
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Tab(
            icon: Icon(Icons.rate_review),
            child: Text(
              'Most Rated',
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Tab(
            icon: Icon(Icons.search),
            child: Text(
              'Search',
              style: TextStyle(
                color: Colors.white,
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
