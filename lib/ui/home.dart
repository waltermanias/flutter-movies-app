import 'package:flutter/material.dart';

class MovieListView extends StatelessWidget {
  final List movies = [
    "Titanic",
    "Blade Runner",
    "Rambo",
    "The Avengers",
    "Avatar",
    "I Am Legend",
    "300",
    "The Wolf of Wall Street",
    "Interstellar",
    "Game of Thrones",
    "Vikings",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movies"),
          backgroundColor: Colors.blueGrey.shade900,
        ),
        backgroundColor: Colors.blueGrey.shade400,
        body: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  elevation: 4.5,
                  color: Colors.white,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieListViewDetails()));
                    },
                    trailing: Text("..."),
                    leading: CircleAvatar(
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13.9)),
                            child: Text("H"))),
                    title: Text(movies.elementAt(index)),
                    subtitle: Text("Subtitle"),
                  ));
            }));
  }
}

// New Route
class MovieListViewDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movies"),
          backgroundColor: Colors.blueGrey.shade900,
        ),
        body: Center(
          child: Container(
            child: RaisedButton(
              child: Text("Go Back"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ));
  }
}
