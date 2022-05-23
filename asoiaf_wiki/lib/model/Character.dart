class Character {
  String? url;
  String? name;
  String? culture;
  String? born;
  String? died;
  List<String>? titles;
  List<String>? aliases;
  String? father;
  String? mother;
  String? spouse;
  List<String>? allegiances;
  List<String>? books;
  List<String>? povBooks;
  List<String>? tvSeries;
  List<String>? playedBy;

  Character(
      {this.url,
      this.name,
      this.culture,
      this.born,
      this.died,
      this.titles,
      this.aliases,
      this.father,
      this.mother,
      this.spouse,
      this.allegiances,
      this.books,
      this.povBooks,
      this.tvSeries,
      this.playedBy});

  Character.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
    culture = json['culture'];
    born = json['born'];
    died = json['died'];
    titles = json['titles'].cast<String>();
    aliases = json['aliases'].cast<String>();
    father = json['father'];
    mother = json['mother'];
    spouse = json['spouse'];
    allegiances = json['allegiances'].cast<String>();
    books = json['books'].cast<String>();
    tvSeries = json['povBooks'].cast<String>();
    tvSeries = json['tvSeries'].cast<String>();
    playedBy = json['playedBy'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['name'] = this.name;
    data['culture'] = this.culture;
    data['born'] = this.born;
    data['died'] = this.died;
    data['titles'] = this.titles;
    data['aliases'] = this.aliases;
    data['father'] = this.father;
    data['mother'] = this.mother;
    data['spouse'] = this.spouse;
    data['allegiances'] = this.allegiances;
    data['books'] = this.books;
    data['povBooks'] = this.tvSeries;
    data['tvSeries'] = this.tvSeries;
    data['playedBy'] = this.playedBy;
    return data;
  }
}