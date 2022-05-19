class Character{
  String? url;
  String? name;
  String? gender;
  String? culture;
  String? born;
  String? died;
  List<String>? titles = [];
  List<String>? aliases = [];
  String? father;
  String? mother;
  String? spouse;
  List<String>? books = [];

  Character({
    this.url,
    this.name,
    this.gender,
    this.culture,
    this.born,
    this.died,
    this.titles,
    this.aliases,
    this.father,
    this.mother,
    this.spouse,
    this.books
  });

    Character.fromJson(Map<String, dynamic> json){
    url = json['url'];
    name = json['name'];
    gender = json['gender'];
    culture = json['culture'];
    born = json['born'];
    died = json['died'];
    titles = json['titles'];
    aliases = json['aliases'];
    father = json['father'];
    mother = json['mother'];
    spouse = json['spouse'];
    books = json['books'];
  }
}