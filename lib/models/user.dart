class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final String address;
  final String company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final addr = json['address'];
    final company = json['company'];
    String addressStr = '';
    if (addr != null) {
      final street = addr['street'] ?? '';
      final suite = addr['suite'] ?? '';
      final city = addr['city'] ?? '';
      final zipcode = addr['zipcode'] ?? '';
      addressStr = '$street $suite, $city, $zipcode';
    }
    String companyStr = '';
    if (company != null) {
      companyStr = company['name'] ?? '';
    }
    return User(
      id: json['id'] as int,
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      website: json['website'] ?? '',
      address: addressStr,
      company: companyStr,
    );
  }
}
