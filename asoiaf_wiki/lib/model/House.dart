class House {
  String? url;
  String? name;
  String? region;
  String? coatOfArms;
  String? words;
  List<String>? titles;
  List<String>? seats;
  String? currentLord;
  String? heir;
  String? overlord;
  String? founded;
  String? founder;
  String? diedOut;
  List<String>? ancestralWeapons;
  List<String>? cadetBranches;
  List<String>? swornMembers;

  House(
      {this.url,
      this.name,
      this.region,
      this.coatOfArms,
      this.words,
      this.titles,
      this.seats,
      this.currentLord,
      this.heir,
      this.overlord,
      this.founded,
      this.founder,
      this.diedOut,
      this.ancestralWeapons,
      this.cadetBranches,
      this.swornMembers});

  House.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
    region = json['region'];
    coatOfArms = json['coatOfArms'];
    words = json['words'];
    titles = json['titles'].cast<String>();
    seats = json['seats'].cast<String>();
    currentLord = json['currentLord'];
    heir = json['heir'];
    overlord = json['overlord'];
    founded = json['founded'];
    founder = json['founder'];
    diedOut = json['diedOut'];
    ancestralWeapons = json['ancestralWeapons'].cast<String>();
    cadetBranches = json['cadetBranches'].cast<String>();
    swornMembers = json['swornMembers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['name'] = this.name;
    data['region'] = this.region;
    data['coatOfArms'] = this.coatOfArms;
    data['words'] = this.words;
    data['titles'] = this.titles;
    data['seats'] = this.seats;
    data['currentLord'] = this.currentLord;
    data['heir'] = this.heir;
    data['overlord'] = this.overlord;
    data['founded'] = this.founded;
    data['founder'] = this.founder;
    data['diedOut'] = this.diedOut;
     data['ancestralWeapons'] = this.ancestralWeapons;
    data['cadetBranches'] = this.cadetBranches;
    data['swornMembers'] = this.swornMembers;
    return data;
  }
}