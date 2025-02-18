import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Importa http
import '../api_endpoints.dart'; // Importa las rutas del backend

class AvatarScreen extends StatefulWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  _AvatarScreenState createState() => _AvatarScreenState();
}

class _AvatarScreenState extends State<AvatarScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _startAvatarStream(); // Llamar al flujo del avatar cuando se inicia la pantalla
  }

  Future<void> _startAvatarStream() async {
    try {
      final response = await http.get(Uri.parse(ApiEndpoints.startAvatar));
      if (response.statusCode == 200) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Avatar y reconocimiento facial iniciados")),
        );
      } else {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error al iniciar el avatar: ${response.statusCode}"),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error de conexión con el backend: $e")),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Avatar Interactivo")),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : const Text("El avatar se está ejecutando en una ventana emergente."),
      ),
    );
  }
}
