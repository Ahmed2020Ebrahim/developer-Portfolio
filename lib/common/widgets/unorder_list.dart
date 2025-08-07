import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/helper_functions.dart';

class UnorderedList extends StatelessWidget {
  final List<String> items;
  final String title;

  const UnorderedList({super.key, required this.items, required this.title});

  @override
  Widget build(BuildContext context) {
    bool isMobile = HelperFunctions.isMobile(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //title
        Text(
          title,
          style: TextStyle(
            fontSize: isMobile ? 22 : 18,
            fontWeight: isMobile ? FontWeight.w400 : FontWeight.w300,
            color: Colors.white,
            fontFamily: "Montserrat",
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
                items.map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "• ",
                            style: TextStyle(fontSize: isMobile ? 22 : 18, color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: isMobile ? 15 : 12,
                              color: Colors.white.withValues(alpha: isMobile ? 0.8 : 0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}
