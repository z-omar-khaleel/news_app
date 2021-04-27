import 'package:flutter/material.dart';
import 'package:flutter_abdallah_news/views/screens/webView_screen.dart';

class BuildArticle extends StatelessWidget {
  final List<dynamic> articles;

  const BuildArticle(this.articles);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (c) => WebViewScreen(
                            url: articles[index]['url'],
                          )));
                },
                child: Row(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(articles[index]
                                          ['urlToImage'] !=
                                      null
                                  ? articles[index]['urlToImage']
                                  : 'https://fscomps.fotosearch.com/compc/CSP/CSP405/%D8%B1%D9%82%D9%85-130-%D9%85%D8%B9%D8%B1%D8%B6-%D8%A7%D9%84%D8%B5%D9%88%D8%B1-%D8%A7%D9%84%D9%81%D9%88%D8%AA%D9%88%D8%BA%D8%B1%D8%A7%D9%81%D9%8A%D8%A9__k23220195.jpg'))),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Container(
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                articles[index]['title'],
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color,
                                    fontSize: 18),
                              ),
                            ),
                            Text(
                              articles[index]['publishedAt'],
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
        separatorBuilder: (context, i) => Container(
              padding: EdgeInsets.all(5),
              child: Divider(),
            ),
        itemCount: articles.length);
  }
}
