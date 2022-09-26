import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_store/global.dart';


class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        width: double.infinity,
        color: CupertinoColors.lightBackgroundGray,
        child: Column(
          children: [
            const SizedBox(height: 42),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(width: 10),
                Text(
                  "Cupertino Store",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              color: CupertinoColors.white,
              height: _height - 172,
              child: SingleChildScrollView(
                child: Column(
                  children: Global.allProducts.map((e) {
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
                              Builder(builder: (context) {
                                return CupertinoButton(
                                    child:
                                    const Icon(CupertinoIcons.add_circled),
                                    onPressed: () {
                                      setState(() {
                                        Global.cartProducts.add(e);
                                      });
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
