import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minbaro_app/pages/watchlist/views/watchlist_view.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
        centerTitle: true,
        actions: [
          CupertinoButton(
            child: Icon(CupertinoIcons.add,
                color: Theme.of(context).colorScheme.onSurface),
            onPressed: () {},
          ),
        ],
      ),
      body: WatchlistView(),
    );
  }
}
