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
        appBar: AppBar(
          title: Text("Project Day One"),
          actions: [
            IconButton(
              onPressed: () {
                proProviderFalse.todoView();
              },
              icon: Icon(proProviderTrue.isGridView
                  ? Icons.view_list
                  : Icons.grid_view),
            ),
          ],
        ),
        body: proProviderTrue.isGridView
            ? box1(proProviderFalse)
            : box2(proProviderFalse));
  }

  box1(ProProvider proProviderFalse) {
    return ListView.builder(
      itemCount: proProviderFalse.productList.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(

            leading: Text('${proProviderFalse.productList[index].userId}'),
            title: Text("${proProviderFalse.productList[index].title}"),
            trailing: Icon(
              proProviderFalse.productList[index].completed
                  ? Icons.check_circle
                  : Icons.pending_rounded,
              size: 30,
              color: proProviderFalse.productList[index].completed ? Colors.green : Colors.red,
            ),
          ),
        );
      },
    );
  }

  box2(ProProvider proProviderFalse) {
  return  GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: proProviderFalse.productList.length,
      itemBuilder: (context, index) {
        return SingleChildScrollView(
          child: Card(
            child: ListTile(
              leading: Text('${proProviderFalse.productList[index].userId}'),
                title: Text('${proProviderFalse.productList[index].title}'),
            

              subtitle: Icon(
                proProviderFalse.productList[index].completed
                    ? Icons.check_circle
                    : Icons.pending_rounded,
                size: 30,
                color: proProviderFalse.productList[index].completed ? Colors.green : Colors.red,
              ),
            
            
            ),
            
            
          ),
        );
      },
    );
  }
}
