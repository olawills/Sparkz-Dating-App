import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../app/core/core.dart';
import '../../../../../app/core/network/dio_helper.dart';

abstract class UserRemoteDataSource {
  Future<Response> getAllUsers();
  Future<Response> sendUserLocation(SendUserLocationEvent event);
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  @override
  Future<Response> getAllUsers() async {
    return await DioHelper.getData(path: '/user/getNearbyUsers');
  }

  @override
  Future<Response> sendUserLocation(SendUserLocationEvent event) async {
    final sendLocation = {
      '_id': event.id,
      'location': event.location,
    };
    final data = jsonEncode(sendLocation);
    return await DioHelper.postData(path: '/user/sendLocation', data: data);
  }

  

}
