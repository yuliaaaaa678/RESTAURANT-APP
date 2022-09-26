import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:aplikasirestaurant/restaurant.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;

  const RestaurantDetailPage({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(restaurant.pictureId),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    "city : ${restaurant.city}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "rating : ${restaurant.rating}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    "description : ${restaurant.description}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Menu : ${restaurant.name}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: restaurant.menus.drinks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Text(
                          restaurant.menus.drinks[index].name,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: restaurant.menus.foods.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Text(
                          restaurant.menus.foods[index].name,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
