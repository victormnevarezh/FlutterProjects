class Book {
  String? url;
  String? name;
  String? isbn;
  List<String>? authors;
  int? numberOfPages;
  String? publisher;
  String? country;
  String? mediaType;
  String? released;
  List<String>? characters;
  List<String>? povCharacters;

  Book(
      {this.url,
      this.name,
      this.isbn,
      this.authors,
      this.numberOfPages,
      this.publisher,
      this.country,
      this.mediaType,
      this.released,
      this.characters,
      this.povCharacters});

  Book.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
    isbn = json['isbn'];
    authors = json['authors'].cast<String>();
    numberOfPages = json['numberOfPages'];
    publisher = json['publisher'];
    country = json['country'];
    mediaType = json['mediaType'];
    released = json['released'];
    characters = json['characters'].cast<String>();
    povCharacters = json['povCharacters'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['name'] = this.name;
    data['isbn'] = this.isbn;
    data['authors'] = this.authors;
    data['numberOfPages'] = this.numberOfPages;
    data['publisher'] = this.publisher;
    data['country'] = this.country;
    data['mediaType'] = this.mediaType;
    data['released'] = this.released;
    data['characters'] = this.characters;
    data['povCharacters'] = this.povCharacters;
    return data;
  }
}