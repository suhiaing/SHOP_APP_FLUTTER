import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variables.dart';
import 'package:shop_app_flutter/widgets/product_card.dart';
import 'package:shop_app_flutter/pages/product_detail_page.dart';

class PageList extends StatefulWidget {
  const PageList({
    super.key,
  });

  @override
  State<PageList> createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(100),
    borderSide: const BorderSide(
      color: Colors.black12,
    ),
  );

  final List<String> filters = [
    'All',
    'Addidas',
    'Nike',
    'Beta',
    'Dior',
    'Alpha'
  ];

  List colorPickerStorage = [];

  void colorPicker(int length) {
    int i = 0;

    while (i <= length) {
      if (i.isOdd) {
        colorPickerStorage.add(i);
        i += 1;
      } else if (i.isEven) {
        colorPickerStorage.add(i);
        i += 3;
      }
    }
  }

  late String selectedFilter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Shoes\nCollection",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      //border: border,
                      focusedBorder: border,
                      enabledBorder: border,
                      hintText: "Search",
                      suffixIcon: const Icon(Icons.search),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: filters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      right: 40,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                        label: Text(
                          filter,
                        ),
                        labelStyle: const TextStyle(
                          fontSize: 16,
                        ),
                        backgroundColor: selectedFilter == filter
                            ? Theme.of(context).primaryColor
                            : const Color.fromRGBO(245, 247, 249, 1),
                        side: const BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 650) {
                  colorPicker(products.length);
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 2),
                    itemCount: products.length,
                    itemBuilder: ((context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetailPage(product: product);
                              },
                            ),
                          );
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          image: product['imageUrl'] as String,
                          bgColor: colorPickerStorage.contains(index)
                              ? const Color.fromRGBO(216, 240, 253, 1)
                              : const Color.fromRGBO(245, 247, 249, 1),
                        ),
                      );
                    }),
                  );
                } else {
                  return ListView.builder(
                    itemCount: products.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: ((context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetailPage(product: product);
                              },
                            ),
                          );
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          image: product['imageUrl'] as String,
                          bgColor: index.isEven
                              ? const Color.fromRGBO(216, 240, 253, 1)
                              : const Color.fromRGBO(245, 247, 249, 1),
                        ),
                      );
                    }),
                  );
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
