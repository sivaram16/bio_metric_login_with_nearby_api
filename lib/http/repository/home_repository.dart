import 'package:dio/dio.dart';
import 'package:freelance_demo/http/dio.dart';
import 'package:freelance_demo/http/http_urls.dart';
import 'package:freelance_demo/http/response/petronas_response.dart';

class HomeRepository {
  static Future<PetronasResponse> getPetronas(double lat, double lon) async {
    final String url = HttpUrls.getNearMePetronas(lat, lon);
    final Response response = await dio.get(url);
    final PetronasResponse petronasResponse =
        PetronasResponse.fromJson(response.data);
    return petronasResponse;
  }
}
