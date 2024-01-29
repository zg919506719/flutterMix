import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/login/login_router.dart';
import 'package:learn_flutter/login/widgets/my_text_field.dart';
import 'package:learn_flutter/routers/fluro_navigator.dart';
import 'package:learn_flutter/table/table_router.dart';
import 'package:learn_flutter/util/toast_utils.dart';
import 'package:learn_flutter/widgets/my_app_bar.dart';
import 'package:flutter_gen/gen_l10n/learn_localizations.dart';
import 'package:learn_flutter/widgets/my_button.dart';
import 'package:learn_flutter/widgets/my_scroll_view.dart';

import '../res/gaps.dart';
import '../res/styles.dart';
import '../util/change_notifier_manage.dart';
import '../util/other_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with ChangeNotifierMixin<LoginPage> {
  //定义contriller
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  bool _clickable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isBack: false,
        actionName: LearnLocalizations.of(context)!.verificationCodeLogin,
        onPressed: () {
          NavigatorUtils.push(context, LoginRouter.loginPage);
        },
      ),
      body: MyScrollView(
        keyboardConfig: Utils.getKeyboardActionsConfig(
            context, <FocusNode>[_nodeText1, _nodeText2]),
        children: _buildBody,
      ),
    );
  }

  List<Widget> get _buildBody => <Widget>[
        Text(
          LearnLocalizations.of(context)!.passwordLogin,
          style: TextStyles.textBold26,
        ),
        Gaps.vGap16,
        MyTextField(
          controller: _nameController,
          key: const Key("name"),
          maxLength: 11,
          keyboardType: TextInputType.phone,
          focusNode: _nodeText1,
          hintText: LearnLocalizations.of(context)!.inputUsernameHint,
        ),
        Gaps.vGap8,
        MyTextField(
          controller: _passwordController,
          key: const Key("password"),
          focusNode: _nodeText2,
          isInputPwd: true,
          keyboardType: TextInputType.visiblePassword,
          hintText: LearnLocalizations.of(context)!.inputPasswordHint,
        ),
        Gaps.vGap24,
        MyButton(
          onPressed: _clickable ? _login : null,
          key: const Key("login"),
          text: LearnLocalizations.of(context)!.login,
        ),
        Gaps.vGap24,
        MyButton(
          onPressed: _routeTable,
          key: const Key("table"),
          text: "到中台",
        )
      ];

  @override
  Map<ChangeNotifier?, List<VoidCallback>?>? changeNotifier() {
    final List<VoidCallback> callbacks = <VoidCallback>[_verify];
    return <ChangeNotifier, List<VoidCallback>?>{
      _nameController: callbacks,
      _passwordController: callbacks,
      _nodeText1: null,
      _nodeText2: null
    };
  }

  void _verify() {
    final String name = _nameController.text;
    final String password = _passwordController.text;
    bool isClickable = true;
    if (name.isEmpty) {
      isClickable = false;
      return;
    }

    if (password.isEmpty) {
      isClickable = false;
    }

    if (_clickable != isClickable) {
      setState(() {
        _clickable = isClickable;
      });
    }
  }

  void _login() {
    Toast.show("登录成功");
  }

  void _routeTable() {
    NavigatorUtils.push(context, TableRouter.tableRoute);
  }
}
