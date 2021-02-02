import 'package:flutter/material.dart';
import 'package:flutter_movies_app/model/movie.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movies"),
          backgroundColor: Colors.blueGrey.shade900,
        ),
        backgroundColor: Colors.blueGrey.shade900,
        body: ListView.builder(
            itemCount: movieList.length,
            itemBuilder: (BuildContext context, int index) {
              return Stack(children: [
                movieCard(movieList[index], context),
                Positioned(
                    top: 10.0, child: movieImage(movieList[index].images[1]))
              ]);
            }));
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
        child: Container(
            margin: EdgeInsets.only(left: 60),
            width: MediaQuery.of(context).size.width,
            height: 120.0,
            child: Card(
                color: Colors.black45,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                movie.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                    color: Colors.white),
                              ),
                            ),
                            Text("Rating: ${movie.imdbRating}/10",
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.grey))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Released: ${movie.released}",
                                style: mainTextStyle()),
                            Text("Runtime: ${movie.runtime}",
                                style: mainTextStyle()),
                            Text("Rated: ${movie.rated}",
                                style: mainTextStyle())
                          ],
                        )
                      ],
                    ),
                  ),
                ))),
        onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieListViewDetails(movie: movie)))
            });
  }

  TextStyle mainTextStyle() {
    return TextStyle(
      color: Colors.grey,
      fontSize: 15.0,
    );
  }

  Widget movieImage(String imageUrl) {
    return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(
                imageUrl ?? '',
              ),
              fit: BoxFit.cover),
        ));
  }
}

// New Route
class MovieListViewDetails extends StatelessWidget {
  final Movie movie;

  const MovieListViewDetails({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movies ${this.movie.title}"),
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
