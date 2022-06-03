import 'package:flutter/material.dart';
import 'package:project_5_flutter/slide_menu.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = '로그인';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    debugPrint('뒤로가기');
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  appTitle,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color(0xFFFFFFFF),
        ),
        body: const SignInForm(),
        backgroundColor: const Color(0xFFFFFFFF),
      ),
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '아이디',
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '비밀번호',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 20, 8, 2),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF000000),
              fixedSize: const Size(double.maxFinite, 60),
              elevation: 0,
            ),
            onPressed: () {
              debugPrint('로그인');
            },
            child: const Text(
              '로그인',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 2, 8, 10),
          child: Row(
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
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Text(
                '|',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
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
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              onPrimary: const Color.fromRGBO(0x00, 0x00, 0x00, 1),
              primary: const Color.fromRGBO(0xfa, 0xe1, 0x00, 1),
              fixedSize: const Size(double.maxFinite, 60),
              elevation: 0,
            ),
            onPressed: () {
              debugPrint('카카오 로그인');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(''),
                Text(
                  '카카오 로그인',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              onPrimary: const Color(0xFF000000),
              primary: const Color(0xFFFFFFFF),
              fixedSize: const Size(double.maxFinite, 60),
              side: const BorderSide(color: Color(0xFFAAAAAA), width: 1),
              elevation: 0,
            ),
            onPressed: () {
              debugPrint('Google 로그인');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(
                  Icons.g_mobiledata_rounded,
                ),
                Text(''),
                Text(
                  'Google 로그인',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
              child: Text(
                '가입하고 프로젝트 5를 경험하세요!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
              child: OutlinedButton(
                onPressed: () {
                  debugPrint('회원가입');
                },
                style: OutlinedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.primary,
                  side:
                      BorderSide(color: Theme.of(context).colorScheme.primary),
                  fixedSize: const Size(100, 30),
                  elevation: 0,
                ),
                child: const Text(
                  '회원가입',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
