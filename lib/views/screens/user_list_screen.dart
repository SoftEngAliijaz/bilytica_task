import 'package:bilytica_task/utils/app_colors.dart';
import 'package:bilytica_task/utils/size_config.dart';
import 'package:bilytica_task/view_model/user_view_model.dart';
import 'package:bilytica_task/views/components/search_card_component.dart';
import 'package:bilytica_task/views/components/user_card_component.dart';
import 'package:bilytica_task/views/widgets/circular_progress_widget.dart';
import 'package:bilytica_task/views/widgets/normal_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _getUsersList();
    super.initState();
  }

  void _getUsersList() {
    Provider.of<UserViewModel>(context, listen: false).getUsersList();
    Provider.of<UserViewModel>(context, listen: false)
        .initializeScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.wPad16(),
          right: SizeConfig.wPad16(),
        ),
        child:
            Consumer<UserViewModel>(builder: (context, userViewModel, widget) {
          if (userViewModel.isLoading) {
            return CircularLoadingWidget();
          } else {
            return Column(
              children: [
                SizedBox(
                  height: SizeConfig.height15(),
                ),
                SearchCardComponent(controller: _controller),
                if (userViewModel.userList.isNotEmpty)
                  SizedBox(
                    height: SizeConfig.height110() * 5.5,
                    child: ListView.builder(
                      controller: userViewModel.scrollController,
                      itemCount: userViewModel.userList.length +
                          (userViewModel.isLoadingMore ? 1 : 0),
                      itemBuilder: (BuildContext context, int index) {
                        return index == userViewModel.userList.length
                            ? SizedBox(
                                height: SizeConfig.height110(),
                                child: CircularLoadingWidget(),
                              )
                            : Container(
                                margin: EdgeInsets.only(
                                  top: index == 0 ? SizeConfig.hPad20() : 0,
                                  // bottom: SizeConfig.hPad8(),
                                ),
                                child: UserCardComponent(
                                  userModel: userViewModel.userList[index],
                                ),
                              );
                      },
                    ),
                  )
                else
                  Padding(
                    padding: EdgeInsets.only(
                      top: SizeConfig.hPad24(),
                    ),
                    child: NormalTextWidget(
                      "No Users Found comme back again in some time",
                    ),
                  ),
              ],
            );
          }
        }),
      ),
    );
  }
}
