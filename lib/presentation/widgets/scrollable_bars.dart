import 'package:flutter/material.dart';

class ScrollableBars extends StatefulWidget {
  const ScrollableBars(
      {super.key,
      required this.data,
      required this.onPressed,
      required this.isMonth});
  final List data;
  final Function(String) onPressed;
  final bool isMonth;

  @override
  State<ScrollableBars> createState() => _ScrollableBarsState();
}

class _ScrollableBarsState extends State<ScrollableBars> {
  int? isActiveIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              widget.onPressed(widget.isMonth
                  ? widget.data[index]["v"]
                  : widget.data[index]);
              setState(() {
                isActiveIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                  decoration: BoxDecoration(
                    color: isActiveIndex == index ? Colors.blue : Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: Center(
                      child: Text(
                        widget.isMonth
                            ? widget.data[index]["m"]
                            : widget.data[index],
                        style: TextStyle(
                            color: isActiveIndex == index
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  )),
            ),
          );
        },
        itemCount: widget.data.length,
      ),
    );
  }
}
