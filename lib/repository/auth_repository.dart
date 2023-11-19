import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googledocsclone/constants.dart';
import 'package:googledocsclone/models/error_model.dart';
import 'package:googledocsclone/models/user_model.dart';
import 'package:http/http.dart';

final authRepositpryProvider = Provider(
    (ref) => AuthRepository(googleSignIn: GoogleSignIn(), client: Client()));
final userProvider = StateProvider<UserModel?>((ref) => null);

class AuthRepository {
  final GoogleSignIn _googleSignIn;
  final Client _client;

  AuthRepository({required GoogleSignIn googleSignIn, required Client client})
      : _googleSignIn = googleSignIn,
        _client = client;

  Future<ErrorModel> signInWithGoogle() async {
    ErrorModel error = ErrorModel(error: 'An error occurred!', data: null);
    try {
      final user = await _googleSignIn.signIn();
      if (user != null) {
        final userAcc = UserModel(
            email: user.email,
            name: user.displayName!,
            profilePicture: user.photoUrl!,
            uid: '',
            token: '');

        var res = await _client.post(
            Uri.parse(
              '$host/api/signup',
            ),
            body: userAcc.toJson(),
            headers: {
              "Content-Type": "application/json; charset=UTF-8",
            });
        print('http response-------');
        print(res.body);
        print(res.statusCode);
        switch (res.statusCode) {
          case 200:
            var user = jsonDecode(res.body)['data'];
            final newUser = userAcc.copyWith(
              uid: user['id'],
            );
            error = ErrorModel(error: null, data: newUser);
            break;
          case 403:
            var user = jsonDecode(res.body)['data'];
            final newUser = userAcc.copyWith(
              uid: user['id'],
            );
            error = ErrorModel(error: null, data: newUser);
            break;
          // case 403:
          //   var message = jsonDecode(res.body)['message'];
          //   error = ErrorModel(error: message, data: null);
          //   break;
          // default:
        }
      }
    } catch (e) {
      print('---error---');
      print(e.toString());
      error = ErrorModel(error: e.toString(), data: null);
    }

    return error;
  }
}
