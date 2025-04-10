import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vica_hotel_app/screens/layout/home_layout.dart';
import 'package:vica_hotel_app/utils/navigation_util.dart';
import '../../providers/auth/auth_cubit.dart';
import '../../providers/auth/auth_state.dart';
import '../../providers/home/home_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  UpdateProfileScreenState createState() => UpdateProfileScreenState();
}

class UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: const Text("Update Profile")),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthProfileUpdated) {
            context.read<HomeCubit>().currentIndex = 3;
            NavigationUtil.navigateTo(context, screen: HomeLayout());
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Profile updated successfully")),
            );
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: firstNameController,
                  decoration: InputDecoration(labelText: locale.first_name),
                ),
                TextFormField(
                  controller: lastNameController,
                  decoration: InputDecoration(labelText: locale.last_name),
                ),
                TextFormField(
                  controller: userNameController,
                  decoration: InputDecoration(labelText: locale.username),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (firstNameController.text.isEmpty ||
                        lastNameController.text.isEmpty ||
                        userNameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please fill all fields")),
                      );
                      return;
                    }

                    final profileData = {
                      "first_name": firstNameController.text,
                      "last_name": lastNameController.text,
                      "user_name": userNameController.text,
                    };

                    context.read<AuthCubit>().updateProfile(profileData);
                  },
                  child: const Text("Update Profile"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
