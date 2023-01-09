import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:housen/components/defaultButton.dart';
import 'package:housen/components/defaultItem.dart';
import 'package:housen/providers/dark_theme_provider.dart';
import 'package:housen/providers/home_provider.dart';
import 'package:housen/screens/HomeScreen/connection_failed.dart';
import 'package:housen/screens/HomeScreen/custom_image_slider.dart';
import 'package:housen/screens/HomeScreen/custom_search.dart';
import 'package:housen/style/colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      context.read<HomeProvider>().getHomeData();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var prov = context.watch<HomeProvider>();
    return Scaffold(
        floatingActionButton: prov.isconnectionFail
            ? FloatingActionButton.extended(
                onPressed: () async {
                  await prov.getHomeData();
                },
                label: const Text('Reconnect'),
                icon: const Icon(Icons.refresh_rounded),
              )
            : null,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: AppBar(
            // backgroundColor: Colors.red,
            title: SvgPicture.asset(
              'assets/images/logo_svg.svg',
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 10),
                child: GestureDetector(
                    onTap: () {
                      context.read<DarkModeProvider>().changeTheme();
                    },
                    child: context.watch<DarkModeProvider>().isDark
                        ? const Icon(
                            Icons.wb_sunny_outlined,
                            size: 30,
                          )
                        : SvgPicture.asset('assets/images/moon.svg',width: 25,)
                          ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Find your ideal home !",
                        style:
                            Theme.of(context).textTheme.bodyText1!.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                )),
                  ],
                ),

                // ImageSlider
                const CustomImageSlider(),

                // Search

                const CustomSearch(),

                const SizedBox(
                  height: 20,
                ),

                defaultButton(onTab: () {
                  prov.searchItem(data: prov.searchController.text);
                }),

                const SizedBox(
                  height: 30,
                ),

                // Fetch Data From jsonplaceholder

                prov.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Builder(builder: (context) {
                        return prov.isconnectionFail
                            ? const ConnectionFailed()
                            : ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: prov.posts.length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(
                                    height: 40,
                                  );
                                },
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return defaultItem(
                                    post: prov.posts[index],
                                    context: context,
                                  );
                                },
                              );
                      }),
              ],
            ),
          ),
        ));
  }
}
