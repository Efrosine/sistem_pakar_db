class Penyakit {
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

  final String binary;
  final String nama;
}
