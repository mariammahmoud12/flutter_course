//import 'package:first/modules/messenger/MessengerScreen.dart';
import 'package:first/shared/components/components.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({Key? key}) : super(key: key);


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 var emailController = TextEditingController();

  var passwordController = TextEditingController();

 var formKey = GlobalKey<FormState>();

 bool isPassword = true;

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const  Text(
                      'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const  SizedBox(
                    height: 40.0,
                  ),
                  DefaultFormFeild(
                    controller: emailController,
                    label: 'Email',
                    prefix: Icons.email,
                    type: TextInputType.emailAddress,
                   validate: (String? value)
                    {
                       if (value!.isEmpty)
                          {
                            return 'email must not be empty';
                          }
                        return null;
                      }
                 ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  DefaultFormFeild(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    prefix: Icons.lock,
                    label: 'Password',
                    isPassword: isPassword,
                    suffix: Icons.remove_red_eye ,

                    validate: (String? value)
                    {
                      if (value!.isEmpty)
                        {
                          return 'password must not be empty!';
                        }
                      return null;
                    },
                    suffisPressed: ()
                      {
                        setState(() {
                          isPassword = ! isPassword;
                        });
                      }
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  DefaultButton(
                      function: ()
                      {
                        if(formKey.currentState!.validate())
                         {
                           print('validated');
                          //  Navigator.push(context, MaterialPageRoute(builder: (context)=> const MessengerScreen()));
                         }
                      },
                      text: 'login',
                  ),
                  const  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                      ),
                       TextButton(
                        onPressed: (){},
                        child: const Text(
                          'Register Now',
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}