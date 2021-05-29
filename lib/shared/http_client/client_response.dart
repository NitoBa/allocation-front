class ClientResponse<T> {
  T? data;
  int? statusCode;
  String? statusMessage;

  ClientResponse({
    this.data,
    this.statusCode,
    this.statusMessage,
  });
}
