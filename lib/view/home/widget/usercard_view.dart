part of '../view/home_page.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: FutureBuilder<List<ParseObject>>(
        future: doUserQuery(),
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
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error...: ${snapshot.error.toString()}"),
                );
              } else {
                if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('None user found'),
                  );
                }
              }
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2),
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
                                        snapshot.data![index]
                                            .get('lastActivity'),
                                        style: semiBlodTajawal(
                                            fontSize: 20,
                                            color: ColorManager.black),
                                      )
                                    ],
                                  ),
                                  Text(
                                      "${StringsManager.lastSpend} ${snapshot.data![index].get('lastupdated')}",
                                      style: regularTajawalStyle(
                                          fontSize: 10,
                                          color: ColorManager.gray)),
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
                                color: AppLists.userColor[index %  AppLists.userColor.length],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    snapshot.data![index].get('username'),
                                    style: blodTajawalStyle(
                                        fontSize: 14,
                                        color: ColorManager.white),
                                  ),
                                  Text(
                                    StringsManager.totalSpending,
                                    style: lightTajawalStyle(
                                        fontSize: 10,
                                        color: ColorManager.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                AssetImage('assets/images/person.png'),
                          )
                        ]),
                  );
                },
              );
          }
        },
      ),
    );
  }

  // function to get a query of users
  Future<List<ParseObject>> doUserQuery() async {
    QueryBuilder<ParseUser> queryUsers =
        QueryBuilder<ParseUser>(ParseUser.forQuery());
    final ParseResponse apiResponse = await queryUsers.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }
}
