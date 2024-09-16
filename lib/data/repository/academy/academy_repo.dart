// import 'package:mdcat_kawiish/all_imports.dart';
// import 'package:mdcat_kawiish/config/constants/api_links.dart';
// import 'package:mdcat_kawiish/data/network/base_api_services.dart';
// import 'package:mdcat_kawiish/data/network/network_appi_services.dart';

// class AcademyRepo {
//   BaseApiServices apiServices = NetworkApiService();

//   Future<String?> getAcademySignedInToken() =>
//       SessionHandling().getAcademySignedInToken();

//   Future<dynamic> loginApi(dynamic data) async {
//     try {
//       dynamic response =
//           await apiServices.fetchPostApi(Applinks.loginForAcademy, data, null);
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> signupApiforStudent(dynamic data, imagePath) async {
//     try {
//       dynamic response = await apiServices.fetchPostApiWithImages(
//         url: Applinks.signUpForStudent,
//         data: data,
//         imagePaths: imagePath,
//       );
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> fetchAllStudent() async {
//     try {
//       final academySignedInToken = await getAcademySignedInToken();

//       dynamic response = await apiServices.fetchGetApi(
//           Applinks.fetchAllStudentForAcademy, academySignedInToken);
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> fetchAllTeachers() async {
//     try {
//       final academySignedInToken = await getAcademySignedInToken();

//       dynamic response = await apiServices.fetchGetApi(
//           Applinks.fetchAllTeachersForAcademy, academySignedInToken);
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> createSubjects(dynamic data) async {
//     try {
//       final academySignedInToken = await getAcademySignedInToken();

//       dynamic response = await apiServices.fetchPostApi(
//           Applinks.createSubjects, data, academySignedInToken);
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> listofallsubjects() async {
//     try {
//       final academySignedInToken = await getAcademySignedInToken();

//       dynamic response = await apiServices.fetchGetApi(
//           Applinks.listofsubjects, academySignedInToken);
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<dynamic> listofstudentbysubject(var subjectid) async {
//     try {
//       final academySignedInToken = await getAcademySignedInToken();

//       dynamic response = await apiServices.fetchGetApi(
//           Applinks.getStudentBySubject(subjectid), academySignedInToken);
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
