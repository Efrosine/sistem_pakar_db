import 'package:sistem_pakar_db/model/gejala.dart';

class Penyakit {
  final String binary;
  final String nama;

  Penyakit({required this.binary, required this.nama});

  static List<Penyakit> listPenyakit = [
    Penyakit(
      binary: '111000010',
      nama: 'Demam Berdarah Dengue (DBD)',
    ),
    Penyakit(
      binary: '111001000',
      nama: 'Influenza (Flu)',
    ),
    Penyakit(
      binary: '110000101',
      nama: 'Tipes',
    ),
    Penyakit(
      binary: '100101100',
      nama: 'Virus Ebola',
    ),
  ];
}

class MatchingBits {
  String get result {
    int count = getMaxMachingBit().length;
    if (count > 0) {
      if (count == 1) {
        return 'Penyakit yang mungkin terjadi adalah ${getMaxMachingBit()[0].nama}';
      } else {
        return 'Salah satu penyakit yang mungkin terjadi adalah ${arrToString(getMaxMachingBit())}';
      }
    }
    return 'Tidak ditemukan';
  }

  int machingBit(String a, String b) {
    int count = 0;
    for (int i = 0; i < a.length; i++) {
      if (a[i].compareTo(b[i]) == 0) {
        count++;
      }
    }
    return count;
  }

  List<Penyakit> getMaxMachingBit() {
    List<Penyakit> penyakit = [];
    int max = 0;
    for (int i = 0; i < Penyakit.listPenyakit.length; i++) {
      int count = machingBit(Penyakit.listPenyakit[i].binary, Gejala.binary);
      if (count > max) {
        max = count;
        penyakit.clear();
        penyakit.add(Penyakit.listPenyakit[i]);
      } else if (count == max) {
        penyakit.add(Penyakit.listPenyakit[i]);
      }
    }
    return penyakit;
  }

  String arrToString(List<Penyakit> penyakit) {
    String result = '';
    for (int i = 0; i < penyakit.length; i++) {
      result += '${penyakit[i].nama}, ';
    }
    return result;
  }
}
