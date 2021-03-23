class Song {
  String name;
  String artist;
  String id;
  double price;
  bool liked;
  int timeSec;
  String imageUrl;

  Song({
    this.name,
    this.artist,
    this.id,
    this.price,
    this.liked = false,
    this.imageUrl,
    this.timeSec,
  });
}

List<Song> songsData = [
  Song(
    name: "Insomania",
    artist: "value beats",
    id: "sng101",
    price: 30,
    imageUrl: "assets/images/trap.png",
    timeSec: 230,
  ),
  Song(
    name: "sungTan",
    artist: "jap tap",
    id: "sng102",
    price: 28,
    imageUrl: "assets/images/lo_fi.png",
    timeSec: 260,
  ),
  Song(
    name: "indian traditional drum",
    artist: "indie beats",
    id: "sng103",
    price: 33,
    imageUrl: "assets/images/chill_wave.png",
    timeSec: 311,
  ),
  Song(
    name: "tip flute",
    artist: "indie beats",
    id: "sng104",
    price: 31,
    imageUrl: "assets/images/lo_fi.png",
    timeSec: 288,
  ),
];
