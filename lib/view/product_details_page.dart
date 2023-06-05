import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final params;
  ProductDetailsPage({this.params});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Color(0xff2a2f38),
          centerTitle: true,
          title: Text(params.strCategory.toString().toUpperCase())),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 1,
          ),
          Image.network(
            height: MediaQuery.of(context).size.height / 2.6,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
            params.strDrinkThumb.toString(),
            // value.moviesList.data!.data![index].avatar.toString(),
            errorBuilder: ((context, error, stackTrace) {
              return Icon(
                Icons.error,
                color: Colors.red,
              );
            }),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: leftAndRightPadding(),
            child: Row(
              children: [
                Text(
                  params.strCategory.toString().toUpperCase(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color(0xff2a2f38),
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
                Text(
                  "  (${params.idDrink.toString().toUpperCase()})",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color(0xff2a2f38),
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: leftAndRightPadding(),
            child: Text(
              params.strInstructions.toString(),
              style: TextStyle(
                  color: Color(0xff2a2f38),
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            ),
          ),
          params.strInstructionsES != null
              ? Padding(
                  padding: leftAndRightPadding(t: 15.0),
                  child: Text(
                    params.strInstructionsES.toString() ?? '',
                    style: TextStyle(
                        color: Color(0xff2a2f38),
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                )
              : SizedBox(),
          Padding(
            padding: leftAndRightPadding(t: 15.0),
            child: Text(
              params.strInstructionsDE.toString(),
              style: TextStyle(
                  color: Color(0xff2a2f38),
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            ),
          )
        ],
      ),
    );
  }

  EdgeInsets leftAndRightPadding({r, l, t, b}) => EdgeInsets.only(
      right: r ?? 20.0, left: l ?? 20.0, top: t ?? 0.0, bottom: b ?? 0.0);
}
