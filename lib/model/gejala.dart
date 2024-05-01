class Gejala {
  Gejala({required this.nama, this.isSelected = false});

  static List<Gejala> listGejala = [
    Gejala(nama: 'Demam tinggi'), //1
    Gejala(nama: 'Nyeri otot dan sendi'), //2
    Gejala(nama: 'Sakit kepala'), //3
    Gejala(nama: 'Ruam kulit'), //4
    Gejala(nama: 'Nyeri di belakang mata'), //5
    Gejala(nama: 'Mual dan muntah'), //6
    Gejala(nama: 'Penurunan jumlah trombosit dalam darah (trombositopenia)'), //7
    Gejala(nama: 'Perdarahan dari hidung atau gusi'), //8
    Gejala(nama: 'Pembengkakan kelenjar getah bening'), //9
  ];

  final String nama;

  bool isSelected;

  static String get binary {
    String result = '';
    for (int i = 0; i < listGejala.length; i++) {
      result += listGejala[i].isSelected ? '1' : '0';
    }
    return result;
  }

  static reset() {
    for (int i = 0; i < listGejala.length; i++) {
      listGejala[i].isSelected = false;
    }
  }
}
