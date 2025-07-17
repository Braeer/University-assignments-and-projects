import 'package:flutter/cupertino.dart';

class Product {
  final String name;
  final String description;
  final String imageUrl;

  Product(
      {required this.name, required this.description, required this.imageUrl});
}

// Пример списка продуктов
List<Product> products = [
  Product(
    name: 'Яблоко',
    description: 'Свежее и вкусное',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Red_Apple.jpg/1200px-Red_Apple.jpg',
  ),
  Product(
    name: 'Банан',
    description: 'Полезный и питательный',
    imageUrl: 'https://via.placeholder.com/100',
  ),
  Product(
    name: 'Апельсин',
    description: 'Сочный и сладкий',
    imageUrl: 'https://via.placeholder.com/100',
  ),
  Product(
    name: 'Груша',
    description: 'Сладкая и вкусная',
    imageUrl: 'https://via.placeholder.com/100',
  ),
  // Добавьте больше продуктов при необходимости
];

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.2),
            blurRadius: 5.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(product.imageUrl, height: 100, width: 100),
            SizedBox(height: 8.0),
            Text(
              product.name,
              style: CupertinoTheme.of(context)
                  .textTheme
                  .textStyle
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              product.description,
              style: CupertinoTheme.of(context)
                  .textTheme
                  .textStyle
                  .copyWith(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
