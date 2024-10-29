import 'dart:convert';

import 'package:final_proj_flutter/models/cart_item_model.dart';
import 'package:final_proj_flutter/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_tts/flutter_tts.dart';

class ChatProvider with ChangeNotifier {
  ChatModel _chats = ChatModel(message: '');
  static String serverUrl = 'http://localhost:5000/chat';
  ChatModel get chats => _chats;
  final List<CartItemModel> _cartItems = [];

  List<CartItemModel> get cartItems => _cartItems;

  void addItem(CartItemModel item) {
    print('additem실행');
    print(item.productName);
    bool isExist = false;
    for (var i = 0; i < _cartItems.length; i++) {
      if (_cartItems[i].productName == item.productName) {
        isExist = true;
        _cartItems[i].quantity++;
      }
    }
    if (!isExist) {
      _cartItems.add(item);
    }
    notifyListeners();
  }

  void removeItem(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void increaseQuantity(int index) {
    _cartItems[index].increaseQuantity();
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    _cartItems[index].decreaseQuantity();
    notifyListeners();
  }

  void sendMessage(String message) async {
    Uri uri = Uri.parse(serverUrl);
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'message': message});

    try {
      final response = await http.post(uri, headers: headers, body: body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['order_finish'] == true) {
          // print("주문 \ 목록: $data");
          addItem(CartItemModel(
            productName: data['order'][data['order'].length - 1]['menu'][0],
            singlePrice: data['order'][data['order'].length - 1]['price'],
            setPrice: data['order'][data['order'].length - 1]['price'],
          ));
        }
        final FlutterTts flutterTts = FlutterTts();
        await flutterTts.setLanguage("ko-KR"); // 한국어 설정 (영어는 en-US)
        await flutterTts.setPitch(1.2); // 음성 높낮이 설정
        await flutterTts.setSpeechRate(0.5); // 말하는 속도 설정
        await flutterTts.speak(data['message']);
        _chats = ChatModel(message: data['message']);
        notifyListeners();
      }
    } catch (e) {
      // 에러 처리
    }
  }

  void addMessage(String message) {
    _chats = ChatModel(message: message);
    notifyListeners();
    print(_chats.message);
  }
}
