import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_5_flutter/common/const/data.dart';
import 'package:project_5_flutter/common/util/build_context_extensions.dart';
import 'package:project_5_flutter/common/view/default_layout.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '로그인',
      isPopUp: true,
      onBackPressed: () {
        Navigator.pop(context, true);
      },
      body: const SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SignInForm(),
      ),
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final dio = Dio();

    const emulatorIp = '10.0.2.2:3000';
    const simulatorIp = '127.0.0.1:3000';

    final ip = Platform.isIOS ? simulatorIp : emulatorIp;

    String username = '';
    String password = '';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            onChanged: (value) {
              username = value;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '아이디',
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            onChanged: (value) {
              password = value;
            },
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '비밀번호',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colorScheme.primary,
              elevation: 0,
            ),
            onPressed: () async {
              final rawString = '$username:$password';

              Codec<String, String> stringToBase64 = utf8.fuse(base64);

              String token = stringToBase64.encode(rawString);

              final response = await dio.post(
                'http://$ip/auth/login',
                options: Options(
                  headers: {
                    'authorization': 'Basic $token',
                  },
                ),
              );

              final refreshToken = response.data['refreshToken'];
              final accessToken = response.data['accessToken'];

              await storage.write(key: refreshTokenKey, value: refreshToken);
              await storage.write(key: accessTokenKey, value: accessToken);

              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              height: 60,
              alignment: Alignment.center,
              child: Text(
                '로그인',
                style: TextStyle(
                  color: context.colorScheme.onPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  debugPrint('아이디 찾기');
                },
                child: const Text(
                  '아이디 찾기',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Text(
                '|',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () {
                  debugPrint('비밀번호 찾기');
                },
                child: const Text(
                  '비밀번호 찾기',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow,
              fixedSize: const Size(double.maxFinite, 60),
              elevation: 0,
            ),
            onPressed: () {
              debugPrint('카카오 로그인');
            },
            child: const Text(
              '카카오 로그인',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF000000),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFFFFFF),
              fixedSize: const Size(double.maxFinite, 60),
              side: const BorderSide(
                color: Color(0xFFAAAAAA),
                width: 1,
              ),
              elevation: 0,
            ),
            onPressed: () {
              debugPrint('Google 로그인');
            },
            child: const Text(
              'Google 로그인',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                child: Text(
                  '가입하고 프로젝트5를 경험하세요!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  debugPrint('회원가입');
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                  fixedSize: const Size(100, 30),
                  elevation: 0,
                ),
                child: Text(
                  '회원가입',
                  style: TextStyle(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
