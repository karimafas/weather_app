class MockResponse {
  const MockResponse({required this.id, required this.name});

  factory MockResponse.fromJson(Map<String, dynamic> json) =>
      MockResponse(id: json['id'] as int, name: json['name'] as String);

  final int id;
  final String name;
}
