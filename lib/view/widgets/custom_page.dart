import 'package:flutter/material.dart';
import 'package:getx_news_app/model/test_model.dart';

class CustomPages extends StatelessWidget {
  const CustomPages({super.key, required this.list});

  final List<ApiModel> list;

  @override
  Widget build(BuildContext context) {
    double customHeight = MediaQuery.of(context).size.height;
    print(list.length);
    if (list.isNotEmpty) {
      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              height: customHeight * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.grey[800],
                image: DecorationImage(
                  image: NetworkImage('${list[index].urlToImage}'),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.55),
                    borderRadius: const BorderRadius.only(
                        // bottomLeft: Radius.circular(20.0),
                        // bottomRight: Radius.circular(20.0),
                        )),
                width: double.infinity,
                child: Text(
                  '${list[index].title}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
