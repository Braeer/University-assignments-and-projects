import 'package:flutter/cupertino.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProducrCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return CupertinoCard(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(product.imageUrl, height: 100, width: 100),
            SizedBox(height: 8.0),
            Text(
              product.name,
              style: CupertinoTheme.of(context).textTheme.textStyle,
            ),
            SizedBox(height: 4.0),
            Text(
              product.description,
              style: CupertinoTheme.of(context)
                  .textTheme
                  .textStyle
                  .copyWith(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
