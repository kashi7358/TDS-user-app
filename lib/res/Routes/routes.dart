

import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RoutesName.userSplash:
      //   return SlideTransitionPage(page: const SplashScreen());
     
      default:
        // Handle undefined routes
        throw Exception('Invalid route: ${settings.name}');
    }
  }
}

//////////////////////////   Help  ///////////////////////////////////

//  Navigator.push(
//                           context,
//                           SlideTransitionPage(
//                               applySlideTransition: true, page: AboutScreen()));

///////////////// how to pass arguments in name contructor
///step 1
// class MovieDetailsArguments {
//   final Movies movie;
//   final bool isLoading;
//   final bool isSent;
//   final String name;
//   MovieDetailsArguments({
//     required this.movie,
//     required this.isLoading,
//     required this.isSent,
//     required this.name,
//   });
// }
// step 2
// case RoutesName.movieDetails:
//   final MovieDetailsArguments args = settings.arguments as MovieDetailsArguments;
//   return SlideTransitionPage(page: MovieDetailsScreen(movieDetailsArgs: args));
// step 3
// Navigator.pushNamed(
//   context,
//   RoutesName.movieDetails,
//   arguments: MovieDetailsArguments(
//     movie: yourMoviesInstance,
//     isLoading: true,
//     isSent: false,
//     name: "John Doe",
//   ),
// );

class GetRole {
  static String? role;
}
// user
// driver