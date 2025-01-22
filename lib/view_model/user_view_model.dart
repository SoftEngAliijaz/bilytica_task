import 'dart:developer';

import 'package:bilytica_task/models/user_model.dart';
import 'package:bilytica_task/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  bool isLoading = true;
  bool isLoadingMore = false;
  int page = 1;
  final ScrollController scrollController = ScrollController();
  final List<UserModel> userList = [];

  final UserRepository _userRepository = UserRepository();

  void getUsersList() {
    if (userList.isNotEmpty) {
      _changeMoreLoadingState(true);
    }
    _userRepository.getUserList(
      pageNumber: page,
      onSuccess: (data) {
        final list = data['results'] as List;
        for (var map in list) {
          userList.add(UserModel.fromJson(map));
        }
        _changeLoadingState(false);
        _changeMoreLoadingState(false);
      },
      onFailure: (error, code) {
        log(error);
        log(code);
        _changeLoadingState(false);
        _changeMoreLoadingState(false);
      },
    );
  }

  void initializeScrollController() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        page++;
        getUsersList();
      }
    });
  }

  void _changeLoadingState(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void _changeMoreLoadingState(bool value) {
    isLoadingMore = value;
    notifyListeners();
  }
}
