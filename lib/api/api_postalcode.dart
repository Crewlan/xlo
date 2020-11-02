import 'package:dio/dio.dart';
import 'package:xlo/models/address_model.dart';
import 'package:xlo/repositories/api_error.dart';
import 'package:xlo/repositories/api_response.dart';

Future<ApiResponse> getAdressFromAPI(String postalCode)async{

  final String endpoint =
  'http://viacep.com.br/ws/${postalCode.replaceAll('.', '').replaceAll('-', '')}/json/';

  try{

  final Response response = await Dio().get<Map>(endpoint);

  if(response.data.containsKey('erro') && response.data['erro']){
    return ApiResponse.error(
      error: ApiError(code: -1, message: 'CEP invalido')
    );
  }

  final AddressModel address = AddressModel(
    place: response.data['logradouro'],
    district: response.data['bairro'],
    city: response.data['localidade'],
    postalCode: response.data['cep'],
    federalUnit: response.data['uf'],
  );

  return ApiResponse.success(result: address);

  // ignore: unused_catch_clause
  } on DioError catch (e){
    return ApiResponse.error(
      error: ApiError(
        code: -1,
        message: 'Falha ao contactar VIACEP'
      )
    );
  }



}