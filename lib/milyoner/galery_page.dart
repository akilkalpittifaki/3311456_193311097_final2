import 'package:cached_network_image/cached_network_image.dart';
import 'package:flap14/milyoner/photo_view.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_gallery/photo_view_page.dart';

class GalleryPage extends StatelessWidget {
  GalleryPage({Key? key}) : super(key: key);

  final List<String> photos = [
    'assets/images/bacon.jpg',
    'assets/images/aristo2.jpg',
    'assets/images/budas.jpg',
    'assets/images/popper.jpg',
    'assets/images/spinoza.jpeg',
    'assets/images/descartes2.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Galeri")),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        padding: const EdgeInsets.all(1),
        itemCount: photos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: ((context, index) {
          return Container(
            padding: const EdgeInsets.all(0.5),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PhotoViewPage(photos: photos, index: index),
                ),
              ),
              child: Hero(
                tag: photos[index],
                child: CachedNetworkImage(
                  imageUrl: photos[index],
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(color: Colors.grey),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.red.shade400,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
