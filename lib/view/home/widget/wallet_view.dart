part of '../view/home_page.dart';

class WalletView extends StatelessWidget {
  WalletView({super.key});
  ParseUser? currentUser;

  Future<ParseUser?> getUser() async {
    currentUser = await ParseUser.currentUser() as ParseUser?;
    return currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 20.h,
          width: 40.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ColorManager.white,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40.w,
                    height: 5.h,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: ColorManager.darkGray,
                    ),
                    child: Center(
                      child: Text(
                        StringsManager.yourWallet,
                        style: blodTajawalStyle(
                            fontSize: 14, color: ColorManager.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                    child: SvgPicture.asset(SvgAssets.wallet,
                        fit: BoxFit.scaleDown),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: RotatedBox(
                          quarterTurns: -1,
                          child: Text(
                            StringsManager.egy,
                            style: semiBlodTajawal(
                                fontSize: 12, color: ColorManager.textGray),
                          ),
                        ),
                      ),
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
                                snapshot.data!.get('yourwallet'),
                                style: semiBlodTajawal(
                                    fontSize: 30, color: ColorManager.black),
                              );
                          }
                        },
                      )
                    ],
                  ),
                  Text(
                    "${StringsManager.lastUpdata} 24/6",
                    style: regularTajawalStyle(
                        fontSize: 10, color: ColorManager.gray),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
        Container(
          height: 20.h,
          width: 40.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorManager.white,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40.w,
                    height: 5.h,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: ColorManager.gray,
                    ),
                    child: Center(
                      child: Text(
                        StringsManager.lastActivity,
                        style: blodTajawalStyle(
                            fontSize: 14, color: ColorManager.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                    child: SvgPicture.asset(SvgAssets.payment,
                        fit: BoxFit.fitHeight),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: RotatedBox(
                          quarterTurns: -1,
                          child: Text(
                            StringsManager.egy,
                            style: semiBlodTajawal(
                                fontSize: 12, color: ColorManager.textGray),
                          ),
                        ),
                      ),
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
                                snapshot.data!.get('lastActivity'),
                                style: semiBlodTajawal(
                                    fontSize: 30, color: ColorManager.black),
                              );
                          }
                        },
                      )
                    ],
                  ),
                  Text(
                    "${StringsManager.transaction} 10/5",
                    style: regularTajawalStyle(
                        fontSize: 10, color: ColorManager.gray),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
