import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sistem_pakar_db/model/gejala.dart';
import 'package:sistem_pakar_db/model/penyakit.dart';

import 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pc = PageController();

  int num = 0;

  int sumPage() {
    if (Gejala.listGejala.length % 5 == 0) {
      return Gejala.listGejala.length ~/ 5;
    } else {
      return (Gejala.listGejala.length ~/ 5) + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = List.generate(sumPage(), (index) {
      int arrLength() {
        if (index == sumPage() - 1) {
          return Gejala.listGejala.length % 5;
        } else {
          return 5;
        }
      }

      return Pages(startIndex: index * 5, arrLength: arrLength());
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Sistem Pakar hal $num'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Opacity(
            opacity: num > 0 ? 1 : 0,
            child: FloatingActionButton.extended(
              onPressed: () {
                if (num > 0) {
                  pc.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear,
                  );
                } else {
                  print('starting');
                }
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Prev'),
            ),
          ),
          FloatingActionButton.extended(
            onPressed: () {
              if (num < sumPage() - 1) {
                pc.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear,
                );
              } else {
                showDialog(
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
            },
            icon: num < sumPage() - 1
                ? const Icon(Icons.arrow_forward)
                : const Icon(Icons.done),
            label: num < sumPage() - 1 ? const Text('Next') : const Text('Done'),
          ),
        ],
      ),
      body: PageView(
        controller: pc,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (int index) {
          setState(() {
            // print('page: $index');
            num = index;
          });
        },
        children: pages,
      ),
    );
  }
}
