class CardsModel {
  Player? player;
  List<Statistics>? statistics;

  CardsModel({this.player, this.statistics});

  CardsModel.fromJson(Map<String, dynamic> json) {
    player = json['player'] != null ? new Player.fromJson(json['player']) : null;
    if (json['statistics'] != null) {
      statistics = <Statistics>[];
      json['statistics'].forEach((v) { statistics!.add(new Statistics.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Player {
  int? id;
  String? name;
  String? firstname;
  String? lastname;
  int? age;
  Birth? birth;
  String? nationality;
  String? height;
  String? weight;
  bool? injured;
  String? photo;

  Player({this.id, this.name, this.firstname, this.lastname, this.age, this.birth, this.nationality, this.height, this.weight, this.injured, this.photo});

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    age = json['age'];
    birth = json['birth'] != null ? new Birth.fromJson(json['birth']) : null;
    nationality = json['nationality'];
    height = json['height'];
    weight = json['weight'];
    injured = json['injured'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['age'] = this.age;
    if (this.birth != null) {
      data['birth'] = this.birth!.toJson();
    }
    data['nationality'] = this.nationality;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['injured'] = this.injured;
    data['photo'] = this.photo;
    return data;
  }
}

class Birth {
  String? date;
  String? place;
  String? country;

  Birth({this.date, this.place, this.country});

  Birth.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    place = json['place'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['place'] = this.place;
    data['country'] = this.country;
    return data;
  }
}

class Statistics {
  Team? team;
  League? league;
  Games? games;
  Substitutes? substitutes;
  Shots? shots;
  Goals? goals;
  Passes? passes;
  Tackles? tackles;
  Duels? duels;
  Dribbles? dribbles;
  Fouls? fouls;
  Cards? cards;
  Penalty? penalty;

  Statistics({this.team, this.league, this.games, this.substitutes, this.shots, this.goals, this.passes, this.tackles, this.duels, this.dribbles, this.fouls, this.cards, this.penalty});

  Statistics.fromJson(Map<String, dynamic> json) {
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
    league = json['league'] != null ? new League.fromJson(json['league']) : null;
    games = json['games'] != null ? new Games.fromJson(json['games']) : null;
    substitutes = json['substitutes'] != null ? new Substitutes.fromJson(json['substitutes']) : null;
    shots = json['shots'] != null ? new Shots.fromJson(json['shots']) : null;
    goals = json['goals'] != null ? new Goals.fromJson(json['goals']) : null;
    passes = json['passes'] != null ? new Passes.fromJson(json['passes']) : null;
    tackles = json['tackles'] != null ? new Tackles.fromJson(json['tackles']) : null;
    duels = json['duels'] != null ? new Duels.fromJson(json['duels']) : null;
    dribbles = json['dribbles'] != null ? new Dribbles.fromJson(json['dribbles']) : null;
    fouls = json['fouls'] != null ? new Fouls.fromJson(json['fouls']) : null;
    cards = json['cards'] != null ? new Cards.fromJson(json['cards']) : null;
    penalty = json['penalty'] != null ? new Penalty.fromJson(json['penalty']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.team != null) {
      data['team'] = this.team!.toJson();
    }
    if (this.league != null) {
      data['league'] = this.league!.toJson();
    }
    if (this.games != null) {
      data['games'] = this.games!.toJson();
    }
    if (this.substitutes != null) {
      data['substitutes'] = this.substitutes!.toJson();
    }
    if (this.shots != null) {
      data['shots'] = this.shots!.toJson();
    }
    if (this.goals != null) {
      data['goals'] = this.goals!.toJson();
    }
    if (this.passes != null) {
      data['passes'] = this.passes!.toJson();
    }
    if (this.tackles != null) {
      data['tackles'] = this.tackles!.toJson();
    }
    if (this.duels != null) {
      data['duels'] = this.duels!.toJson();
    }
    if (this.dribbles != null) {
      data['dribbles'] = this.dribbles!.toJson();
    }
    if (this.fouls != null) {
      data['fouls'] = this.fouls!.toJson();
    }
    if (this.cards != null) {
      data['cards'] = this.cards!.toJson();
    }
    if (this.penalty != null) {
      data['penalty'] = this.penalty!.toJson();
    }
    return data;
  }
}

class Team {
  int? id;
  String? name;
  String? logo;

  Team({this.id, this.name, this.logo});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    return data;
  }
}

class League {
  int? id;
  String? name;
  String? country;
  String? logo;
  String? flag;
  int? season;

  League({this.id, this.name, this.country, this.logo, this.flag, this.season});

  League.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    logo = json['logo'];
    flag = json['flag'];
    season = json['season'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country'] = this.country;
    data['logo'] = this.logo;
    data['flag'] = this.flag;
    data['season'] = this.season;
    return data;
  }
}

class Games {
  int? appearences;
  int? lineups;
  int? minutes;
  Null? number;
  String? position;
  String? rating;
  bool? captain;

  Games({this.appearences, this.lineups, this.minutes, this.number, this.position, this.rating, this.captain});

  Games.fromJson(Map<String, dynamic> json) {
    appearences = json['appearences'];
    lineups = json['lineups'];
    minutes = json['minutes'];
    number = json['number'];
    position = json['position'];
    rating = json['rating'];
    captain = json['captain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appearences'] = this.appearences;
    data['lineups'] = this.lineups;
    data['minutes'] = this.minutes;
    data['number'] = this.number;
    data['position'] = this.position;
    data['rating'] = this.rating;
    data['captain'] = this.captain;
    return data;
  }
}

class Substitutes {
  int? inn;
  int? out;
  int? bench;

  Substitutes({this.inn, this.out, this.bench});

  Substitutes.fromJson(Map<String, dynamic> json) {
    inn = json['in'];
    out = json['out'];
    bench = json['bench'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['in'] = this.inn;
    data['out'] = this.out;
    data['bench'] = this.bench;
    return data;
  }
}

class Shots {
  int? total;
  int? on;

  Shots({this.total, this.on});

  Shots.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    on = json['on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['on'] = this.on;
    return data;
  }
}

class Goals {
  int? total;
  int? conceded;
  int? assists;
  Null? saves;

  Goals({this.total, this.conceded, this.assists, this.saves});

  Goals.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    conceded = json['conceded'];
    assists = json['assists'];
    saves = json['saves'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['conceded'] = this.conceded;
    data['assists'] = this.assists;
    data['saves'] = this.saves;
    return data;
  }
}

class Passes {
  int? total;
  int? key;
  int? accuracy;

  Passes({this.total, this.key, this.accuracy});

  Passes.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    key = json['key'];
    accuracy = json['accuracy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['key'] = this.key;
    data['accuracy'] = this.accuracy;
    return data;
  }
}

class Tackles {
  int? total;
  int? blocks;
  int? interceptions;

  Tackles({this.total, this.blocks, this.interceptions});

  Tackles.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    blocks = json['blocks'];
    interceptions = json['interceptions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['blocks'] = this.blocks;
    data['interceptions'] = this.interceptions;
    return data;
  }
}

class Duels {
  int? total;
  int? won;

  Duels({this.total, this.won});

  Duels.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    won = json['won'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['won'] = this.won;
    return data;
  }
}

class Dribbles {
  int? attempts;
  int? success;
  Null? past;

  Dribbles({this.attempts, this.success, this.past});

  Dribbles.fromJson(Map<String, dynamic> json) {
    attempts = json['attempts'];
    success = json['success'];
    past = json['past'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attempts'] = this.attempts;
    data['success'] = this.success;
    data['past'] = this.past;
    return data;
  }
}

class Fouls {
  int? drawn;
  int? committed;

  Fouls({this.drawn, this.committed});

  Fouls.fromJson(Map<String, dynamic> json) {
    drawn = json['drawn'];
    committed = json['committed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['drawn'] = this.drawn;
    data['committed'] = this.committed;
    return data;
  }
}

class Cards {
  int? yellow;
  int? yellowred;
  int? red;

  Cards({this.yellow, this.yellowred, this.red});

  Cards.fromJson(Map<String, dynamic> json) {
    yellow = json['yellow'];
    yellowred = json['yellowred'];
    red = json['red'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['yellow'] = this.yellow;
    data['yellowred'] = this.yellowred;
    data['red'] = this.red;
    return data;
  }
}

class Penalty {
  Null? won;
  Null? commited;
  int? scored;
  int? missed;
  Null? saved;

  Penalty({this.won, this.commited, this.scored, this.missed, this.saved});

  Penalty.fromJson(Map<String, dynamic> json) {
    won = json['won'];
    commited = json['commited'];
    scored = json['scored'];
    missed = json['missed'];
    saved = json['saved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['won'] = this.won;
    data['commited'] = this.commited;
    data['scored'] = this.scored;
    data['missed'] = this.missed;
    data['saved'] = this.saved;
    return data;
  }
}