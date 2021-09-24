class NasaEndPoints {
  static String apod(String apiKey, String date) =>
      "https://api.nasas.gov/planetary/apod?api key=$apiKey&date=$date";
}
