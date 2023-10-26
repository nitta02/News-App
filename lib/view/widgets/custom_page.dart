import 'package:flutter/material.dart';

class CustomPages extends StatelessWidget {
  const CustomPages({super.key});

  @override
  Widget build(BuildContext context) {
    double customHeight = MediaQuery.of(context).size.height;

    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            height: customHeight * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.grey[800],
              image: DecorationImage(
                image: NetworkImage(
                    'https://i.pcmag.com/imagery/articles/03a3gbCKfH8dDJnjhHLuHDf-1..v1665523315.png'),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.55),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  )),
              width: double.infinity,
              child: Text(
                'data',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
