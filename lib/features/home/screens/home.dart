import 'package:flutter/material.dart';
import 'package:flutter_graduation_nti/data/models/product.dart';
import 'package:flutter_graduation_nti/features/cart/screens/cart.dart';
import 'package:flutter_graduation_nti/data/services/api_services.dart';
import 'package:flutter_graduation_nti/core/constants/constantcolors.dart';
import 'package:flutter_graduation_nti/core/constants/widgets/providers/theme/settings.dart';
import 'package:flutter_graduation_nti/features/auth/screens/login.dart';
import 'package:flutter_graduation_nti/features/cart/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = ApiService.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 186, 155, 192),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://i.pinimg.com/736x/58/e2/61/58e2613e9ae08e4b5a5d3791418464c1.jpg",
                ),
                radius: 20,
              ),
              accountName: const Text(
                "Hagar Gamal",
                style: TextStyle(
                  color: Color.fromARGB(255, 54, 43, 58),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              accountEmail: const Text("gamalhagar096@gmail.com"),
            ),

            // Settings
            ListTile(
              leading: Icon(Icons.settings, color: BtN),
              title: Text(
                t.settings,
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
            ),

            // Logout
            ListTile(
              leading: Icon(Icons.logout, color: BtN),
              title: Text(
                t.logout,
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: BtN,
        title: Text(
          t.homePage,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
        actions: [
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(),
                        ),
                      );
                    },
                  ),
                  if (cart.count > 0)
                    Positioned(
                      right: 6,
                      top: 6,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          cart.count.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                "${t.error}: ${snapshot.error}",
                style: const TextStyle(fontSize: 18),
              ),
            );
          }

          final products = snapshot.data!;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: Image.network(
                    product.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text("\$ ${product.price}"),
                  trailing: Consumer<CartProvider>(
                    builder: (context, cart, _) {
                      final isAdded = cart.isInCart(product);

                      return IconButton(
                        onPressed: isAdded
                            ? null
                            : () {
                                cart.addToCart(product);
                              },
                        icon: Icon(
                          isAdded
                              ? Icons.check_circle
                              : Icons.add_shopping_cart,
                          color: isAdded ? Colors.green : BtN,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
