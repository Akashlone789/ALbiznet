// auth_service.dart
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId = "";

  // १. युजरच्या मोबाईल नंबरवर OTP पाठवणे
  Future<void> sendOTP(String mobileNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '+91$mobileNumber', // भारताचा +91 कोड जोडला आहे
      verificationCompleted: (PhoneAuthCredential credential) async {
        // काही मोबाईलमध्ये OTP आपोआप वाचला जातो
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print('OTP पाठवण्यात अडचण आली: ${e.message}');
      },
      codeSent: (String verId, int? resendToken) {
        verificationId = verId; // OTP पाठवल्यानंतर हा ID सेव्ह होतो
        print('OTP यशस्वीपणे पाठवला गेला!');
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
      },
    );
  }

  // २. ग्राहकाने टाकलेला OTP तपासून अकाउंटमध्ये लॉगिन करणे
  Future<void> verifyOTPAndLogin(String otpCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpCode,
      );
      await _auth.signInWithCredential(credential);
      print("लॉगिन यशस्वी झाले! ALbiznet मध्ये स्वागत आहे.");
    } catch (e) {
      print("चुकीचा OTP टाकला आहे.");
    }
  }
  
  // ३. अकाउंटमधून बाहेर पडणे (Logout)
  Future<void> logout() async {
    await _auth.signOut();
  }
}
