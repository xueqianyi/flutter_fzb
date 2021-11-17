
import 'dart:convert';

ActivityModel activityModelFromJson(String str) => ActivityModel.fromJson(json.decode(str));

String activityModelToJson(ActivityModel data) => json.encode(data.toJson());

class ActivityModel {
  ActivityModel({
    this.name,
    this.date,
    this.location,
    this.introduction,
    this.activityId,
    this.participant,
  });

  String name;
  String date;
  String location;
  String introduction;
  String activityId;
  List<String> participant;


  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
    name: json["name"],
    date: json["date"],
    location: json["location"],
    introduction: json["introduction"],
    activityId: json["activity_id"],
    participant: List<String>.from(json["participant"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "date": date,
    "location": location,
    "introduction": introduction,
    "activity_id": activityId,
    "participant": List<dynamic>.from(participant.map((x) => x)),
  };
}
