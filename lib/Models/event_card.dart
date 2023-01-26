class Event {
  int id;
  String name;
  String icon;
  String desc;
  String category;
  String date;
  bool isCompetition;

  Event(
      {this.id,
      this.name,
      this.icon,
      this.desc,
      this.category,
      this.date,
      this.isCompetition});

  Event.fromJson(json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    desc = json['desc'];
    category = json['category'];
    date = json['datetime'];
    isCompetition = json['isCompetition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['eventType'] = this.desc;
    data['category'] = this.category;
    data['datetime'] = this.date;
    data['isCompetition'] = this.isCompetition;
    return data;
  }
}

// class DateTimeConversion {
//   static String dateTimeToString(String dateTime) {
//     DateTime dateObject = DateTime.parse(dateTime);
//     String result = DateFormat('dd MMM yyyy').format(dateObject) +
//         ' | ' +
//         DateFormat.jm().format(dateObject);
//     return result;
//   }
// }
