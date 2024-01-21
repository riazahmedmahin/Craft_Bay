import 'package:craft_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:craft_bay/presentation/state_holders/verify_otp_controller.dart';
import 'package:craft_bay/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:craft_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:craft_bay/presentation/ui/utility/app_colors.dart';
import 'package:craft_bay/presentation/ui/utility/app_theme_data.dart';
import 'package:craft_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key, required this.email});

  final String email;

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {

  final TextEditingController _OtpTEController= TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  height: 120,
                ),
                const AppLogo(
                  height: 80,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Enter OTP Code',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'A 4 Digit OTP Code has been sent',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 16,
                ),
                PinCodeTextField(
                  controller: _OtpTEController,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                      activeFillColor: Colors.transparent,
                      inactiveFillColor: Colors.transparent,
                      inactiveColor: AppColors.primaryColor,
                      selectedFillColor: Colors.transparent,
                    selectedColor: Colors.purple
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  appContext: context,
                ),
                const SizedBox(
                  height: 24,
                ),
                GetBuilder<VerifyOtpController>(
                  builder: (verifyOtpController) {
                    return SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: verifyOtpController.inProgress==false,
                        replacement: Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final bool response = await verifyOtpController.verifyOtp(
                                  widget.email, _OtpTEController.text);
                              if (response) {
                                if (verifyOtpController.shouldNavigateCompleteProfile) {
                                  Get.to(() => const CompleteProfileScreen());
                                } else {
                                  Get.offAll(() => const MainBottomNavScreen());
                                }
                              } else {
                                Get.showSnackbar(GetSnackBar(
                                  title: 'OTP verification failed',
                                  message: verifyOtpController.errorMassage,
                                  duration: const Duration(seconds: 2),
                                  isDismissible: true,
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
                SizedBox(height: 24,),
                RichText(text: TextSpan(
                  style: TextStyle(color: Colors.grey),
                  children: [
                    TextSpan(
                      text: "This code will expire in "
                    ),
                    TextSpan(
                        text: "120s",
                      style: TextStyle(color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600)
                    ),
                  ]
                )),
                TextButton(onPressed: (){},
                    child: Text("Resend",
                      style: TextStyle(color: Colors.grey),)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
