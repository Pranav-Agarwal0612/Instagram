import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Container imageCard(DocumentSnapshot documentSnapshot, BuildContext context) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 5, 0, 15),
    child: Column(
      children: [
        ListTile(
          leading: Image.asset('assets/images/default.png', height: 40,),
          title: Text(
            documentSnapshot['username']
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: CachedNetworkImage(
            imageUrl: documentSnapshot['link'],
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          margin: EdgeInsets.symmetric(vertical: 8),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "${documentSnapshot['username']}    ${documentSnapshot['caption']}",
                  softWrap: true,
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}


