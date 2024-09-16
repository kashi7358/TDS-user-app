
abstract class BaseApiServices {
  Future<dynamic> fetchGetApi(String url, [String? token]);

  Future<dynamic> fetchPostApi(String url, dynamic data, String? token);

  // Future<dynamic> fetchPostApiwithfiles(
  //     {required String url, required dynamic data,required File file, String? token});

  Future<dynamic> fetchPostApiWithImages({
    required String url,
    required Map<String, dynamic> data,
    required Map<String, String> imagePaths,
    String? token,
  });
}
