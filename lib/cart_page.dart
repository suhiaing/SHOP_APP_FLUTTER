import 'package:flutter/material.dart';
import 'package:shop_app_flutter/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    print(cart);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            print(index);
            final cartItem = cart[index];
            print(cartItem);
            return Padding(
              padding: const EdgeInsets.all(15),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(cartItem['imageUrl'] as String),
                ),
                title: Text(
                  cartItem['title'] as String,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "size: ${(cartItem['size'] as int).toString()}",
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                ),
              ),
            );
          }),
    );
  }
}
