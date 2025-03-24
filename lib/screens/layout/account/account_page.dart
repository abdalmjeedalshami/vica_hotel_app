import 'package:flutter/material.dart';
import 'package:vica_hotel_app/utils/colors.dart';
import 'package:vica_hotel_app/utils/icons.dart';
import 'package:vica_hotel_app/utils/images.dart';
import 'package:vica_hotel_app/utils/responsive_util.dart';
import 'package:vica_hotel_app/utils/theme/app_theme.dart';
import 'package:vica_hotel_app/widgets/raleway_text.dart';
import '../../../utils/show_dialog_util.dart';
import '../../../widgets/profile_field.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  // Dummy edit callbacks for demonstration purposes.
  void _editFullName() {
    // Handle full name edit
  }

  void _editEmail() {
    // Handle email edit
  }

  void _editPhone() {
    // Handle phone number edit
  }

  void _logout() {
    // Handle logout action
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: responsive(context, 24), vertical: responsive(context, 90)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Profile Photo
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                            AppImages.userBig), // Replace with your image asset
                      ),
                      SizedBox(height: responsive(context, 16)),

                      // Display the user name
                      RalewayText.medium('Rami Alkordy',
                          fontSize: responsive(context, 15),
                        color: Theme.of(context).socialLoginButtonColor,
                      ),
                      SizedBox(height: responsive(context, 30)),

                      // Editable fields for the profile information.
                      ProfileField(
                        iconPath: AppIcons.person,
                        label: 'Full name',
                        value: 'Rami Alkordy',
                        onEdit: _editFullName,
                      ),
                      SizedBox(height: responsive(context, 16)),

                      ProfileField(
                        iconPath: AppIcons.email,
                        label: 'Email',
                        value: 'vicas@gmail.com',
                        onEdit: _editEmail,
                      ),
                      SizedBox(height: responsive(context, 16)),

                      ProfileField(
                        iconPath: AppIcons.phone,
                        label: 'Phone number',
                        value: '+9639999999',
                        onEdit: _editPhone,
                      ),
                      SizedBox(
                          height:
                              responsive(context, responsive(context, 180))),

                      // Logout button in red text.
                      GestureDetector(
                        onTap: () {
                          _logout();
                          showLogoutDialog(context);
                        },
                        child: RalewayText.bold('Logout',
                            color: AppColors.redColor,
                            fontSize: responsive(context, 16)),
                      )
                    ]))));
  }
}
