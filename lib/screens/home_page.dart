import 'package:demo_api/models/post.dart';
import 'package:demo_api/services/get_post_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder(
          future: GetPostService().getPost(),
          builder: (ctx, snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        List<Post>.from(snapshot.data as List<Post>).length,
                        (index) {
                          final posts =
                              List<Post>.from(snapshot.data as List<Post>);
                          return Card(
                            child: ListTile(
                              title: Text(posts[index].title!),
                              subtitle: Text(posts[index].body!),
                            ),
                          );
                        },
                      ),
                    ),
                  );
          }),
    ));
  }
}
