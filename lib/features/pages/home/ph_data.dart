class PhData {
  final int id;
  final String value;
  PhData({required this.id, required this.value});
  factory PhData.fromJson(Map<String, dynamic> json) {
    return PhData(
      id: json['id'],
      value: json['value'],
    );
  }
}
