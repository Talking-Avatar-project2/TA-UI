class ApiEndpoints {
  static const String baseUrl = "http://10.0.2.2:5000"; // Cambia esto por tu IP local si pruebas en dispositivos físicos.

  // Endpoints del backend
  static const String chatbotRespond = "$baseUrl/chatbot/respond";
  static const String avatarExpress = "$baseUrl/avatar/express";
  static const String startAvatar = "$baseUrl/avatar/start-avatar"; // Nuevo endpoint
  static const String facialRecognition = "$baseUrl/facial_recognition/recognize";
  static const String facialRecognitionStream = "$baseUrl/facial_recognition/stream";
}
