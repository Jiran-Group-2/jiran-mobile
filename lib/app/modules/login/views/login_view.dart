import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/theme.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(1.5, -1.5),
              child: Container(
                height: 230,
                width: 230,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(300),
                  color: AppColors.primary,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-2.8, 0.5),
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(300),
                  color: AppColors.primary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const AutoSizeText.rich(
                        TextSpan(text: 'Welcome ', children: [
                          TextSpan(text: 'back,', style: TextStyle(color: AppColors.white))
                        ]),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const AutoSizeText(
                        'Jiran.', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 48,
                        )
                      ),
                      const SizedBox(height: 24,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AutoSizeText(
                            'Email', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )
                          ),
                          const SizedBox(height: 8),
                          
                          TextFormField(
                            controller: controller.emailController,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Email',
                              labelStyle: const TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(width: 2.0, color: AppColors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          
                          const AutoSizeText(
                            'Password', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )
                          ),
                          const SizedBox(height: 8),
                          
                          Obx(
                            () => TextFormField(
                              controller: controller.passwordController,
                              obscureText: controller.isObscure.value,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    controller.isObscure.toggle();
                                  },
                                  child: const Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(width: 2.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                        
                          /* const Center(
                            child: AutoSizeText.rich(
                              TextSpan(text: 'New? ', children: [
                                TextSpan(text: 'Register here!', style: TextStyle(fontWeight: FontWeight.bold))
                              ]),
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ), */
                        ],
                      ),
                      ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              // onTap: () => Get.offAllNamed(Routes.HOME),
                              onTap: () => controller.login('user'),
                              onLongPress: () => controller.login('guard'),
                              child: Container(
                                height: 54,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(16)
                                ),
                                child: const Center(child: AutoSizeText('Login', style: TextStyle(color: AppColors.white, fontSize: 20, fontWeight: FontWeight.bold),)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      AutoSizeText(
                        '© Built for Spring Hill Residence', style: TextStyle(
                          fontSize: 8,
                          color: AppColors.grey.shade800
                        )
                      ),
                    ],
                  ),
                      
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
