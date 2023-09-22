import 'package:flutter/material.dart';
import 'package:sptify/model/music_services.dart';
import 'package:sptify/model/playlist_model.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Playlist>(
          future: PlaylistService().fetchPlaylistData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return const Text('No data found');
            } else {
              return SizedBox(
                height: 500,
                width: 400,
                child: ListView.separated(
                  itemCount: 1,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 10);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    print(snapshot.data);
                    return Center(
                      child: Text(
                        snapshot.data,
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
