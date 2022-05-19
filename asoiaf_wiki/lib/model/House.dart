class House{
  String? url;
  String? name;
  String? region;
  String? coatOfArms;
  String? words;
  List<String>? titles = [];
  List<String>? seats = [];
  String? currentLord;
  String? heir;
  String? overLord;
  String? founded;
  String? founder;

  House({
    this.url,
    this.name,
    this.region,
    this.coatOfArms,
    this.words,
    this.titles,
    this.seats,
    this.currentLord,
    this.heir,
    this.overLord,
    this.founded,
    this.founder
  });

  House.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
    region = json['region'];
    coatOfArms = json['coatOfArms'];
    words = json['words'];
    titles = json['titles'];
    seats = json['seats'];
    currentLord = json['currentLord'];
    heir = json['heir'];
    overLord = json['overLord'];
    founded = json['founded'];
    founder = json['founder'];
  }
}