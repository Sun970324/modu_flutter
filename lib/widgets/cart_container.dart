// 장바구니 표시 컨테이너
import 'package:final_proj_flutter/providers/chat_provider.dart';
import 'package:final_proj_flutter/util/appcolors.dart';
import 'package:final_proj_flutter/util/apptext.dart';
import 'package:final_proj_flutter/widgets/cart_item_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartContainer extends StatelessWidget {
  const CartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.moduRed,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(60),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 20,
            offset: Offset(20, -4),
          ),
        ],
      ),
      child: Consumer<ChatProvider>(
        builder: (context, provider, child) {
          if (provider.cartItems.isEmpty) {
            return Center(
              child: Text(
                '장바구니가 비어 있습니다.',
                style: AppText.cartItemText,
              ),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              itemCount: provider.cartItems.length,
              itemBuilder: (context, index) {
                return CartItemView(
                  cartItem: provider.cartItems[index],
                  index: index,
                );
              },
            );
          }
        },
      ),
    );
  }
}
