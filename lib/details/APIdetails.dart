import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class Documentation extends StatefulWidget {
  @override
  _DocumentationState createState() => _DocumentationState();
}

class _DocumentationState extends State<Documentation> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text('API details'),
          backgroundColor: Colors.lightBlue.shade400,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          ExpandableText(
            "Documentation",
            collapseText:'Show less',
            expandText: 'Show more',
          ),
            ExpandableText(
              "News API is a simple HTTP REST API for searching and retrieving live articles from all over the web. It can help you answer questions like: \n \n \t \t What top stories is TechCrunch running right now? \n \t \t What new articles were published about the next iPhone today? \n \t \t Has my company or product been mentioned or reviewed by any blogs recently? \n \n \t \t You can search for articles with any combination of the following criteria: \n \n \t \t Keyword or phrase. Eg: find all articles containing the word 'Microsoft'. \n \t \t Date published. Eg: find all articles published yesterday. \n \t \t Source domain name. Eg: find all articles published on thenextweb.com. \n \t \t Language. Eg: find all articles written in English. \n \n \t \t You can sort the results in the following orders: \n \n \t \t Date published \n \t \t Relevancy to search keyword \n \t \t Popularity of source \n \n ",
              collapseText:'Show less',
              expandText: 'Show more',
            ),
          ],
        )
    );
  }
}