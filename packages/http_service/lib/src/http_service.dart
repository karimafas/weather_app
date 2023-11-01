import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_service/src/enums/http_request_type.dart';
import 'package:http_service/src/models/api_response.dart';
import 'package:logger_service/logger_service.dart';

class HttpService {
  HttpService({required this.logger});

  final LoggerService logger;
  http.Client? client;

  Future<ApiResponse<T1>> request<T1, T2>({
    HttpRequestType requestType = HttpRequestType.post,
    Map<String, String> headers = const <String, String>{},
    Map<String, dynamic> body = const <String, dynamic>{},
    required T1 Function(T2) onResult,
    required String url,
    http.Client? mockClient,
  }) async {
    _initialiseClient(mockClient);

    if (client == null) {
      throw http.ClientException('Client was null at the time of request.');
    }

    final Uri uri = Uri.parse(url);

    logger.info('Starting API call of type ${requestType.name}. Url: $url.');

    try {
      http.Response response;

      switch (requestType) {
        case HttpRequestType.get:
          response = await client!.get(uri, headers: headers);
        case HttpRequestType.post:
          response = await client!.post(uri, headers: headers, body: body);
        case HttpRequestType.put:
          response = await client!.put(uri, headers: headers, body: body);
        case HttpRequestType.delete:
          response = await client!.delete(uri, headers: headers);
      }

      final int statusCode = response.statusCode;
      if (statusCode >= 400) {
        throw http.ClientException(
            'There was an issue completing $requestType request. Status code: $statusCode.',
            uri);
      } else if (statusCode == 204) {
        logger.info('API call responded with empty body.');
        return ApiEmptyResponse<T1>();
      }

      logger.info('API call completed successfully. Status code: $statusCode.');
      final T2 decodedBody = jsonDecode(response.body) as T2;
      return ApiSuccess<T1>(onResult(decodedBody));
    } catch (e) {
      logger.error('API call responded an exception: $e');
      return ApiError<T1>(e);
    } finally {
      client!.close();
      client = null;
    }
  }

  void _initialiseClient(http.Client? mockClient) {
    client = mockClient ?? http.Client();
  }
}
