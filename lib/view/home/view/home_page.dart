import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:systel/core/resources/font_manager.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/list_manager.dart';
import '../../../core/resources/string_manager.dart';
import '../../../core/resources/style_manager.dart';

part '../widget/wallet_view.dart';
part '../widget/usercard_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  ParseUser? currentUser;

  Future<ParseUser?> getUser() async {
    currentUser = await ParseUser.currentUser() as ParseUser?;
    return currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorManager.background,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const Image(
                image: AssetImage(ImageAssets.homebackground),
                fit: BoxFit.scaleDown),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 2.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(SvgAssets.notification,
                            fit: BoxFit.scaleDown),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(SvgAssets.category,
                            fit: BoxFit.scaleDown),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 20.h,
                          width: 20.w,
                          child: const Image(
                              image: AssetImage(ImageAssets.persoon),
                              fit: BoxFit.fitWidth),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(StringsManager.goodEvening,
                                style: lightTajawalStyle(
                                    color: ColorManager.white,
                                    fontSize: FontSize.s15)),
                            FutureBuilder<ParseUser?>(
                                future: getUser(),
                                builder: (context, snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.none:
                                    case ConnectionState.waiting:
                                      return const Center(
                                        child: SizedBox(
                                            width: 100,
                                            height: 100,
                                            child: CircularProgressIndicator()),
                                      );
                                    default:
                                      return Text(
                                        "${snapshot.data?.username}",
                                        style: semiBlodTajawal(
                                            color: ColorManager.white,
                                            fontSize: FontSize.s15),
                                      );
                                  }
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                 const WalletView(),
                  SizedBox(
                    height: 4.h,
                  ),
                  Container(
                    height: 10.h,
                    width: 84.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorManager.blue,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 30.w,
                        ),
                        Text(
                          StringsManager.test,
                          style: regularTajawalStyle(
                              fontSize: FontSize.s20,
                              color: ColorManager.white),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: ColorManager.white,
                              size: 15,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 3.h, horizontal: 6.w),
                    child: Row(
                      children: [
                        Text(
                          StringsManager.user,
                          style: blodTajawalStyle(
                              fontSize: 20, color: ColorManager.black),
                        ),
                      ],
                    ),
                  ),
                  const UserCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
