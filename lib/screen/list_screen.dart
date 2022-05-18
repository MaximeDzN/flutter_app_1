import 'package:flutter/material.dart';
import 'package:my_app/domain/artist.dart';
import 'package:my_app/service/artist_service.dart';
import 'package:intl/intl.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {
  late Future<List<Artist>> futureArtists;

  @override
  void initState() {
    super.initState();
    futureArtists = ArtistService().getAllArtists();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Liste des artistes'),
        ),
        body: Center(
          child: FutureBuilder<List<Artist>>(
            future: futureArtists,
            builder: (context, snapshot) {
              if(snapshot.hasData && snapshot.connectionState != ConnectionState.none){
                return ListView.builder(itemCount: snapshot.data!.length,
                    itemBuilder: (context,index) {
                      Artist artist = snapshot.data![index];
                        return Card(
                          child: Column(
                            children: [
                              Text(artist.firstName!),
                              Text(artist.lastName!),
                              Text(DateFormat('dd/MM/yyyy').format(artist.birthDate!))
                            ],
                          ),
                        );
                    });
              } else {
                return const CircularProgressIndicator();
              }

              // By default, show a loading spinner.

            },
          ),
        ),
      ),
    );
  }
}