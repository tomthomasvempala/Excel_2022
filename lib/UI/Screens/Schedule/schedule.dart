import 'dart:async';
import 'package:excelapp/Services/API/schedule_api.dart';
import 'package:excelapp/Models/schedule_model.dart';
import 'package:excelapp/UI/Components/LoadingUI/loadingAnimation.dart';
import 'package:excelapp/UI/Screens/Schedule/Widgets/schedulePage.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  bool dataLoaded = false;
  StreamController<dynamic> estream;

  fetchfromNet() async {
    var dataFromNet = await fetchAndStoreScheduleFromNet();
    estream.add({"day1": [], "day2": [], "day3": []});
    // if (!dataLoaded || dataFromNet != "error") {
    //   estream.add(dataFromNet);
    //   dataLoaded = true;
    // }
  }

  initialisePage() async {
    var datafromStorage = await fetchScheduleFromStorage();
    if (datafromStorage != null) {
      estream.add(datafromStorage);
      dataLoaded = true;
    }
    //temp data
    await fetchData();
    //await fetchfromNet();
  }

  @override
  void initState() {
    estream = StreamController<dynamic>();
    initialisePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: estream.stream,
        builder: (context, snapshot) {
          // If couldnt fetch
          if (snapshot.data == "error") return errorRetry();
          // If got data
          if (snapshot.hasData)
            return new SchedulePage(scheduleData: snapshot.data);
          // When loading
          return LoadingAnimation();
        },
      ),
    );
  }

  Widget errorRetry() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Couldn't fetch Schedule",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Schedule(),
                ),
              );
            },
            child: Text(
              "Retry",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  fetchData() async {
    estream.add({
      "day0": [
        ScheduleModel(
          id: 0,
          name: "Wave Cloning",
          icon:
              'https://s3-alpha-sig.figma.com/img/7d9c/626b/3dfe5b455ef28a98e9e328f0bcbd60c1?Expires=1666569600&Signature=NjSfOFoIssgx5KWF0HLRzILg7RTYA0F3wG-jE7rayNtNKGRdRkk10h3cCKN~cx~XmUW7c1d0ESNaSsO8i-ax62nSkkODdjFrMd~D4IDj7nWDTsAC8i5TjdOfs9ShDWBOFDISYktj04Bkp4UuaXtzq9UfRf2nDHqOlMHm4L1VbDTtAVEZnUveLw~cFVcta8ZYcnrXfvx6vkOz1gjVE8rbjPiIV2Q9shETqzQKQYnae8olBt12YcEbnVqAvGdltFmvcfsLPAKkXMtmc9TzqT6EzEghY1yuNPITWCZwM7MkU8QdP8dI4dfzFW4iPKaGVe8POLaJgx7QDFPZhpVKaqGCFQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
          eventType: 'abc',
          category: 'xyz',
          needRegistration: true,
          round: '1',
          day: 0,
          datetime: "2012-02-27 13:27:00",
        ),
        ScheduleModel(
          id: 1,
          name: "Wave Cloning2",
          icon:
              'https://s3-alpha-sig.figma.com/img/7d9c/626b/3dfe5b455ef28a98e9e328f0bcbd60c1?Expires=1666569600&Signature=NjSfOFoIssgx5KWF0HLRzILg7RTYA0F3wG-jE7rayNtNKGRdRkk10h3cCKN~cx~XmUW7c1d0ESNaSsO8i-ax62nSkkODdjFrMd~D4IDj7nWDTsAC8i5TjdOfs9ShDWBOFDISYktj04Bkp4UuaXtzq9UfRf2nDHqOlMHm4L1VbDTtAVEZnUveLw~cFVcta8ZYcnrXfvx6vkOz1gjVE8rbjPiIV2Q9shETqzQKQYnae8olBt12YcEbnVqAvGdltFmvcfsLPAKkXMtmc9TzqT6EzEghY1yuNPITWCZwM7MkU8QdP8dI4dfzFW4iPKaGVe8POLaJgx7QDFPZhpVKaqGCFQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
          eventType: 'abc',
          category: 'xyz',
          needRegistration: true,
          round: '1',
          day: 0,
          datetime: "2012-02-27 13:27:00",
        ),
      ],
      "day1": [
        ScheduleModel(
          id: 2,
          name: "Wave Cloning",
          icon:
              'https://s3-alpha-sig.figma.com/img/7d9c/626b/3dfe5b455ef28a98e9e328f0bcbd60c1?Expires=1666569600&Signature=NjSfOFoIssgx5KWF0HLRzILg7RTYA0F3wG-jE7rayNtNKGRdRkk10h3cCKN~cx~XmUW7c1d0ESNaSsO8i-ax62nSkkODdjFrMd~D4IDj7nWDTsAC8i5TjdOfs9ShDWBOFDISYktj04Bkp4UuaXtzq9UfRf2nDHqOlMHm4L1VbDTtAVEZnUveLw~cFVcta8ZYcnrXfvx6vkOz1gjVE8rbjPiIV2Q9shETqzQKQYnae8olBt12YcEbnVqAvGdltFmvcfsLPAKkXMtmc9TzqT6EzEghY1yuNPITWCZwM7MkU8QdP8dI4dfzFW4iPKaGVe8POLaJgx7QDFPZhpVKaqGCFQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
          eventType: 'abc',
          category: 'xyz',
          needRegistration: true,
          round: '1',
          day: 1,
          datetime: "2022-11-03 09:00:00",
        ),
        ScheduleModel(
          id: 5,
          name: "Game Plan",
          icon:
              'https://s3-alpha-sig.figma.com/img/454c/83c8/5f00452baf0230047f2d9b5c216a1258?Expires=1666569600&Signature=UvOytUqYyt9Pn7mdujIVAyhs~qAy-Ki8aEe2dlsaIF2ZmEw3LJ-x89KKSdg7J77OoX7buckX9swR0bL241Uuu4HLCIsmmvTKLXZGKpcUtnFx2jVHUd-n5DdLfJAvcKPV6AewPh3i~wV~f1KiJnNdUYJr0PPoU~bX5NU4SKPhcQgjHu~tAU6-fQ6JoV0XIR4w8xdBS40tothGpqXMHT6L9AoItfE-n2XdNhiRxbi5gwhDGeIeutHjfPT1Iv9R~BxrkHjTMBklrng5UeOLpAjNbiFcYhqxZHVbXIId1VzPKgQzS-~3bH6EFVqkzSu1yZ7~mnwsXUtxxfNwtFIlBJKrPw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
          eventType: 'abc',
          category: 'xyz',
          needRegistration: true,
          round: '1',
          day: 1,
          datetime: "2022-11-03 09:00:00",
        ),
        ScheduleModel(
          id: 6,
          name: "Third Eye Photography",
          icon:
              'https://s3-alpha-sig.figma.com/img/454c/83c8/5f00452baf0230047f2d9b5c216a1258?Expires=1666569600&Signature=UvOytUqYyt9Pn7mdujIVAyhs~qAy-Ki8aEe2dlsaIF2ZmEw3LJ-x89KKSdg7J77OoX7buckX9swR0bL241Uuu4HLCIsmmvTKLXZGKpcUtnFx2jVHUd-n5DdLfJAvcKPV6AewPh3i~wV~f1KiJnNdUYJr0PPoU~bX5NU4SKPhcQgjHu~tAU6-fQ6JoV0XIR4w8xdBS40tothGpqXMHT6L9AoItfE-n2XdNhiRxbi5gwhDGeIeutHjfPT1Iv9R~BxrkHjTMBklrng5UeOLpAjNbiFcYhqxZHVbXIId1VzPKgQzS-~3bH6EFVqkzSu1yZ7~mnwsXUtxxfNwtFIlBJKrPw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
          eventType: 'abc',
          category: 'xyz',
          needRegistration: true,
          round: '1',
          day: 1,
          datetime: "2022-11-03 10:00:00",
        ),
        ScheduleModel(
          id: 10,
          name: ".Issue",
          icon:
              'https://s3-alpha-sig.figma.com/img/7d9c/626b/3dfe5b455ef28a98e9e328f0bcbd60c1?Expires=1666569600&Signature=NjSfOFoIssgx5KWF0HLRzILg7RTYA0F3wG-jE7rayNtNKGRdRkk10h3cCKN~cx~XmUW7c1d0ESNaSsO8i-ax62nSkkODdjFrMd~D4IDj7nWDTsAC8i5TjdOfs9ShDWBOFDISYktj04Bkp4UuaXtzq9UfRf2nDHqOlMHm4L1VbDTtAVEZnUveLw~cFVcta8ZYcnrXfvx6vkOz1gjVE8rbjPiIV2Q9shETqzQKQYnae8olBt12YcEbnVqAvGdltFmvcfsLPAKkXMtmc9TzqT6EzEghY1yuNPITWCZwM7MkU8QdP8dI4dfzFW4iPKaGVe8POLaJgx7QDFPZhpVKaqGCFQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
          eventType: 'abc',
          category: 'xyz',
          needRegistration: true,
          round: '1',
          day: 1,
          datetime: "2022-11-03 13:00:00",
        ),
        ScheduleModel(
          id: 10,
          name: "Another Issue",
          icon:
              'https://s3-alpha-sig.figma.com/img/7d9c/626b/3dfe5b455ef28a98e9e328f0bcbd60c1?Expires=1666569600&Signature=NjSfOFoIssgx5KWF0HLRzILg7RTYA0F3wG-jE7rayNtNKGRdRkk10h3cCKN~cx~XmUW7c1d0ESNaSsO8i-ax62nSkkODdjFrMd~D4IDj7nWDTsAC8i5TjdOfs9ShDWBOFDISYktj04Bkp4UuaXtzq9UfRf2nDHqOlMHm4L1VbDTtAVEZnUveLw~cFVcta8ZYcnrXfvx6vkOz1gjVE8rbjPiIV2Q9shETqzQKQYnae8olBt12YcEbnVqAvGdltFmvcfsLPAKkXMtmc9TzqT6EzEghY1yuNPITWCZwM7MkU8QdP8dI4dfzFW4iPKaGVe8POLaJgx7QDFPZhpVKaqGCFQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
          eventType: 'abc',
          category: 'xyz',
          needRegistration: true,
          round: '1',
          day: 1,
          datetime: "2022-11-03 13:00:00",
        ),
      ],
      "day2": [
        ScheduleModel(
          id: 3,
          name: "Wave Cloning",
          icon:
              'https://s3-alpha-sig.figma.com/img/7d9c/626b/3dfe5b455ef28a98e9e328f0bcbd60c1?Expires=1666569600&Signature=NjSfOFoIssgx5KWF0HLRzILg7RTYA0F3wG-jE7rayNtNKGRdRkk10h3cCKN~cx~XmUW7c1d0ESNaSsO8i-ax62nSkkODdjFrMd~D4IDj7nWDTsAC8i5TjdOfs9ShDWBOFDISYktj04Bkp4UuaXtzq9UfRf2nDHqOlMHm4L1VbDTtAVEZnUveLw~cFVcta8ZYcnrXfvx6vkOz1gjVE8rbjPiIV2Q9shETqzQKQYnae8olBt12YcEbnVqAvGdltFmvcfsLPAKkXMtmc9TzqT6EzEghY1yuNPITWCZwM7MkU8QdP8dI4dfzFW4iPKaGVe8POLaJgx7QDFPZhpVKaqGCFQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
          eventType: 'abc',
          category: 'xyz',
          needRegistration: true,
          round: '1',
          day: 2,
          datetime: "2019-07-19 08:40:23",
        ),
      ],
      "day3": [
        ScheduleModel(
          id: 4,
          name: "Wave Cloning",
          icon:
              'https://s3-alpha-sig.figma.com/img/7d9c/626b/3dfe5b455ef28a98e9e328f0bcbd60c1?Expires=1666569600&Signature=NjSfOFoIssgx5KWF0HLRzILg7RTYA0F3wG-jE7rayNtNKGRdRkk10h3cCKN~cx~XmUW7c1d0ESNaSsO8i-ax62nSkkODdjFrMd~D4IDj7nWDTsAC8i5TjdOfs9ShDWBOFDISYktj04Bkp4UuaXtzq9UfRf2nDHqOlMHm4L1VbDTtAVEZnUveLw~cFVcta8ZYcnrXfvx6vkOz1gjVE8rbjPiIV2Q9shETqzQKQYnae8olBt12YcEbnVqAvGdltFmvcfsLPAKkXMtmc9TzqT6EzEghY1yuNPITWCZwM7MkU8QdP8dI4dfzFW4iPKaGVe8POLaJgx7QDFPZhpVKaqGCFQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
          eventType: 'abc',
          category: 'xyz',
          needRegistration: true,
          round: '1',
          day: 3,
          datetime: "2019-07-19 08:40:23",
        ),
      ]
    });
  }
}
