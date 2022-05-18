import 'package:my_app/domain/artist.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/global/config.dart';
import 'dart:convert';


class ArtistService {

  static const url = "${Config.scheme}://${Config.ip}:${Config.port}/artist-service";

  Future<List<Artist>> getAllArtists() async {
    final response = await http.get(
      Uri.parse("$url/artists"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'POST, GET, OPTIONS, PUT',
        'Access-Control-Allow-Headers':
        'Origin, X-Requested-With, Content-Type, Accept'
      });
    if(response.statusCode == 200){
      List<Artist> artists = [];
      var jsonData = json.decode(response.body);
      for(var artist in jsonData['_embedded']['artists']){
        artists.add(Artist.fromJson(artist));
      }
      return artists;
    } else {
      throw Exception("Failed to load artists");
    }
  }
}