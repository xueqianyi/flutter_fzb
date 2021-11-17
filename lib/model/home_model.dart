import 'dart:convert';

HomePageModel homePageModelFromJson(String str) => HomePageModel.fromJson(json.decode(str));

String homePageModelToJson(HomePageModel data) => json.encode(data.toJson());

class HomePageModel {
  HomePageModel({
    this.carousel,
    this.icons,
    this.news,
  });

  List<Carousel> carousel;
  List<Carousel> icons;
  News news;

  factory HomePageModel.fromJson(Map<String, dynamic> json) => HomePageModel(
    carousel: List<Carousel>.from(json["carousel"].map((x) => Carousel.fromJson(x))),
    icons: List<Carousel>.from(json["icons"].map((x) => Carousel.fromJson(x))),
    news: News.fromJson(json["news"]),
  );

  Map<String, dynamic> toJson() => {
    "carousel": List<dynamic>.from(carousel.map((x) => x.toJson())),
    "icons": List<dynamic>.from(icons.map((x) => x.toJson())),
    "news": news.toJson(),
  };
}

class Carousel {
  Carousel({
    this.img,
    this.url,
  });

  String img;
  String url;

  factory Carousel.fromJson(Map<String, dynamic> json) => Carousel(
    img: json["img"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "img": img,
    "url": url,
  };
}

class News {
  News({
    this.fireNews,
    this.mudslideNews,
    this.floodNews,
  });

  List<New> fireNews;
  List<New> mudslideNews;
  List<New> floodNews;

  factory News.fromJson(Map<String, dynamic> json) => News(
    fireNews: List<New>.from(json["fire_news"].map((x) => New.fromJson(x))),
    mudslideNews: List<New>.from(json["mudslide_news"].map((x) => New.fromJson(x))),
    floodNews: List<New>.from(json["flood_news"].map((x) => New.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "fire_news": List<dynamic>.from(fireNews.map((x) => x.toJson())),
    "mudslide_news": List<dynamic>.from(mudslideNews.map((x) => x.toJson())),
    "flood_news": List<dynamic>.from(floodNews.map((x) => x.toJson())),
  };
}

class New {
  New({
    this.images,
    this.id,
    this.category,
    this.newsId,
    this.title,
    this.author,
    this.source,
    this.content,
    this.url,
    this.date,
    this.v,
  });

  Images images;
  String id;
  String category;
  String newsId;
  String title;
  String author;
  String source;
  String content;
  String url;
  String date;
  int v;

  factory New.fromJson(Map<String, dynamic> json) => New(
    images: Images.fromJson(json["images"]),
    id: json["_id"],
    category: json["category"],
    newsId: json["newsId"],
    title: json["title"],
    author: json["author"],
    source: json["source"],
    content: json["content"],
    url: json["URL"],
    date: json["date"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "images": images.toJson(),
    "_id": id,
    "category": category,
    "newsId": newsId,
    "title": title,
    "author": author,
    "source": source,
    "content": content,
    "URL": url,
    "date": date,
    "__v": v,
  };
}

class Images {
  Images({
    this.img,
    this.num,
  });

  List<String> img;
  int num;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    img: List<String>.from(json["img"].map((x) => x)),
    num: json["num"],
  );

  Map<String, dynamic> toJson() => {
    "img": List<dynamic>.from(img.map((x) => x)),
    "num": num,
  };
}
