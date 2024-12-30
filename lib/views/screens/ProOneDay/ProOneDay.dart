import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../provider/pro_provider1/pro_provider1.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}


class _homePageState extends State<homePage> {

  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();



  //  loadPreferences();
  }
  // Future<void> loadPreferences() async {
  //   final prefs = await SharedPreferences.getInstance();
  //
  //   setState(() {
  //     isGridView = prefs.getBool('isGridView') ?? false;
  //     isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
  //   });
  //
  // }

  Widget build(BuildContext context) {
    ProProvider proProviderTrue =
        Provider.of<ProProvider>(context, listen: true);
    ProProvider proProviderFalse =
        Provider.of<ProProvider>(context, listen: false);


    return Scaffold(
      appBar: AppBar(
        title: Text("Project Day One"),
        actions: [
          IconButton(
            onPressed: () {

             setState(() {
               isGridView= !isGridView;
             });

            },
            icon: Icon(isGridView ? Icons.view_list : Icons.grid_view),
          ),
        ],
      ),
      body:isGridView ? box1(proProviderFalse) :box2(proProviderFalse)


    );
  }

  box1(ProProvider proProviderFalse)
  {
    return    ListView.builder(
      itemCount: proProviderFalse.productList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading:
          Text('${proProviderFalse.productList[index].userId}'),
          title: Text("${proProviderFalse.productList[index].title}"),
          trailing:
          Text('${proProviderFalse.productList[index].completed}'),
        );
      },
    );
  }

  box2(ProProvider proProviderFalse)
  {
      GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

      itemCount: proProviderFalse.productList.length,
      itemBuilder: (context, index) {

        return SingleChildScrollView(
          child: Column(
            children: [
            Card(
              child: Column(
                children: [
                  Text('${proProviderFalse.productList[index].userId}'),
                ],
              ),
            )
            ],
          ),
        );
      },
    );
  }
}
