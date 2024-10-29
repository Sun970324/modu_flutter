import 'package:final_proj_flutter/providers/chat_provider.dart';
import 'package:final_proj_flutter/util/apptext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LLMresponse extends StatelessWidget {
  final String text;

  const LLMresponse({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final ChatProvider chatProvider = Provider.of<ChatProvider>(context);

    return Container(
      width: 300,
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ClipRRect(
        child: SingleChildScrollView(
          child: Text(
            chatProvider.chats.message,
            style: AppText.llmText,
          ),
        ),
      ),
    );
  }
}
