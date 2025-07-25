import 'package:flutter/material.dart';
import 'package:multi_riverpood/models/user.dart';
import 'package:multi_riverpood/widgets/password_text_field.dart';
//import 'package:multisuministros/routes/app_routes.dart';


class LoginPage extends StatelessWidget {
const LoginPage({ super.key});

  @override
  Widget build(BuildContext context) {

    //final authBloc = BlocProvider.of<AuthBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicia sesion'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: _Form()),),
     );
  }
}


class _Form extends StatefulWidget {
  const _Form({super.key});

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final TextEditingController emailCtr = TextEditingController();
  final TextEditingController passwordCtr = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailCtr.dispose();
    passwordCtr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: _formKey,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/logo/ic_launcher.png', height: 100),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: emailCtr,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  prefixIcon: Icon(Icons.email_outlined, color: theme.colorScheme.primary),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo requerido';
                  }
                  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Por favor, ingresa un correo electrónico válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              PasswordTextField(controllerText: passwordCtr),
              const SizedBox(height: 16.0),
              //if (state is AuthError)
              //   Text(state.error, style: const TextStyle(color: Colors.red)),
              // const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed:  () {
                        if (_formKey.currentState!.validate()) {
                          final newUser = User(
                            email: emailCtr.text.trim(),
                            password: passwordCtr.text.trim(),
                          );
                          
                        }
                      },
                child: const Text('Iniciar sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
