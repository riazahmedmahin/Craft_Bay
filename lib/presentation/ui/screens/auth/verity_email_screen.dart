import 'package:craft_bay/presentation/state_holders/send_email_otp_controller.dart';
import 'package:craft_bay/presentation/ui/screens/auth/verity_OTP_screen.dart';
import 'package:craft_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {

  final TextEditingController _emailTEController = TextEditingController();
  GlobalKey<FormState>_formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 160,
                ),
                const AppLogo(
                  height: 80,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Welcome back',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Please enter your email address',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _emailTEController,
                  validator: (value){
                    if(value?.trim().isEmpty?? true){
                      return "Enter your email";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
                const SizedBox(
                  height: 24,
                ),
                GetBuilder<SendEmailOtpController>(
                  builder: (controller) {
                    return SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: controller.inProgress==false,
                        replacement: Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()){
                              final bool result = await controller.sendOtpToEmail(_emailTEController.text.trim());
                              if(result){
                                Get.to(()=>VerifyOTPScreen());
                              }
                              else{
                                Get.showSnackbar(GetSnackBar(
                                  title: "send OTP failed",
                                  message: controller.errorMessage,
                                  duration: Duration(seconds: 2),
                                  isDismissible: true
                                ));
                              }
                            }

                          },
                          child: const Text('Next'),
                        ),
                      ),
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
