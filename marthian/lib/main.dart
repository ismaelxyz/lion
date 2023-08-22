import 'package:flutter/material.dart';
import 'package:marthian/calculator.dart';

void main() {
  runApp(const MyApp()); // Función principal que ejecuta la aplicación
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp que envuelve la página de login
      title: 'Flutter Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controladores para los campos de texto
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Validadores para los campos de texto
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, introduce tu email';
    }
    if (!value.contains('@')) {
      return 'Por favor, introduce un email válido';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, introduce tu contraseña';
    }
    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

  // Método para iniciar sesión
  void login() {
    // Obtener el estado del formulario
    final formState = formKey.currentState;
    // Si el formulario es válido
    if (formState != null && formState.validate()) {
      // Mostrar un mensaje de éxito
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Has iniciado sesión correctamente'),
        ),
      );
      // Limpiar los campos de texto
      emailController.clear();
      passwordController.clear();

      Navigator.push(context, MaterialPageRoute(builder: (context) => CalculatorApplication()));
    }
  }

  // Método para olvidar la contraseña
  void forgotPassword() {
    // Mostrar un mensaje de información
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Aquí puedes recuperar tu contraseña'),
      ),
    );
  }

  // Clave para el formulario
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Inicio',
                  style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight
                          .bold)), // Texto con el nombre de la página abajo con los otros elementos
              const SizedBox(height: 16.0),
              TextFormField(
                // Campo de texto para el email
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: emailValidator,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                // Campo de texto para la contraseña
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
                validator: passwordValidator,
                obscureText: true, // Ocultar los caracteres
              ),
              const SizedBox(height: 16.0),

              Align(
                // Widget para alinear el trozo de código a la derecha
                alignment: Alignment.centerRight,
                child: Column(
                  // Fila con el botón para olvidar la contraseña a la izquierda y el botón para iniciar sesión a la derecha
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      // Botón para olvidar la contraseña
                      onPressed: forgotPassword,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                      ),
                      child: const Text('¿Olvidaste contraseña?'),
                    ),
                    const SizedBox(height: 60),
                    ElevatedButton(
                      // Botón para iniciar sesión grande con un borde que haga contraste con el fondo
                      onPressed: login,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 64.0, vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: const BorderSide(color: Colors.white, width: 2.0),
                        ),
                      ),
                      child: const Text('Iniciar'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
