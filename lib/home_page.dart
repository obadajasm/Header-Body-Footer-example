import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar(
          //     expandedHeight: 100.0,
          //     floating: true,
          //     pinned: false,
          //     snap: false,
          //     flexibleSpace: const FlexibleSpaceBar(
          //       title: Text('Available seats'),
          //     ),
          //     actions: <Widget>[
          //       IconButton(
          //         icon: const Icon(Icons.add_circle),
          //         tooltip: 'Add new entry',
          //         onPressed: () {},
          //       ),
          //     ]),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.orangeAccent,
                  child: Center(
                    child: Text(
                      'Header',
                      style: TextStyle(color: Colors.white, letterSpacing: 4),
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Center(child: Text('$index')),
                    );
                  },
                ),
                TextFormField()
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 50,
                color: Colors.blueAccent,
                child: Center(
                  child: Text(
                    'Footer',
                    style: TextStyle(color: Colors.white, letterSpacing: 4),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
