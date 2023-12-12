import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todolist/ui/screens/welcome.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    Key? key,
    required this.child,
    bool addGestureDetector = false, // Tambahkan parameter baru di sini
  })  : _addGestureDetector = addGestureDetector,
        super(key: key);

  final Widget? child;
  final bool _addGestureDetector;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blueGrey),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          if (_addGestureDetector)
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                    child: const WelcomeView(),
                    type: PageTransitionType.bottomToTop,
                    duration: const Duration(milliseconds: 500),
                    reverseDuration: const Duration(milliseconds: 500),
                  ),
                  (route) => false,
                );
              },
            ),
          SafeArea(
            child: child!,
          ),
        ],
      ),
    );
  }
}
