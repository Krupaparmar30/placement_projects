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
  Widget build(BuildContext context) {
    ProProvider proProviderTrue =
        Provider.of<ProProvider>(context, listen: true);
    ProProvider proProviderFalse =
        Provider.of<ProProvider>(context, listen: false);

    return Scaffold(
        backgroundColor:
            proProviderTrue.isDarkTheme ? Colors.white : Colors.black,
        appBar: AppBar(
          backgroundColor:
              proProviderTrue.isDarkTheme ? Colors.white12 : Colors.black,
          title: Text(
            "Project Day One",
            style: TextStyle(
              color:
                  proProviderTrue.isDarkTheme ? Colors.black : Colors.white70,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                proProviderFalse.todoView();
              },
              icon: Icon(
                proProviderTrue.isGridView ? Icons.view_list : Icons.grid_view,
                color:
                    proProviderTrue.isDarkTheme ? Colors.black : Colors.white70,
              ),
            ),
            IconButton(
                onPressed: () {
                  proProviderFalse.todoTheme();
                },
                icon: Icon(
                  proProviderTrue.isDarkTheme
                      ? Icons.dark_mode
                      : Icons.light_mode,
                  color: proProviderTrue.isDarkTheme
                      ? Colors.black
                      : Colors.white70,
                ))
          ],
        ),
        body: Consumer<ProProvider>(
          builder: (context, value, child) {
            if (proProviderFalse.productList.isEmpty) {
              return CircularProgressIndicator();
            }

            return proProviderTrue.isGridView
                ? box1(proProviderFalse, proProviderTrue)
                : box2(proProviderFalse, proProviderTrue);
          },
        ));
  }

  box1(ProProvider proProviderFalse, proProviderTrue) {
    return ListView.builder(
      itemCount: proProviderFalse.productList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: proProviderTrue.isDarkTheme == true
                ? proProviderFalse.productList[index].completed
                    ? Colors.green.shade50
                    : Colors.red.shade50
                : proProviderTrue.isDarkTheme == false
                    ? Colors.grey.shade50
                    : Colors.red.shade50,
            child: ListTile(
              leading: Text('${proProviderFalse.productList[index].id}',style: TextStyle(
                fontSize: 18
              ),),
              title: Text("${proProviderFalse.productList[index].title}"),
              trailing: Icon(
                proProviderFalse.productList[index].completed
                    ? Icons.check_circle
                    : Icons.pending_rounded,
                size: 30,
                color: proProviderFalse.productList[index].completed
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ),
        );
      },
    );
  }

  box2(ProProvider proProviderFalse, proProviderTrue) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: proProviderFalse.productList.length,
      itemBuilder: (context, index) {
        return SingleChildScrollView(
          child: Container(
            height: 170,
            width: 150,
            decoration: BoxDecoration(
              color: proProviderTrue.isDarkTheme == true
                  ? proProviderFalse.productList[index].completed
                      ? Colors.green.shade50
                      : Colors.red.shade50
                  : proProviderTrue.isDarkTheme == false
                      ? Colors.grey.shade50
                      : Colors.red.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                subtitle: Text('${proProviderFalse.productList[index].title}'),
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Icon(
                      proProviderFalse.productList[index].completed
                          ? Icons.check_circle
                          : Icons.pending_rounded,
                      size: 30,
                      color: proProviderFalse.productList[index].completed
                          ? Colors.green
                          : Colors.red,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      proProviderFalse.productList[index].completed
                          ? 'Completed'
                          : 'Pending',
                      style: TextStyle(
                        color: proProviderFalse.productList[index].completed
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
