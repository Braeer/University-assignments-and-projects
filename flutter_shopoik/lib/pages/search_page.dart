import 'package:flutter/cupertino.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              CupertinoTextField(
                placeholder: 'Введите текст для поиска...',
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: CupertinoColors.systemGrey6,
                ),
                prefix: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(CupertinoIcons.search),
                ),
              ),
              const SizedBox(height: 200.0),
              const Center(
                child: Icon(
                  CupertinoIcons.search,
                  size: 80,
                  color: CupertinoColors.systemGrey,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Функция поиска будет добавлена позже!',
                style: TextStyle(
                  fontSize: 20,
                  color: CupertinoColors.systemGrey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
