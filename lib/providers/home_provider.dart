import 'package:flutter/material.dart';
import 'package:housen/components/defaultToast.dart';
import 'package:housen/models/post_model.dart';
import 'package:housen/network/remote/api_helper.dart';

import '../network/end_points.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isconnectionFail = false;
  List posts = [];
  TextEditingController searchController = TextEditingController();

// Get Data

  getHomeData({
    var limit = 25,
  }) async {
    isLoading = true;
    isconnectionFail = false;
    notifyListeners();
    ApiHelper.getData(url: '$POSTS?_limit=$limit').then((value) async {
      posts = await value.map((e) => PostModel.fromJson(e)).toList();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      defaultToast(
          message: 'Check Your Internet in your Device', color: Colors.red);
      isLoading = false;
      isconnectionFail = true;
      notifyListeners();
      print(e);
    });
  }

// Search For Posts

  searchItem({String? data}) {
    if (data != '') {
      try {
        posts = posts.where((element) => element.title.contains(data)).toList();
        print(posts);
        if (posts.isEmpty) {
          defaultToast(
              message: "There is no post with this name",
              color: Colors.amber);
          getHomeData();
        }
        notifyListeners();
      } catch (e) {
        defaultToast(message: e.toString(), color: Colors.red);
        isLoading = false;
      }
    }
  }
}
