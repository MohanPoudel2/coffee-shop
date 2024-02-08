import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../const/app_colors.dart';
import '../const/text_style.dart';
import '../provider/coffee_list_provider/coffee_list_notifier.dart';
import '../widget/star_icons.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _text = 0;
  String _size = 'small';

  @override
  Widget build(BuildContext context) {
    var selectedCoffee =
        Provider.of<CoffeeListNotifier>(context).selectedCoffee;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(250),
                      ),
                      image: DecorationImage(
                          image: AssetImage(selectedCoffee.image),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  top: 20,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.iconColor2,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 40,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: AppColors.indicatorColor,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedCoffee.name,
                          style: TextStyles.mediumText,
                        ),
                        Text(
                          '\$${selectedCoffee.price}',
                          style: TextStyles.tabText3,
                        )
                      ],
                    ),
                    const StarsIconWidget(),
                    const Text(
                      'Product Info',
                      style: TextStyles.tabText1,
                    ),
                    const Text(
                      'A coffee drink made with milk that has been frothed up with pressurized steam and a shot of espresso.',
                      style: TextStyles.tabText2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Quantity',
                          style: TextStyles.tabText1,
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              _decrement();
                            },
                            icon: const Icon(
                              Icons.indeterminate_check_box,
                              color: AppColors.indicatorColor,
                            )),
                        Text(
                          '$_text',
                          style: TextStyles.tabText2,
                        ),
                        IconButton(
                            onPressed: () {
                              _increment();
                            },
                            icon: const Icon(
                              Icons.add_box,
                              color: AppColors.indicatorColor,
                            )),
                      ],
                    ),
                    Text(
                      'Size',
                      style: TextStyles.tabText1.copyWith(fontSize: 16),
                    ),
                    Row(
                      children: [
                        buildTextButton(fillText: 'small', text: 'Small'),
                        buildTextButton(fillText: 'medium', text: 'Medium'),
                        buildTextButton(fillText: 'big', text: 'Big'),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 20,
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.indicatorColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                        child: Text(
                          'Add To Cart',
                          style: TextStyles.textButton2,
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }

  TextButton buildTextButton({required String fillText, required String text}) {
    return TextButton(
      onPressed: () {
        setState(() {
          _size = fillText;
        });
      },
      child: Text(
        text,
        style:
            _size == fillText ? TextStyles.textButton1 : TextStyles.textButton2,
      ),
    );
  }

  void _increment() {
    setState(() {
      _text++;
    });
  }

  void _decrement() {
    setState(() {
      if (_text > 0) {
        _text--;
      }
    });
  }
}
