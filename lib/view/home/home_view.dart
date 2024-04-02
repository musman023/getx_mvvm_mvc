import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmvc/data/response/status.dart';
import 'package:getxmvc/res/colors/app_color.dart';
import 'package:getxmvc/res/components/general_exception.dart';
import 'package:getxmvc/res/components/internet_exception_widget.dart';
import 'package:getxmvc/res/routes/routes_name.dart';
import 'package:getxmvc/view_model/controller/home/home_view_models.dart';
import 'package:getxmvc/view_model/controller/user_preference/user_preference_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.put(HomeController());

  UserPreference userPreference = UserPreference();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              userPreference.removeUser().then((value) {
                Get.toNamed(RouteName.loginView);
              });
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.ERROR:
            if (homeController.error.value == 'No internet') {
              return InternetExceptionWidget(onPress: () {
                homeController.refreshAPi();
              });
            } else {
              return GeneralExceptionWidget(onPress: () {
                homeController.refreshAPi();
              });
            }

          case Status.COMPLETED:
            return ListView.builder(
                itemCount: homeController.userList.value.data?.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(homeController
                            .userList.value.data![index].avatar
                            .toString()),
                      ),
                      title: Text(homeController
                          .userList.value.data![index].firstName
                          .toString()),
                      subtitle: Text(homeController
                          .userList.value.data![index].email
                          .toString()),
                    ),
                  );
                });
        }
      }),
    );
  }
}
