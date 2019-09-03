class APIConstants {
  static const String API_PRODUCTION_URL = "https://www.mywebservice.com.br/api/";
  static const String API_DEVELOPMENT_URL = "http://localhost:5000/api/";

  static const String BASE_API_URL = API_DEVELOPMENT_URL;

  static const String API_KEY = "2d07f4c342a08bf1a8a9b58193899052";
}

class APIResponse {
  static const int OK = 200;
  static const int NotFound = 404;
}

class ToDoAPIConstants extends APIConstants {
  static const String _BaseToDoURL = "ToDo/";

  static String getToDoListURL() {
    return APIConstants.BASE_API_URL+_BaseToDoURL;
  }

  static String getToDoURL(id) {
    return APIConstants.BASE_API_URL+_BaseToDoURL+id.toString();
  }

  static String getAddToDoURL(){
    return APIConstants.BASE_API_URL+_BaseToDoURL;
  }

  static String getUpdateToDoURL(id){
    return APIConstants.BASE_API_URL+_BaseToDoURL+id.toString();
  }

  static String getDeleteToDoURL(id){
    return APIConstants.BASE_API_URL+_BaseToDoURL+id.toString();
  }
}