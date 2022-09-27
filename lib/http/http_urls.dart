class HttpUrls {
  static String getNearMePetronas(double lat, double lon) =>
      "https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=petronas&location=$lat%2C$lon&radius=1500&key=YOUR_KEY";
}
