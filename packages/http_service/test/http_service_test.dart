import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_service/http_service.dart';
import 'package:logger_service/logger_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'data/mock_response.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockLoggerService extends Mock implements LoggerService {}

void main() {
  group('request', () {
    const String mockUrl = 'testUrl';
    const Map<String, dynamic> responseBody = <String, dynamic>{
      'id': 1,
      'name': 'testName'
    };
    const Map<String, dynamic> requestBody = <String, dynamic>{
      'requestParam': 'value',
    };
    const Map<String, String> headers = <String, String>{
      'Authorization': 'Bearer mockToken',
    };

    late MockLoggerService loggerService;
    late HttpService service;
    late http.Client client;

    setUp(() {
      loggerService = MockLoggerService();
      service = HttpService(logger: loggerService);
      client = MockHttpClient();

      registerFallbackValue(Uri.parse(mockUrl));
    });

    test(
        'get request should call client.get and fetch data from a specified url',
        () async {
      when(() => client.get(any(), headers: any(named: 'headers'))).thenAnswer(
          (_) async => http.Response(jsonEncode(responseBody), 200));

      final ApiResponse<MockResponse> response =
          await service.request<MockResponse, Map<String, dynamic>>(
        requestType: HttpRequestType.get,
        onResult: (Map<String, dynamic> response) =>
            MockResponse.fromJson(response),
        url: mockUrl,
        mockClient: client,
      );

      expect(response.isSuccess, equals(true));
      expect(response.asSuccess.id, equals(responseBody['id']));
      expect(response.asSuccess.name, equals(responseBody['name']));

      verify(() => client.get(Uri.parse(mockUrl), headers: <String, String>{}))
          .called(1);
    });

    test(
        'post request should call client.post and post data to a specified url',
        () async {
      when(() => client.post(any(),
              headers: any(named: 'headers'), body: any(named: 'body')))
          .thenAnswer(
              (_) async => http.Response(jsonEncode(responseBody), 201));

      await service.request<MockResponse, Map<String, dynamic>>(
        onResult: (Map<String, dynamic> response) =>
            MockResponse.fromJson(response),
        url: mockUrl,
        mockClient: client,
        body: requestBody,
      );

      verify(() => client.post(Uri.parse(mockUrl),
          headers: <String, String>{}, body: requestBody)).called(1);
    });

    test('put request should call client.put and put data to a specified url',
        () async {
      when(() => client.put(any(),
              headers: any(named: 'headers'), body: any(named: 'body')))
          .thenAnswer(
              (_) async => http.Response(jsonEncode(responseBody), 200));

      await service.request<MockResponse, Map<String, dynamic>>(
        requestType: HttpRequestType.put,
        onResult: (Map<String, dynamic> response) =>
            MockResponse.fromJson(response),
        url: mockUrl,
        mockClient: client,
        body: requestBody,
        headers: headers,
      );

      verify(() => client.put(Uri.parse(mockUrl),
          headers: headers, body: requestBody)).called(1);
    });

    test(
        'delete request should call client.delete and delete data at a specified url',
        () async {
      when(() => client.delete(any(), headers: any(named: 'headers')))
          .thenAnswer(
              (_) async => http.Response(jsonEncode(responseBody), 204));

      final ApiResponse<MockResponse> response =
          await service.request<MockResponse, Map<String, dynamic>>(
        requestType: HttpRequestType.delete,
        onResult: (Map<String, dynamic> response) =>
            MockResponse.fromJson(response),
        url: mockUrl,
        mockClient: client,
        body: requestBody,
        headers: headers,
      );

      expect(response.isEmptyResponse, equals(true));
      verify(() => client.delete(Uri.parse(mockUrl), headers: headers))
          .called(1);
    });

    test('if client throws exception, it should throw ClientException',
        () async {
      final Exception exception =
          Exception('There was an issue with the request.');
      when(() => client.get(any(), headers: any(named: 'headers')))
          .thenThrow(exception);

      final ApiResponse<MockResponse> response =
          await service.request<MockResponse, Map<String, dynamic>>(
        requestType: HttpRequestType.get,
        onResult: (Map<String, dynamic> response) =>
            MockResponse.fromJson(response),
        url: mockUrl,
        mockClient: client,
      );

      expect(response.isError, equals(true));
      expect(response.asError, equals(exception));
    });

    test(
        'if client request statusCode is >= 400, it should throw ClientException',
        () async {
      when(() => client.get(any(), headers: any(named: 'headers'))).thenAnswer(
          (_) async => http.Response(jsonEncode(responseBody), 400));

      const HttpRequestType requestType = HttpRequestType.get;
      final ApiResponse<MockResponse> response =
          await service.request<MockResponse, Map<String, dynamic>>(
        requestType: requestType,
        onResult: (Map<String, dynamic> response) =>
            MockResponse.fromJson(response),
        url: mockUrl,
        mockClient: client,
      );

      expect(response.isError, equals(true));
      expect(
          response.asError.toString(),
          equals(
              'ClientException: There was an issue completing $requestType request. Status code: 400., uri=$mockUrl'));
    });
  });
}
