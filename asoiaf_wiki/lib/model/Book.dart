class Book{
  String? url;
  String? name;
  int? numberOfPages;
  List<String>? povCharacters = [];

  Book({
      this.url,
      this.name,
      this.numberOfPages,
      this.povCharacters
    });

  Book.fromJson(Map<String, dynamic> json){
    url = json['url'];
    name = json['name'];
    numberOfPages = json['numberOfPages'];
    povCharacters = json['povCharacters'];
  }
}