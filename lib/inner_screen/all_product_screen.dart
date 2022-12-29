import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/feed_item_widget.dart';

import '../services/utils.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);
  static const routeName = '/ProductsScreen';

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final TextEditingController _searchEditingController =
      TextEditingController();
  final FocusNode _searchTextFocusNode = FocusNode();

  @override
  void dispose() {
    _searchEditingController.dispose();
    _searchTextFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool _isEmpty = false;
    final Utils utils = Utils(context);
    bool isDark = utils.getTheme;
    Color textColor = utils.myTextColor;
    final screenSize = utils.getScreenSize;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? Colors.black87 : Colors.blueAccent.shade200,
        leading: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            IconlyLight.arrowLeft2,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'All Products',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: kBottomNavigationBarHeight,
                child: TextField(
                  focusNode: _searchTextFocusNode,
                  controller: _searchEditingController,
                  onChanged: (valuee) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).cardColor,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).cardColor,
                        width: 1,
                      ),
                    ),
                    hintText: 'What is in your mind.',
                    prefixIcon: const Icon(Icons.search),
                    suffix: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: _searchTextFocusNode.hasFocus
                            ? Colors.red
                            : textColor,
                      ),
                      onPressed: (() {
                        _searchEditingController.clear();
                        _searchTextFocusNode.unfocus();
                      }),
                    ),
                  ),
                ),
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: screenSize.width / (screenSize.height * 0.6),
              padding: EdgeInsets.zero,
              children: List.generate(8, (index) {
                return const FeedWidget();
              }),
            )
          ],
        ),
      ),
    );
  }
}
