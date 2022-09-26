import 'dart:html';

import 'package:aplikasirestaurant/widget/navbar.dart';
import 'package:flutter/material.dart';
import 'package:aplikasirestaurant/restaurant.dart';
import 'package:aplikasirestaurant/detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: RestaurantListPage.routeName,
      routes: {
        RestaurantListPage.routeName: (context) => const RestaurantListPage(),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            ),
      },
    );
  }
}

class RestaurantListPage extends StatelessWidget {
  static const routeName = '/restaurant_list';

  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant App'),
      ),
      bottomNavigationBar: const Navbar(),
      body: FutureBuilder<String>(
        future:
            DefaultAssetBundle.of(context).loadString('assets/restaurant.json'),
        builder: (context, snapshot) {
          final List<Restaurant> restaurant = parseRestaurant(snapshot.data);
          return ListView.builder(
            itemCount: restaurant.length,
            itemBuilder: (context, index) {
              return _buildItem(context, restaurant[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildItem(BuildContext context, Restaurant restaurant) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      leading: Image.network(
        restaurant.pictureId,
        width: 100,
      ),
      title: Text(restaurant.name),
      subtitle: Text(restaurant.city),
      onTap: () {
        Navigator.pushNamed(context, RestaurantDetailPage.routeName,
            arguments: restaurant);
      },
    );
  }
}
