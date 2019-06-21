import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:jh_flutter_mobx/constants/strings.dart';
import 'package:jh_flutter_mobx/services/routes.dart';
import 'package:jh_flutter_mobx/stores/authentication/authentication_store.dart';
import 'package:jh_flutter_mobx/widgets/app_icon_widget.dart';
import 'package:jh_flutter_mobx/widgets/empty_app_bar_widget.dart';
import 'package:jh_flutter_mobx/widgets/error_message_widget.dart';
import 'package:jh_flutter_mobx/widgets/global_methods.dart';
import 'package:jh_flutter_mobx/widgets/progress_indicator_widget.dart';
import 'package:jh_flutter_mobx/widgets/rounded_button_widget.dart';
import 'package:jh_flutter_mobx/widgets/textfield_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginScreen extends StatefulWidget {
  final testKey = Key('K');
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text controllers
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //focus node
  FocusNode _passwordFocusNode;

  //form key
  final _formKey = GlobalKey<FormState>();

  //store
  final _store = AuthenticationStore();

  @override
  void initState() {
    super.initState();

    _passwordFocusNode = FocusNode();

    _userEmailController.addListener(() {
      //this will be called whenever user types in some value
      _store.setUserId(_userEmailController.text);
    });
    _passwordController.addListener(() {
      //this will be called whenever user types in some value
      _store.setPassword(_passwordController.text);
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: EmptyAppBar(),
      body: _buildBody(),
    );
  }

  Material _buildBody() {
    return Material(
      child: Stack(
        children: <Widget>[
          OrientationBuilder(
            builder: (context, orientation) {
              //variable to hold widget
              var child;

              //check to see whether device is in landscape or portrait
              //load widgets based on device orientation
              orientation == Orientation.landscape
                  ? child = Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: _buildLeftSide(),
                        ),
                        Expanded(
                          flex: 1,
                          child: _buildRightSide(),
                        ),
                      ],
                    )
                  : child = Center(child: _buildRightSide());
              return child;
            },
          ),
          Observer(
            name: 'navigate',
            builder: (context) {
              return _store.success
                  ? _store.navigate(context)
                  : showErrorMessage(context , _store.errorStore.errorMessage);
            },
          ),
          Observer(
            name: 'loading',
            builder: (context) {
              return Visibility(
                visible: _store.loading,
                child: CustomProgressIndicatorWidget(),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildLeftSide() {
    return SizedBox.expand(
      child: Image.asset(Strings.login_image,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildRightSide() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppIconWidget(image: Strings.app_icon),
              SizedBox(height: 24.0),
              _buildUserIdField(),
              _buildPasswordField(),
              _buildForgotPasswordButton(),
              _buildSignInButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserIdField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          key: Key('user_id'),
          hint: Strings.login_et_user_email,
          inputType: TextInputType.emailAddress,
          icon: Icons.person,
          iconColor: Colors.black54,
          textController: _userEmailController,
          inputAction: TextInputAction.next,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          errorText: _store.userEmail,
        );
      },
    );
  }

  Widget _buildPasswordField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          key: Key('user_password'),
          hint: Strings.login_et_user_password,
          isObscure: true,
          padding: EdgeInsets.only(top: 16.0),
          icon: Icons.lock,
          iconColor: Colors.black54,
          textController: _passwordController,
          focusNode: _passwordFocusNode,
          errorText: _store.password,
        );
      },
    );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: FractionalOffset.centerRight,
      child: FlatButton(
        key: Key('forgot_password'),
        padding: EdgeInsets.all(0.0),
        child: Text(
          Strings.login_btn_forgot_password,
          style: Theme.of(context)
              .textTheme
              .caption
              .copyWith(color: Colors.orangeAccent),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _buildSignInButton() {
    return RoundedButtonWidget(
      key: Key('sign_button'),
      buttonText: Strings.login_btn_sign_in,
      buttonColor: Colors.orangeAccent,
      //textColor: Colors.white,
      textColor: Theme.of(context).textTheme.button.color,
      onPressed: () async {
        if (_store.canLogin) {
          _store.login(_userEmailController.text,_passwordController.text);
        } else {
          showErrorMessage(context , 'Please fill in all fields');
        }
      },
    );
  }
  
}
