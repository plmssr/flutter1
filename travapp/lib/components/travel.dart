// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travapp/detail_page.dart';

Widget travelCard(String imgUrl, String hotelName, String location, int rating,
    BuildContext context) {
  return Card(
    margin: EdgeInsets.only(right: 22),
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    elevation: 0.0,
    child: InkWell(
      onTap: () {
        print(imgUrl);
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => Detail(imageName: imgUrl)));
        // ;
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return DetailPage(
                imageName: imgUrl,
                rating: rating,
                location: location,
                hotelName: hotelName);
          },
        ));
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imgUrl), fit: BoxFit.cover, scale: 2.0)),
        width: 200,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  for (var i = 0; i < rating; i++)
                    Icon(
                      Icons.star,
                      color: Color(0xFFFE8C68),
                    ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hotelName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      location,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
