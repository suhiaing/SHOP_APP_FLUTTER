import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  late String selectedFilter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                )
              ],
            ),
          )),
    );
  }
}
