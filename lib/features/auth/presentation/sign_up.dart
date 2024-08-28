import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/core/helpers/Is_darkmode.dart';
import 'package:spotify_app/features/auth/presentation/sign_in.dart';
import '../../../core/widgets/basic_appbar.dart';
import 'widgets/noAccount_text.dart';
import 'widgets/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NoAccountText(
        ontap: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const SignInScreen()));
        },
        text: 'Login',
      ),
      appBar: const BasicAppbar(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Text(
                    "Register Account",
                    style: TextStyle(
                      color: context.Isdarkmode ? Colors.white : Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  SignUpForm(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocalCard(
                        icon: SvgPicture.string(googleIcon),
                        press: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SocalCard(
                          icon: SvgPicture.string(facebookIcon),
                          press: () {},
                        ),
                      ),
                      SocalCard(
                        icon: SvgPicture.string(twitterIcon),
                        press: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "By continuing your confirm that you agree \nwith our Term and Condition",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF757575),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SocalCard extends StatelessWidget {
  const SocalCard({
    super.key,
    required this.icon,
    required this.press,
  });

  final Widget icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 56,
        width: 56,
        decoration: const BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}

// Icons

const googleIcon =
    '''<svg width="16" height="17" viewBox="0 0 16 17" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M15.9988 8.3441C15.9988 7.67295 15.9443 7.18319 15.8265 6.67529H8.1626V9.70453H12.6611C12.5705 10.4573 12.0807 11.5911 10.9923 12.3529L10.9771 12.4543L13.4002 14.3315L13.5681 14.3482C15.1099 12.9243 15.9988 10.8292 15.9988 8.3441Z" fill="#4285F4"/>
<path d="M8.16265 16.3254C10.3666 16.3254 12.2168 15.5998 13.5682 14.3482L10.9924 12.3528C10.3031 12.8335 9.37796 13.1691 8.16265 13.1691C6.00408 13.1691 4.17202 11.7452 3.51894 9.7771L3.42321 9.78523L0.903556 11.7352L0.870605 11.8268C2.2129 14.4933 4.9701 16.3254 8.16265 16.3254Z" fill="#34A853"/>
<path d="M3.519 9.77716C3.34668 9.26927 3.24695 8.72505 3.24695 8.16275C3.24695 7.6004 3.34668 7.05624 3.50994 6.54834L3.50537 6.44017L0.954141 4.45886L0.870669 4.49857C0.317442 5.60508 0 6.84765 0 8.16275C0 9.47785 0.317442 10.7204 0.870669 11.8269L3.519 9.77716Z" fill="#FBBC05"/>
<path d="M8.16265 3.15623C9.69541 3.15623 10.7293 3.81831 11.3189 4.3716L13.6226 2.12231C12.2077 0.807206 10.3666 0 8.16265 0C4.9701 0 2.2129 1.83206 0.870605 4.49853L3.50987 6.54831C4.17202 4.58019 6.00408 3.15623 8.16265 3.15623Z" fill="#EB4335"/>
</svg>''';

const facebookIcon =
    '''<svg width="8" height="15" viewBox="0 0 8 15" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M5.02224 14.8963V8.10133H7.30305L7.64452 5.45323H5.02224V3.7625C5.02224 2.99583 5.23517 2.4733 6.33467 2.4733L7.73695 2.47265V0.104232C7.49432 0.0720777 6.66197 0 5.6936 0C3.67183 0 2.28768 1.23402 2.28768 3.50037V5.4533H0.000976562V8.1014H2.28761V14.8963L5.02224 14.8963Z" fill="#3C5A9A"/>
</svg>''';

const twitterIcon =
    '''<svg width="16" height="14" viewBox="0 0 16 14" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M15.9821 1.5867C15.3952 1.84714 14.7648 2.0232 14.102 2.10234C14.7785 1.69727 15.2967 1.05538 15.5414 0.291424C14.8988 0.673076 14.1955 0.941758 13.4622 1.0858C12.8654 0.449657 12.0143 0.0524902 11.0728 0.0524902C9.26556 0.0524902 7.79989 1.51757 7.79989 3.32586C7.79989 3.58208 7.82875 3.83204 7.88423 4.07203C5.16367 3.9353 2.75173 2.63213 1.13729 0.651959C0.855385 1.13557 0.694025 1.69786 0.694025 2.29779C0.694025 3.43331 1.27199 4.43519 2.15019 5.02206C1.63031 5.00595 1.12184 4.86563 0.66728 4.61281V4.65418C0.66728 6.24031 1.79545 7.56287 3.29302 7.86367C3.01792 7.93904 2.72921 7.97842 2.43053 7.97842C2.21936 7.97842 2.01448 7.95844 1.81433 7.92079C2.23089 9.22084 3.4398 10.1671 4.8718 10.1939C3.75149 11.0721 2.33986 11.5956 0.806669 11.5956C0.542595 11.5956 0.281606 11.5798 0.0253906 11.549C1.47425 12.478 3.19453 13.0203 5.04317 13.0203C11.0639 13.0203 14.3567 8.03242 14.3567 3.70685C14.3567 3.56484 14.3535 3.42389 14.3467 3.28344C14.9882 2.81942 15.542 2.24487 15.9821 1.5867Z" fill="#2DAAE1"/>
</svg>''';
