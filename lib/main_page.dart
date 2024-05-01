import 'package:flutter/material.dart';
import 'package:sistem_pakar_db/model/gejala.dart';
import 'helper/matching_bits.dart';
import 'pages.dart';
import 'helper/float_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController pc = PageController();

  int num = 0;
  late List<Widget> pages;

  @override
  void initState() {
    pages = List.generate(sumPage(), (index) {
      int arrLength() {
        if (index == sumPage() - 1) {
          return Gejala.listGejala.length % 5;
        } else {
          return 5;
        }
      }

      return Pages(startIndex: index * 5, arrLength: arrLength());
    });
    super.initState();
  }

  int sumPage() {
    if (Gejala.listGejala.length % 5 == 0) {
      return Gejala.listGejala.length ~/ 5;
    } else {
      return (Gejala.listGejala.length ~/ 5) + 1;
    }
  }

  Future<dynamic> showResult(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Hasil'),
          content: Text(MatchingBits().result),
          actions: [
            TextButton(
              onPressed: () {
                Gejala.reset();
                pc.jumpToPage(0);
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistem Pakar'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Opacity(
            opacity: num > 0 ? 1 : 0,
            child: FloatButton(
              onPressed: () {
                if (num > 0) {
                  pc.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear,
                  );
                }
              },
              label: 'Prev',
              icon: Icons.arrow_back,
            ),
          ),
          Text('${num + 1} / ${sumPage()}'),
          FloatButton(
            onPressed: () {
              if (num < sumPage() - 1) {
                pc.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear,
                );
              } else {
                showResult(context);
              }
            },
            label: num < sumPage() - 1 ? 'Next' : 'Done',
            icon: num < sumPage() - 1 ? Icons.arrow_forward : Icons.done,
            rightPostIcon: true,
          ),
        ],
      ),
      body: PageView(
        controller: pc,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (int index) {
          setState(() {
            num = index;
          });
        },
        children: pages,
      ),
    );
  }
}
