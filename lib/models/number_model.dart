class NumberModel {
  final int number;

  NumberModel(this.number);

  Map<String, int> toMap() => {
        'number': number,
      };

  factory NumberModel.fromMap(Map map) => NumberModel(map['number']);
}
