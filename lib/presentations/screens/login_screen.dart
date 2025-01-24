import 'package:flutter/material.dart';
import 'package:home_haven/common/utils/app_colors.dart';
import 'package:home_haven/common/utils/app_images.dart';
import 'package:home_haven/presentations/screens/home_screen.dart';
import 'package:home_haven/presentations/screens/register_screen.dart';
import 'package:home_haven/presentations/widgets/bold_text.dart';
import 'package:home_haven/presentations/widgets/custom_container.dart';
import 'package:home_haven/presentations/widgets/custom_text_field.dart';
import 'package:home_haven/presentations/widgets/normal_text.dart';
import 'package:home_haven/providers/provide.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Consumer<FurnitureProvider>(
          builder: (context, value, child) {
            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoldText(
                        text: "Welcome Back!",
                        textColor: AppColors.blackColor,
                        fontsize: 32),
                    NormalText(
                        text:
                            "Enter your email to start shopping and get awesome deals today!",
                        textColor: AppColors.grayColor,
                        fontsize: 16),
                    SizedBox(
                      height: 30,
                    ),
                    CustomFormField(
                      hintText: "Enter your phone",
                      labelText: "Phone Number",
                      massage: "Please enter",
                      suffixIcon: Icons.phone,
                      controller: phone,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: password,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        fillColor: AppColors.whiteColor,
                        filled: true,
                        prefixIcon: Icon(Icons.lock),
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        hintText: 'Enter your password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        } else if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        } else if (!RegExp(
                                r'(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@\$!%*?&])[A-Za-z\d@\$!%*?&]')
                            .hasMatch(value)) {
                          return 'Password must include uppercase, lowercase, number, and special character';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    NormalText(
                        text: "Forgot your password?",
                        textColor: AppColors.mainColor,
                        fontsize: 16),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final result = await value.logIn(
                          phone.text.trim(),
                          password.text.trim(),
                        );
                        if (result) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        }
                      },
                      child: CustomContainer(
                        isLoading: value.isLoading,
                        text: "Log In",
                        color: AppColors.mainColor,
                        textColor: AppColors.whiteColor,
                        height: 50,
                        width: 343,
                        fontSize: 16,
                        bordercolor: AppColors.mainColor,
                        // imagePath: AppImages.google,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 10,
                          width: 150,
                          child: Divider(
                            indent: 10,
                            endIndent: 10,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        Text("OR"),
                        Spacer(),
                        SizedBox(
                          height: 10,
                          width: 150,
                          child: Divider(
                            indent: 10,
                            endIndent: 10,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {},
                      child: CustomContainer(
                        text: "Log In with Google",
                        color: AppColors.backgroundColor,
                        textColor: AppColors.mainColor,
                        height: 50,
                        width: 343,
                        fontSize: 16,
                        bordercolor: AppColors.mainColor,
                        imagePath: AppImages.google,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {},
                      child: CustomContainer(
                        text: "Log In with Facebook",
                        color: AppColors.backgroundColor,
                        textColor: AppColors.mainColor,
                        height: 50,
                        width: 343,
                        fontSize: 16,
                        bordercolor: AppColors.mainColor,
                        imagePath: AppImages.facebook,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          ),
                          child: NormalText(
                              text: "Don't have an account? ",
                              textColor: AppColors.blackColor,
                              fontsize: 16),
                        ),
                        InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          child: NormalText(
                              text: "Register",
                              textColor: AppColors.mainColor,
                              fontsize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
