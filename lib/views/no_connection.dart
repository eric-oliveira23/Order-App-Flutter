import 'package:app_pedidos/components/separator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoConnectionPage extends StatelessWidget {
  const NoConnectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/noconnection.json',
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),
            const Text(
              'Ops!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SeparatorSmall(),
            const Text(
              'Parece que você está sem conexão com a internet.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            const SeparatorMain(),
            SizedBox(
              height: 45,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: Colors.blue[200],
                ),
                child: const Text(
                  'Tentar novamamente',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
