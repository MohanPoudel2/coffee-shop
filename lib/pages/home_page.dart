import 'package:coffee_shop/provider/coffee_list_provider/coffee_list_notifier.dart';
import 'package:coffee_shop/ui/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../const/app_colors.dart';
import '../const/text_style.dart';
import '../widget/star_icons.dart';
import '../widget/text_form_field_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _tabController;
  bool isPressed = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var coffeeListNotifier = Provider.of<CoffeeListNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hello!',
          style: TextStyles.appbarText,
        ),
        leading: const Icon(
          Icons.menu,
          color: AppColors.iconColor,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: AppColors.iconColor,
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "it's A Great Day\nFor Coffee",
              style: TextStyles.mediumText,
            ),
            const TextFormFieldWidget(),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: NestedScrollView(
                controller: _scrollController,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      pinned: true,
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(0.1),
                        child: TabBar(
                          tabAlignment: TabAlignment.start,
                          dividerColor: Colors.transparent,
                          indicatorColor: AppColors.indicatorColor,
                          labelStyle: TextStyles.tabText1,
                          unselectedLabelStyle: TextStyles.tabText2,
                          controller: _tabController,
                          isScrollable: true,
                          tabs: const [
                            Tab(text: 'Hot Coffee'),
                            Tab(text: 'Cold Coffee'),
                          ],
                        ),
                      ),
                    )
                  ];
                },
                body: TabBarView(
                  controller: _tabController,
                  children: [
                    GridView.builder(
                      itemCount: coffeeListNotifier.coffeeList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Provider.of<CoffeeListNotifier>(context,
                                    listen: false)
                                .selectCoffee(
                                    CoffeeListNotifier().coffeeList[index]);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DetailScreen(),
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.containerColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  height: 90,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(coffeeListNotifier
                                              .coffeeList[index].image),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 10, top: 5),
                                  child: Text(
                                    coffeeListNotifier.coffeeList[index].name,
                                    style: TextStyles.buttonText,
                                  ),
                                ),
                                const StarsIconWidget(),
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: Text(
                                        '\$${coffeeListNotifier.coffeeList[index].price}',
                                        style: TextStyles.tabText2.copyWith(
                                            fontSize: 10,
                                            color: AppColors.indicatorColor),
                                      ),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        print('tapped');
                                       setState(() {
                                         if(isPressed){
                                           isPressed=true;
                                         }
                                       });
                                      },
                                      child: Icon(
                                          isPressed==false?Icons.favorite_border_rounded:Icons.favorite,
                                          color: AppColors.indicatorColor,
                                          size: 20),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.add_box,
                                        color: AppColors.indicatorColor,
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const Center(
                      child: Text(
                        'screen 2',
                        style: TextStyles.smallText,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
