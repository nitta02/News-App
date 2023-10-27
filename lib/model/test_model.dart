class ApiModel {
  String? name,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content;

  ApiModel({
    required this.name,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return ApiModel(
        name: json['source']['name'],
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'] ??
            'https://t4.ftcdn.net/jpg/03/16/15/47/360_F_316154790_pnHGQkERUumMbzAjkgQuRvDgzjAHkFaQ.jpg',
        publishedAt: json['publishedAt'],
        content: json['content']);
  }
}
