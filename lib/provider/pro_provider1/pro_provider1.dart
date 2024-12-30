import 'package:flutter/material.dart';
import 'package:plecement_projects/helper/pro_helper1/pro_helper1.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modal/pro_modal1/pro_modal1.dart';

class ProProvider extends ChangeNotifier
{
  ProHelper proHelper=ProHelper();
  List<ProModalOne> productList=[];
  List<String> add = [];
  bool isGridView = false;

  bool isDarkTheme = false;




  void fromList()
  async {
    List pro=await proHelper.proApiHelper();
    productList =pro.map((e)=>ProModalOne.fromJson(e)).toList();
    notifyListeners();
  }



  Future<void> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
      isGridView = prefs.getBool('isGridView') ?? false;
    notifyListeners();
  }

  Future<void> todoView()
  async {
    isGridView =!isGridView;
    print(isGridView);
    final prefs=await SharedPreferences.getInstance();
    prefs.setBool('isGridView', isGridView);
    notifyListeners();
  }
  ProProvider()
  {
    fromList();
    loadPreferences();
  }
}

