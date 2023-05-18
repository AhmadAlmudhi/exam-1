class Person {
  String? name, age, address;

  Person({
    this.name,
    this.age,
    this.address,
  });

  factory Person.fromJson({required Map json}) {
    return Person(
      name: json['name'],
      age: json['age'],
      address: json['address'],
    );
  }

  toMap() {
    return {
      "name": name,
      "age": age,
      "address": address,
    };
  }
}
