class BrowseData{
  int id;
  String title;
  String imageUrl;

  BrowseData({required this.id, required this.title , required this.imageUrl});

  static List<BrowseData> getBrowse(){
      return [
        BrowseData(id: 28, title: 'Action', imageUrl: 'assets/images/crime.jpg'),
        BrowseData(id: 12, title: 'Adventure', imageUrl: 'assets/images/adventure.jpg'),
        BrowseData(id: 16, title: 'Animation', imageUrl: 'assets/images/animation.jpg'),
        BrowseData(id: 35, title: 'Comedy', imageUrl: 'assets/images/comedy.jpg'),
        BrowseData(id: 80, title: 'Crime', imageUrl: 'assets/images/crime1.jpg'),
        BrowseData(id: 99, title: 'Documentary', imageUrl: 'assets/images/documentary.jpg'),
        BrowseData(id: 18, title: 'Drama', imageUrl: 'assets/images/drama.jpg'),
        BrowseData(id: 10751, title: 'Family', imageUrl: 'assets/images/family.jpg'),
        BrowseData(id: 14, title: 'Fantasy', imageUrl: 'assets/images/fantasy.jpg'),
        BrowseData(id: 36, title: 'History', imageUrl: 'assets/images/history.jpg'),
        BrowseData(id: 27, title: 'Horror', imageUrl: 'assets/images/horror.jpg'),
        BrowseData(id: 10402, title: 'Music', imageUrl: 'assets/images/music.jpeg'),
        BrowseData(id: 9648, title: 'Mystery', imageUrl: 'assets/images/mystery.jpg'),
        BrowseData(id: 10749, title: 'Romance', imageUrl: 'assets/images/romance.jpg'),
        BrowseData(id: 878, title: 'Science Fiction', imageUrl: 'assets/images/scienceFiction.jpg'),
        BrowseData(id: 10770, title: 'TV Movie', imageUrl: 'assets/images/tvMovie.jpg'),
        BrowseData(id: 53, title: 'Thriller', imageUrl: 'assets/images/thriller.jpg'),
        BrowseData(id: 10752, title: 'War', imageUrl: 'assets/images/war.jpg'),
        BrowseData(id: 37, title: 'Western', imageUrl: 'assets/images/western.jpg'),
      ];
  }
}