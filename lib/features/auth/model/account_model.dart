class AccountModel{
  final String? name;
  final String email;
  final String? imageUrl;

  AccountModel({required this.name, required this.email, required this.imageUrl});

  factory AccountModel.fromJson(String? name,String email,String? imageUrl){
    return AccountModel(name: name,email: email,imageUrl: imageUrl);
  }

  @override
  String toString() {
    return 'AccountModel{name: $name, email: $email, imageUrl: $imageUrl}';
  }
}