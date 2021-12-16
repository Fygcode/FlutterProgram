import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:try1/Homepage.dart';

void main(){
  runApp(const MaterialApp(
    home: SignUp(),
  ));
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

   final _form = GlobalKey<FormState>();
   final TextEditingController _fisrtname = TextEditingController();
   final TextEditingController _lastname = TextEditingController();
   final TextEditingController _email = TextEditingController();
   final TextEditingController _phone = TextEditingController();
   final TextEditingController _password = TextEditingController();
   final TextEditingController _cpassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){ Navigator.pop(context);}, icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(23),
            child: Form(
              key: _form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Sign Up',style: TextStyle(fontSize: 35,fontWeight: FontWeight.w800,color: Colors.deepOrange),),
                  const SizedBox(height: 25,),
                  TextFormField(
                    maxLength: 15,
                    controller: _fisrtname,
                    validator: (value){
                      if(value!.isEmpty){
                        return('Please Enter FirstName');
                      }
                      if (value.length >= 15) {
                        return ('Characters Limit is 15');
                      }
                    },
                    decoration: InputDecoration(
                      counterText: "",
                      prefixIcon: const Icon(Icons.people),
                      hintText: 'FirstName',      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                  ),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: _lastname,
                    maxLength: 10,
                    validator: (value){
                      if(value!.isEmpty){
                        return('Please Enter LastName');
                      }
                    },
                    decoration: InputDecoration(
                      counterText: "",
                      prefixIcon: const Icon(Icons.people),
                      hintText: 'LastName',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                  ),
                  const SizedBox(height: 5,),
                   TextFormField(
                     controller: _email,
                     keyboardType: TextInputType.emailAddress,
                     validator: (value){
                       if(value!.isEmpty){
                         return ('Please Enter Email');
                       }
                       if(!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]').hasMatch(value)){
                         return ('Enter Valid Email');
                       }
                     },
                     decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                  ),
                   const SizedBox(height: 5,),
                   TextFormField(
                     maxLength: 10,
                     controller: _phone,
                     validator: (value) {
                       if (value!.isEmpty) {
                         return ('Please Enter Phone-Number');
                       }
                       if (value.length < 10) {
                         return ('Enter Valid Number');
                       }
                     },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      counterText: "",
                      prefixIcon: const Icon(Icons.email),
                      hintText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                  ),      
                  const SizedBox(height: 5,),
                   TextFormField(
                    controller: _password,
                    obscureText: true,
                    validator: (value){
                      if(value!.isEmpty){
                        return ('Please Enter Password');
                      }
                      RegExp reg = RegExp(r'^.{7,}$');
                      if(!reg.hasMatch(value)){
                        return ('Please Enter atleast "7" Character ');
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                  ),
                  const SizedBox(height: 5,),
                   TextFormField(
                    controller: _cpassword,
                    obscureText: true,
                     validator: (value){
                      if(value!.isEmpty){
                        return ('Please Enter Comfirm Password');
                      }
                     
                      if(_password.text != _cpassword.text){
                        return ('Please Does Not Match');
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password_outlined),
                      hintText: 'Comfirm Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.deepPurple)
                    ),
                    onPressed: (){
                      if(_form.currentState!.validate()){
                       Fluttertoast.showToast(msg: 'Entered Details Correct');
                            Navigator.push(context, (MaterialPageRoute(builder: (context){
                          return const Homepage();
                        })));
                      }
                    }, 
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20,right: 20),
                      child: Text('Sign up',style: TextStyle(fontSize: 20,)),
                    )
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
