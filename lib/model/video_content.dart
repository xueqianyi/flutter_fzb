// To parse this JSON data, do
//
//     final videoContentModel = videoContentModelFromJson(jsonString);

import 'dart:convert';

VideoContentModel videoContentModelFromJson(String str) => VideoContentModel.fromJson(json.decode(str));

String videoContentModelToJson(VideoContentModel data) => json.encode(data.toJson());

class VideoContentModel {
  VideoContentModel({
    this.result,
  });

  VideoContentItem result;

  factory VideoContentModel.fromJson(Map<String, dynamic> json) => VideoContentModel(
    result: VideoContentItem.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result.toJson(),
  };
}

class VideoContentItem {
  VideoContentItem({
    this.videoTitle,//视频标题
    this.videoDes,//视频描述 video DEScription
    this.videoUrl,//视频本身的地址
    this.videoMindMap,//视频的思维导图
    this.videoPic,//视频的封面
  });

  String videoTitle;
  String videoDes;
  String videoUrl;
  String videoMindMap;
  String videoPic;

  factory VideoContentItem.fromJson(Map<String, dynamic> json) => VideoContentItem(
    videoTitle: json["videoTitle"],
    videoDes: json["videoDes"],
    videoUrl: json["videoURL"],
    videoMindMap: json["videoMindMap"],
    videoPic: json["videoPic"],
  );

  Map<String, dynamic> toJson() => {
    "videoTitle": videoTitle,
    "videoDes": videoDes,
    "videoURL": videoUrl,
    "videoMindMap": videoMindMap,
    "videoPic": videoPic,
  };
}
