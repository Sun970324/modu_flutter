// 메뉴 전체화면 페이지
import 'package:final_proj_flutter/models/cart_item_model.dart';
import 'package:final_proj_flutter/models/menu_model.dart';
import 'package:final_proj_flutter/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuDetail extends StatelessWidget {
  final MenuModel item;
  const MenuDetail({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Column(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  '/Users/sun/Desktop/hackaton/flutter/frontend/assets/images/set1.png',
                  fit: BoxFit.cover,
                ),
              ),
              Text(item.name),
              Text('단품: ${item.priceSingle}원'),
              Text('세트: ${item.priceSet}원'),
              Text(item.description),
              FloatingActionButton(
                onPressed: () => cartProvider.addItem(
                  CartItemModel(
                      productName: item.name,
                      singlePrice: item.priceSingle,
                      setPrice: item.priceSet),
                ),
                child: const Text('장바구니 추가'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
