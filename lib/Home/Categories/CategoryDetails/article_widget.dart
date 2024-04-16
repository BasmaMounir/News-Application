import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Home/Categories/details_screen.dart';
import 'package:news_app/Model/NewsResponse.dart';

class ArticleWidget extends StatefulWidget {
  News news;

  ArticleWidget({Key? key, required this.news}) : super(key: key);

  @override
  State<ArticleWidget> createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<ArticleWidget> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsScreen.routeName,
            arguments: widget.news);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: CachedNetworkImage(
              imageUrl: widget.news.urlToImage ?? '',
              width: double.infinity,
              fit: BoxFit.cover,
              height: height * 0.25,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(
            widget.news.source?.name ?? '',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          Text(
            widget.news?.title ?? '',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              widget.news?.publishedAt ?? '',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
