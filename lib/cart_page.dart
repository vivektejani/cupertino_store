import 'package:flutter/cupertino.dart';
import 'package:cupertino_store/global.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  DateTime currentDateTime = DateTime.now();
  String? currentMonth;
  String? timePeriod;

  @override
  void initState() {
    super.initState();

    if (currentDateTime.month == 1) {
      currentMonth = "Jan";
    } else if (currentDateTime.month == 2) {
      currentMonth = "Feb";
    } else if (currentDateTime.month == 3) {
      currentMonth = "Mar";
    } else if (currentDateTime.month == 4) {
      currentMonth = "Apr";
    } else if (currentDateTime.month == 5) {
      currentMonth = "May";
    } else if (currentDateTime.month == 6) {
      currentMonth = "Jun";
    } else if (currentDateTime.month == 7) {
      currentMonth = "Jul";
    } else if (currentDateTime.month == 8) {
      currentMonth = "August";
    } else if (currentDateTime.month == 9) {
      currentMonth = "Sep";
    } else if (currentDateTime.month == 10) {
      currentMonth = "Oct";
    } else if (currentDateTime.month == 11) {
      currentMonth = "Nov";
    } else if (currentDateTime.month == 12) {
      currentMonth = "Dec";
    }

    if (currentDateTime.hour > 12) {
      timePeriod = "PM";
    } else {
      timePeriod = "AM";
    }
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        width: double.infinity,
        color: CupertinoColors.lightBackgroundGray,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(width: 10),
                Text(
                  "Shopping Cart",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: _height - 180,
              color: CupertinoColors.white,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 14),
                    child: const CupertinoTextField(
                      decoration:  BoxDecoration(
                        border:  Border(
                          bottom: BorderSide(
                              color: CupertinoColors.opaqueSeparator, width: 1),
                        ),
                      ),
                      prefix: Icon(
                        CupertinoIcons.person_alt,
                        color: CupertinoColors.opaqueSeparator,
                      ),
                      padding:  EdgeInsets.all(8),
                      placeholder: "Name",
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 14),
                    child: const CupertinoTextField(
                      decoration:  BoxDecoration(
                        border:  Border(
                          bottom: BorderSide(
                              color: CupertinoColors.opaqueSeparator, width: 1),
                        ),
                      ),
                      prefix: Icon(
                        CupertinoIcons.mail_solid,
                        color: CupertinoColors.opaqueSeparator,
                      ),
                      padding:  EdgeInsets.all(8),
                      placeholder: "Email",
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 14),
                    child: const CupertinoTextField(
                      decoration:  BoxDecoration(
                        border:  Border(
                          bottom: BorderSide(
                              color: CupertinoColors.opaqueSeparator, width: 1),
                        ),
                      ),
                      prefix: Icon(
                        CupertinoIcons.location_solid,
                        color: CupertinoColors.opaqueSeparator,
                      ),
                      padding:  EdgeInsets.all(8),
                      placeholder: "Location",
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const SizedBox(width: 14),
                      const Icon(CupertinoIcons.time,
                          color: CupertinoColors.opaqueSeparator),
                      const SizedBox(width: 8),
                      const Text(
                        "Delivery Time",
                        style:
                         TextStyle(color: CupertinoColors.opaqueSeparator),
                      ),
                      const Spacer(),
                      Text(
                        "$currentMonth ${currentDateTime.day},${currentDateTime.year} ${(timePeriod == "AM") ? currentDateTime.hour : currentDateTime.hour - 12}:${currentDateTime.minute} $timePeriod",
                        style:
                        const TextStyle(color: CupertinoColors.opaqueSeparator),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: CupertinoDatePicker(
                      onDateTimeChanged: (time) {
                        setState(() {
                          currentDateTime = time;

                          if (currentDateTime.month == 1) {
                            currentMonth = "Jan";
                          } else if (currentDateTime.month == 2) {
                            currentMonth = "Feb";
                          } else if (currentDateTime.month == 3) {
                            currentMonth = "Mar";
                          } else if (currentDateTime.month == 4) {
                            currentMonth = "Apr";
                          } else if (currentDateTime.month == 5) {
                            currentMonth = "May";
                          } else if (currentDateTime.month == 6) {
                            currentMonth = "Jun";
                          } else if (currentDateTime.month == 7) {
                            currentMonth = "Jul";
                          } else if (currentDateTime.month == 8) {
                            currentMonth = "August";
                          } else if (currentDateTime.month == 9) {
                            currentMonth = "Sep";
                          } else if (currentDateTime.month == 10) {
                            currentMonth = "Oct";
                          } else if (currentDateTime.month == 11) {
                            currentMonth = "Nov";
                          } else if (currentDateTime.month == 12) {
                            currentMonth = "Dec";
                          }
                        });

                        if (currentDateTime.hour > 12) {
                          timePeriod = "PM";
                        } else {
                          timePeriod = "AM";
                        }
                      },
                      initialDateTime: currentDateTime,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    height: 180,
                    child: SingleChildScrollView(
                      child: Column(
                        children: Global.cartProducts.map((e) {
                          return Container(
                            width: double.infinity,
                            height: 80,
                            child: Row(
                              children: [
                                const SizedBox(width: 10),
                                Container(
                                  alignment: Alignment.center,
                                  height: 70,
                                  width: 70,
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
                                Text("\$${e['price']}"),
                                const SizedBox(width: 12),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Shopping \$${getTotal()}",
                            style: const TextStyle(
                              color: CupertinoColors.inactiveGray,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Tax \$${getTotal() % 4}",
                            style:
                            const TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Total \$${getTotal() + getTotal() % 4}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  dynamic getTotal() {
    dynamic sum = 0;

    for (int i = 0; i < Global.cartProducts.length; i++) {
      sum += Global.cartProducts[i]['price'];
    }
    return sum;
  }
}
