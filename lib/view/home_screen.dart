import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../view_model/home_view_model.dart';
import '../utils/routes/routes_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewViewModel = HomeViewModel();

  @override
  void initState() {
    homeViewViewModel.fetchMoviewListApi();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewModel>(builder: (context, value, _) {
          switch (value.moviesList.status) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(child: Text(value.moviesList.message.toString()));
            case Status.COMPLETED:
              return Column(
                children: [
                  SizedBox(height: 35.0),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 22.0,
                        right: MediaQuery.of(context).size.width / 22.0,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 16.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: const Color(0xff2a2f38)),
                        child: Center(
                          child: TextField(
                            //  controller: model.searchCon,
                            textInputAction: TextInputAction.done,
                            style: TextStyle(color: Colors.white),
                            // onChanged: (value) => homeViewViewModel
                            //     .fetchMoviewListApi(data: value),
                            onSubmitted: (value) {
                              homeViewViewModel.fetchMoviewListApi(data: value);
                            },
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Opacity(
                                    opacity:
                                        Theme.of(context).brightness.name ==
                                                'dark'
                                            ? 0.1749674479166667
                                            : 0.5,
                                    child: Icon(Icons.search,
                                        size: 25,
                                        color: Color(
                                            0xffffffff))), // icon is 48px widget.
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff2a2f38), width: 0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.moviesList.data?.drinks?.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RoutesName.productDetails,
                                  arguments:
                                      value.moviesList.data!.drinks![index]);
                            },
                            child: Card(
                                child: ListTile(
                              leading: Image.network(
                                value.moviesList.data!.drinks![index]
                                    .strDrinkThumb
                                    .toString(),
                                // value.moviesList.data!.data![index].avatar.toString(),
                                errorBuilder: ((context, error, stackTrace) {
                                  return Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  );
                                }),
                              ),
                              title: Text(
                                value
                                    .moviesList.data!.drinks![index].strCategory
                                    .toString(),
                                // value.moviesList.data!.data![index].firstName
                                //     .toString(),
                              ),
                              subtitle: Text(
                                value.moviesList.data!.drinks![index].strGlass
                                    .toString(),
                                // value.moviesList.data!.data![index].email.toString(),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('233'),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  )
                                ],
                              ),
                              // .toString()),
                            )),
                          );
                        }),
                  ),
                ],
              );
          }
          return Container();
        }),
      ),
    );
  }
}
