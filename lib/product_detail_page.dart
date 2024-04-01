import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    super.initState();
    selectedsize = 9;
    selectedsizeCondition = true;
  }

  late int selectedsize = 0;
  late bool selectedsizeCondition;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: const Icon(Icons.arrow_back_ios_new),
        title: const Text(
          "Details",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            Text(
              widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Image.asset(widget.product['imageUrl'] as String),
            const Spacer(
              flex: 2,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(230, 232, 232, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "\$${widget.product['price']}",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: (widget.product['sizes'] as List).length,
                          itemBuilder: (context, index) {
                            final size =
                                (widget.product['sizes'] as List)[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedsize = size;
                                  });
                                },
                                child: Chip(
                                  label: Text(
                                    size.toString(),
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  backgroundColor: selectedsize == size &&
                                          selectedsizeCondition == true
                                      ? Theme.of(context).primaryColor
                                      : const Color.fromRGBO(245, 247, 249, 1),
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          minimumSize: const Size(double.infinity, 60),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart_rounded,
                              color: Colors.black,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Add to Cart",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
