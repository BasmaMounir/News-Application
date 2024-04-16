import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Model/NewsResponse.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = 'details_screen';

  DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as News;

    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
      ),
      body: Stack(children: [
        Image(
          image: AssetImage('assets/images/main_background.png'),
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: CachedNetworkImage(
                  imageUrl: args?.urlToImage ?? '',
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.25,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Text(
                args?.source?.name ?? '',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Text(
                args?.title ?? '',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  args?.publishedAt ?? '',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
              Text(
                args?.description ?? '',
                style: TextStyle(color: Color(0xff42505C), fontSize: 13),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  if (args.url != null)
                    launchArticleUrl(Uri.parse(args.url ?? ''));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'View Full Article',
                      style: TextStyle(color: Color(0xff42505C), fontSize: 14),
                    ),
                    Icon(Icons.arrow_right)
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Future<void> launchArticleUrl(Uri url) async {
    print('url =====> $url');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
