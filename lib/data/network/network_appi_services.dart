import 'dart:convert';
import 'dart:io';

import 'package:courior_project/data/exceptions/app_exceptions.dart';
import 'package:courior_project/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';



class NetworkApiService extends BaseApiServices {
  @override
  Future<dynamic> fetchGetApi(String url, [String? token]) async {
    dynamic responseJson;
    try {
      var headers = {'Content-Type': 'application/x-www-form-urlencoded'};

      // Add authorization header if token is provided
      if (token != null) {
        headers['Authorization'] = token;
      }

      final response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future fetchPostApi(String url, data, String? token) async {
    dynamic responseJson;
    try {
      final headers = {'Content-Type': 'application/json'};
      // Add authorization header if token is provided

      if (token != null) {
        headers['Authorization'] = token;
      }

      Response response =
          await post(Uri.parse(url), headers: headers, body: jsonEncode(data))
              .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future<dynamic> fetchPostApiWithImages({
    required String url,
    required Map<String, dynamic> data,
    required Map<String, String> imagePaths, // Map<imageKey, imagePath>
    String? token,
  }) async {
    dynamic responseJson;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add text fields to the request
      for (var entry in data.entries) {
        // request.fields[entry.key] = entry.value.toString();
        if (entry.value is List) {
          request.fields[entry.key] = jsonEncode(entry.value);
        } else {
          request.fields[entry.key] = entry.value.toString();
        }
      }

      // Add image files to the request
      for (var entry in imagePaths.entries) {
        var imageKey = entry.key;
        var imagePath = entry.value;

        if (imagePath.isNotEmpty &&
            !imagePath.contains('https') &&
            !imagePath.contains('http')) {
          request.files
              .add(await http.MultipartFile.fromPath(imageKey, imagePath));
        }
      }
      // Add headers
      final headers = {'Content-Type': 'multipart/form-data'};
      if (token != null) {
        headers['Authorization'] = token;
      }
      request.headers.addAll(headers);
      Response response = await http.Response.fromStream(await request.send());

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

    // @override
  // Future<dynamic> fetchPostApiwithfiles({
  //   required String url,
  //   required dynamic data,
  //   required File file,
  //   String? token,
  // }) async {
  //   dynamic responseJson;
  //   try {
  //     var request = http.MultipartRequest('POST', Uri.parse(url));

  //     // Add text fields to the request
  //     for (var entry in data.entries) {
  //       if (entry.value is List) {
  //         request.fields[entry.key] = jsonEncode(entry.value);
  //       } else {
  //         request.fields[entry.key] = entry.value.toString();
  //       }
  //     }

  //     // Add file to the request
  //     request.files.add(await http.MultipartFile.fromPath('file', file.path));

  //     // Add headers
  //     final headers = {'Content-Type': 'multipart/form-data'};
  //     if (token != null) {
  //       headers['Authorization'] = token;
  //     }
  //     request.headers.addAll(headers);

  //     print('::: Request sending is ${request}');
  //     // Send the request
  //     Response response = await http.Response.fromStream(await request.send());

  //     responseJson = returnResponse(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet Connection');
  //   }

  //   return responseJson;
  // }


  dynamic returnResponse(http.Response response) {
    print(response.body);
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        final errorMessage = responseJson['message'] ?? 'Bad Request';
        throw BadRequestException(errorMessage);
      case 401:
        dynamic responseJson = jsonDecode(response.body);
        final errorMessage = responseJson['message'] ?? 'Bad Request';
        throw BadRequestException(errorMessage);
      case 500:
      case 404:
        dynamic responseJson = jsonDecode(response.body);
        final errorMessage = responseJson['message'] ?? 'Bad Request';
        throw UnauthorisedException(errorMessage);
      default:
        dynamic responseJson = jsonDecode(response.body);
        final errorMessage = responseJson['message'] ??
            'Some Thing went wrong. Please Try again later';

        throw FetchDataException(errorMessage);
      // 'Error accured while communicating with serverwith status code${response.statusCode}');
    }
  }
  
 

}
