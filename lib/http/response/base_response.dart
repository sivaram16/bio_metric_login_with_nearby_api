abstract class BaseResponse {
  String? status;
  String? message;
  String? error;
  BaseResponse(this.message, this.error, this.status);
}
