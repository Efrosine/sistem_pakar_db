class Gejala {
  final String nama;
  bool isSelected;

  Gejala({required this.nama, this.isSelected = false});

  static List<Gejala> listGejala = [
    Gejala(nama: 'gejala1'),
    Gejala(nama: 'gejala2'),
    Gejala(nama: 'gejala3'),
    Gejala(nama: 'gejala4'),
    Gejala(nama: 'gejala5'),
    Gejala(nama: 'gejala6'),
    Gejala(nama: 'gejala7'),
    Gejala(nama: 'gejala8'),
    Gejala(nama: 'gejala9'),
    Gejala(nama: 'gejala10'),
    Gejala(nama: 'gejala11'),
    Gejala(nama: 'gejala12'),
    Gejala(nama: 'gejala13'),
    Gejala(nama: 'gejala14'),
  ];

  static reset() {
    for (int i = 0; i < listGejala.length; i++) {
      listGejala[i].isSelected = false;
    }
  }

  static String get binary {
    String result = '';
    for (int i = 0; i < listGejala.length; i++) {
      result += listGejala[i].isSelected ? '1' : '0';
    }
    return result;
  }
}
