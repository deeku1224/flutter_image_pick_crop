import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/modals/searchResult.dart';
import 'package:flutter_image_pick_crop/screens/singlesPage.dart';
import 'package:flutter_image_pick_crop/widgets/searchResult.dart';

class SearchBar extends SearchDelegate<String> {
  final items = [
    "apple",
    'orange',
    'mango',
    'Gauva',
  ];
  final recentItems = ['gauva', 'mango'];
  String searchTerm;
  bool showTerm = false;
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear_rounded),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      height: size.height,
      width: size.width,
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        //physics: NeverScrollableScrollPhysics(),
        itemCount: searchResult.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.9,
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 25.0),
        itemBuilder: (context, index) => SearchResultContainers(
          onpress: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SinglesPage(
                        isFav: searchResult[index].isFavourite,
                        product: searchResult[index])));
          },
          resultIndex: searchResult[index],
          isFav: searchResult[index].isFavourite,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentItems
        : items.where((p) => p.startsWith(query.toLowerCase())).toList();
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return suggestionList.isEmpty
          ? ListTile(
              leading: Icon(Icons.query_builder_rounded),
            )
          : ListView.builder(
              itemCount: suggestionList.length,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        showTerm = true;
                        searchTerm = suggestionList[index].toString();
                      });
                      showResults(context);
                    },
                    child: ListTile(
                      leading: query.isEmpty
                          ? Icon(
                              Icons.rotate_left_outlined,
                              size: 30,
                            )
                          : Icon(
                              Icons.ac_unit,
                              size: 30,
                            ),
                      title: Text(
                        suggestionList[index],
                        // style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ));
    });
  }
}
