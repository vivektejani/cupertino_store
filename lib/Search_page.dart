import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cupertino_store/global.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        color: CupertinoColors.lightBackgroundGray,
        child: Column(
          children: [
            const SizedBox(height: 12),
            Container(
              height: 34,
              margin: const EdgeInsets.all(8),
              child: CupertinoTextField(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: CupertinoColors.opaqueSeparator,
                  borderRadius: BorderRadius.circular(8),
                ),
                prefix: const Padding(
                  padding: EdgeInsets.all(6),
                  child: Icon(
                    CupertinoIcons.search,
                    color: CupertinoColors.inactiveGray,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: _height - 154,
              child: SingleChildScrollView(
                child: Column(
                  children: Global.searchProducts.map((e) {
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 105,
                          child: Row(
                            children: [
                              const SizedBox(width: 10),
                              Container(
                                alignment: Alignment.center,
                                height: 90,
                                width: 90,
                                child: Image.asset("${e['image']}"),
                              ),
                              const SizedBox(width: 8),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(e['product_name']),
                                  const SizedBox(height: 6),
                                  Text(
                                    "\$${e['price']}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: CupertinoColors.inactiveGray,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              CupertinoButton(
                                  child: const Icon(CupertinoIcons.add_circled),
                                  onPressed: () {
                                    setState(() {
                                      Global.cartProducts.add(e);
                                    });
                                  }),
                              const SizedBox(width: 12),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          indent: 115,
                          endIndent: 15,
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
