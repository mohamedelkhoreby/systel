part of '../view/home_page.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: AppLists.userSpend.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        width: 35.w,
                        height: 20.h,
                        padding: const EdgeInsets.only(
                            top: 50, left: 16, right: 16, bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2),
                                  child: RotatedBox(
                                    quarterTurns: -1,
                                    child: Text(
                                      StringsManager.egy,
                                      style: semiBlodTajawal(
                                          fontSize: 10,
                                          color: ColorManager.black),
                                    ),
                                  ),
                                ),
                                Text(
                                  AppLists.userSpend[index],
                                  style: semiBlodTajawal(
                                      fontSize: 20, color: ColorManager.black),
                                )
                              ],
                            ),
                            Text(
                                "${StringsManager.lastSpend} ${AppLists.lastSpend[index]}",
                                style: regularTajawalStyle(
                                    fontSize: 10, color: ColorManager.gray)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        width: 35.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: AppLists.userColor[index],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "${StringsManager.user} ${index + 1}",
                              style: blodTajawalStyle(
                                  fontSize: 14, color: ColorManager.white),
                            ),
                            Text(
                              StringsManager.totalSpending,
                              style: lightTajawalStyle(
                                  fontSize: 10, color: ColorManager.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/images/person.png'),
                    )
                  ]),
            );
          }),
    );
  }
}
/* 
class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: AppLists.userSpend.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(index: index),
          );
        },
      ),
    );
  }
}

class Card extends StatelessWidget {
  final int index;
  Card({
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: 250, // Set the height to match the width for a square size
            padding:
                const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 16),
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [],
            ),
          ),
          /* Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${StringsManager.user} ${index + 1}",
                  style:
                      blodTajawalStyle(fontSize: 14, color: ColorManager.white),
                ),
                Text(
                  StringsManager.totalSpending,
                  style: lightTajawalStyle(
                      fontSize: 10, color: ColorManager.white),
                ),
                SizedBox(
                  height: 2.h,
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
                              fontSize: 10, color: ColorManager.black),
                        ),
                      ),
                    ),
                    Text(
                      AppLists.userSpend[index],
                      style: semiBlodTajawal(
                          fontSize: 20, color: ColorManager.black),
                    )
                  ],
                ),
                Text(
                  "${StringsManager.lastSpend} ${AppLists.lastSpend[index]}",
                  style: regularTajawalStyle(
                      fontSize: 10, color: ColorManager.gray),
                ),
              ],
            ),
          ), */
          const Positioned(
            top: -20,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(ImageAssets.persoon),
            ),
          )
        ],
      ),
    );
  }
}
 */
