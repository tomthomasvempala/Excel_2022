class News {
  int id;
  String title;
  String desc;
  String image;
  String button;
  String link;
  String date;
  String time;

  News({
    this.id,
    this.title,
    this.desc,
    this.image,
    this.button,
    this.link,
    this.date,
    this.time,
  });

  News.fromJson(json) {
    id = json['id'];
    title = json['title'];
    desc = json['desc'];
    image = json['image'];
    button = json['button'];
    link = json['link'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['image'] = this.image;
    data['button'] = this.button;
    data['link'] = this.link;
    data['date'] = this.date;
    data['time'] = this.time;
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
