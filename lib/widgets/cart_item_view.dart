// 선택된 내용 라인 구성 (장바구니 표시 컨테이너 구성요소)
import 'package:final_proj_flutter/models/cart_item_model.dart';
import 'package:final_proj_flutter/providers/cart_provider.dart';
import 'package:final_proj_flutter/util/appcolors.dart';
import 'package:final_proj_flutter/util/apptext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemView extends StatelessWidget {
  final CartItemModel cartItem;
  final int index;

  const CartItemView({super.key, required this.cartItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
      decoration: BoxDecoration(
        color: AppColors.moduRed,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            cartItem.productName,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
          Text(
            '${cartItem.singlePrice}원',
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                color: AppColors.lightText,
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false)
                      .decreaseQuantity(index);
                },
              ),
              Text(
                '${cartItem.quantity}',
                style: AppText.cartItemText,
              ),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                color: AppColors.lightText,
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false)
                      .increaseQuantity(index);
                },
              ),
              Text(
                '개',
                style: AppText.cartItemText,
              ),
              TextButton(
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false)
                      .removeItem(index);
                },
                child: const Text(
                  '삭제',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
