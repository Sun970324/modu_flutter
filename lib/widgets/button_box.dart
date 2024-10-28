import 'dart:async';

import 'package:final_proj_flutter/screens/cart_screen.dart';
import 'package:final_proj_flutter/util/appcolors.dart';
import 'package:final_proj_flutter/util/apptext.dart';
import 'package:final_proj_flutter/widgets/basic_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

enum ButtonState { buttonDefault, inUse, disabled }

class ButtonBox extends StatefulWidget {
  const ButtonBox({super.key});

  @override
  State<ButtonBox> createState() => _ButtonBoxState();
}

class _ButtonBoxState extends State<ButtonBox> {
  bool _isListeningLoading = false;
  bool _isListening = false;
  Timer? _timer;
  final stt.SpeechToText _speechToText = stt.SpeechToText();

  void _startListening() async {
    bool available = await _speechToText.initialize();
    if (available) {
      setState(() {
        _isListening = true;
        _isListeningLoading = true;
      });
      _speechToText.listen(
        onResult: (result) {
          if (result.finalResult) {
            print(result.recognizedWords);
            print(result.finalResult);
            setState(() {
              _isListening = false;
              _isListeningLoading = false;
            });
          }
        },
        localeId: 'ko_KR',
      );
      _timer = Timer(const Duration(seconds: 3), () {
        _stopListening();
        print("타이머 만료로 음성 인식 종료");
      });
    } else {
      setState(() {
        _isListening = false;
        _isListeningLoading = false;
      });
    }
  }

  void _stopListening() async {
    await _speechToText.stop();
    _timer?.cancel(); // 타이머 취소
    setState(() {
      _isListening = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppColors.buttonSetDefault,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              if (_isListening) {
                _stopListening();
              } else {
                _startListening();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 5,
            ),
            child: Text(
              _isListening ? '정지' : '말하기',
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          // FloatingActionButton(
          //   onPressed: _isListening ? _stopListening : _startListening,
          //   child: BasicButton(
          //       label: _isListening ? '말 중지' : '말하기',
          //       textStyle: AppText.buttonText),
          // ),
          const SizedBox(width: 24),
          BasicButton(label: '메뉴 다 보기', textStyle: AppText.buttonText),
          const SizedBox(width: 24),
          FloatingActionButton(
            heroTag: 'cart',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartPage(),
              ),
            ),
            child: BasicButton(label: '장바구니', textStyle: AppText.buttonText),
          ),
        ],
      ),
    );
  }
}
