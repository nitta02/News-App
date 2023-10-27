import 'package:get/get.dart';
import 'package:getx_news_app/model/test_model.dart';

class NewsApiHelper extends GetConnect implements GetxService {
  //GET API URL
  Future<List<ApiModel>> getApiData() async {
    try {
      Response response = await get(
          'https://newsapi.org/v2/everything?q=tesla&from=2023-09-27&sortBy=publishedAt&apiKey=0ff104f6bd8b4a9ebc0161278776cb6e'); // Replace with your actual API URL
      // print('Response Status Code: ${response.status.code}');

      if (response.status.isOk) {
        List data = response.body['articles'];
        // print('Data received: $data');
        List<ApiModel> newsModel =
            data.map((e) => ApiModel.fromJson(e)).toList();
        return newsModel;
      } else {
        // print('API request failed with status code: ${response.status.code}');
        return [];
      }
    } catch (e) {
      // print('API request error: $e');
      return [];
    }
  }




    //GET CATEGORY API URL
  Future<List<ApiModel>> getCategoryApiData({
    required String category,
  }) async {
    try {
      Response response = await get(
          'https://newsapi.org/v2/top-headlines?country=de&category=$category&apiKey=0ff104f6bd8b4a9ebc0161278776cb6e'); // Replace with your actual API URL
      // print('Response Status Code: ${response.status.code}');

      if (response.status.isOk) {
        List data = response.body['articles'];
        // print('Data received: $data');
        List<ApiModel> newsModel =
            data.map((e) => ApiModel.fromJson(e)).toList();
        return newsModel;
      } else {
        // print('API request failed with status code: ${response.status.code}');
        return [];
      }
    } catch (e) {
      // print('API request error: $e');
      return [];
    }
  }
}
