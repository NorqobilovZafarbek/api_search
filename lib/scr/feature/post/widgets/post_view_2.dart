import 'package:flutter/material.dart';

class ShimmerSkelet extends StatelessWidget {
  const ShimmerSkelet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Card(
        color: const Color(0xFFD8D9DA),
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 70,
                height: 10,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Color(0xC561677A)),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                children: List.generate(
                  5,
                  (index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: SizedBox(
                      width: double.infinity,
                      height: 10,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Color(0xC561677A)),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: List.generate(
                  3,
                  (index) => const Padding(
                    padding: EdgeInsets.only(top: 5, right: 4),
                    child: SizedBox(
                      width: 20,
                      height: 10,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Color(0xC561677A)),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
