/* import 'package:flutter/material.dart';
import 'package:gesturb/methods/common_methods.dart';
import 'package:gesturb/models/requests/login_request.dart';
import 'package:gesturb/models/requests/register_request.dart';
import 'package:gesturb/models/requests/verifyotp_request.dart';
import 'package:gesturb/models/response/login_response.dart';
import 'package:gesturb/models/response/register_response.dart';
import 'package:gesturb/models/response/verifyotp_response.dart';

class AuthProvider extends ChangeNotifier {
  CommonMethods commonMethods = CommonMethods();

  LoginResponse loginResponse = LoginResponse(
      status: '',
      message: "",
      id: 0,
      name: '',
      firstName: '',
      email: '',
      role: '');

  VerifyOtpResponse verifyOtpResponse =
      VerifyOtpResponse(status: '', message: '', role: '', id: 0);
  VerifyOtpResponse get getVerifyOtpResponse =>
      VerifyOtpResponse(status: '', message: '', role: '', id: 0);

  static String email = "";
  static String role = "";
  static int id = 0;

  // Getter methods
  String get getEmail => email;
  String get getRole => role;
  int get getId => id;

  /* login provider */
  Future loginProvider(LoginRequest signInRequest, BuildContext context) async {
    try {
      final response = await AuthService.loginService(signInRequest, context);
      if (response!.status == '00') {
        //email = signInRequest.email;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomeFournisseur()));
        notifyListeners();
      } else {
        throw Exception('fail to log user');
      }
    } catch (e) {
      throw Exception('fail check phone number:$e');
    }
  }

  Future registerProvider(
    RegisterRequest registerRequest,
    BuildContext context,
  ) async {
    try {
      final response =
          await AuthService.registerService(registerRequest, context);
      if (response!.status == '00') {
        email = registerRequest.email;
        notifyListeners();
        return response;
      } else {
        notifyListeners();
        throw Exception('Failed to register user');
      }
    } catch (e) {
      throw Exception('Failed to register user: $e');
    }
  }

  Future validationCodeProvider(
      VerifyOtpRequest verifyOtpRequest, BuildContext context) async {
    try {
      final response =
          await AuthService.validationCodeService(context, verifyOtpRequest);
      if (response?.status == "00") {
        print('le role ${response!.role}');
        //role = response.role as int;
        // Access email, role, and id from the AuthProvider instance
        //print(authProvider.getEmail);
        //print(authProvider.getRole);
        //print(authProvider.getId);
        // You can also update the email, role, or id values in the AuthProvider if needed
        //role  = response!.role  ;
        //id = response.id;
        if (response!.role.toString() == "1") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FournisseurInfo()));
          return response;
        } else if (response!.role.toString() == "2") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EntrepriseInfo()));
        }
        //return response;
      } else {
        //commonMethods.displaySnackbar('verifier vos credentials', context);
        commonMethods.displaySnackbar('verifiez encore', context);
        print('erreur de verification');
      }
    } catch (e) {
      throw Exception('fail checking the code number:$e');
    }
  }
}

enum Type { entreprise, fournisseur }

enum UserType {
  entreprise,
  fournisseur,
}
 */