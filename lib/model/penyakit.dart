import 'package:sistem_pakar_db/model/gejala.dart';

class Penyakit {
  final String binary;
  final String nama;

  Penyakit({required this.binary, required this.nama});

  static List<Penyakit> listPenyakit = [
    Penyakit(binary: '11100000000000', nama: 'Penyakit 1'),
    Penyakit(binary: '00011100000000', nama: 'Penyakit 2'),
    Penyakit(binary: '00000011100000', nama: 'Penyakit 3'),
    Penyakit(binary: '11111111100000', nama: 'Penyakit 4'),
    Penyakit(binary: '11110001000000', nama: 'Penyakit 5'),
  ];

  static String get result {
    for (int i = 0; i < listPenyakit.length; i++) {
      if (listPenyakit[i].binary.contains(Gejala.binary)) {
        return listPenyakit[i].nama;
      }
    }
    return 'Tidak ditemukan';
  }
}
