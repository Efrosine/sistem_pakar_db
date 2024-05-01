import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sistem_pakar_db/model/gejala.dart';

class Pages extends StatefulWidget {
  const Pages({super.key, required this.startIndex, required this.arrLength});

  final int arrLength;
  final int startIndex;

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  final List<Widget> option = const [Text('Tidak'), Text('Ya')];

  late List<List<bool>> isSelected;

  @override
  void initState() {
    isSelected = List.generate(
      widget.arrLength,
      (index) {
        if (Gejala.listGejala[index + widget.startIndex].isSelected) {
          return [false, true];
        } else {
          return [true, false];
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        itemCount: widget.arrLength,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.hardEdge,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Gejala.listGejala[index + widget.startIndex].nama),
                  const Gap(8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ToggleButtons(
                      isSelected: isSelected[index],
                      onPressed: (int newIndex) {
                        Gejala.listGejala[index + widget.startIndex].isSelected =
                            newIndex == 1;
                        setState(() {
                          for (int i = 0; i < isSelected[index].length; i++) {
                            isSelected[index][i] = i == newIndex;
                          }
                        });
                      },
                      children: option,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
