import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for Clipboard
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_redo/presentation/user/bloc/user_details_bloc.dart';

class AppTabBarView extends StatelessWidget {
  const AppTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsBloc, UserDetailsState>(
      builder: (context, state) {
        final user = state.userModel!;
        return SizedBox(
          height: MediaQuery.of(context).size.height *
              0.6, // Adjust height as needed
          child: TabBarView(
            children: [
              // Information Tab
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _buildEditableTextField(
                            label: "Phone Number",
                            value: user.cell.toString(),
                            suffix: IconButton(
                              onPressed: () {
                                _copyToClipboard(
                                    context, user.eNumber.toString());
                              },
                              icon: const Icon(Icons.copy),
                            )),
                      ],
                    ),
                    _buildEditableTextField(label: "Email", value: user.email),
                    _buildEditableTextField(
                        label: "Address", value: user.address, maxLines: 2),
                    _buildEditableTextField(
                        label: "GitHub", value: user.github),
                    _buildEditableTextField(
                        label: "LinkedIn", value: user.linkedIn),
                  ],
                ),
              ),
              // Bio Tab
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEditableTextField(
                      label: "Bio",
                      value: user.bio,
                      maxLines: 12,
                    ),
                  ],
                ),
              ),
              // SOS Tab
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEditableTextField(
                        label: "Emergency Contact Name", value: user.eName),
                    _buildEditableTextField(
                      label: "Emergency Contact Number",
                      value: user.eNumber.toString(),
                      suffix: IconButton(
                        onPressed: () {
                          _copyToClipboard(context, user.eNumber.toString());
                        },
                        icon: const Icon(Icons.copy),
                      ),
                    ),
                    _buildEditableTextField(
                        label: "Relationship", value: user.eRelation),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEditableTextField({
    Widget? suffix,
    required String label,
    required String value,
    bool isEditable = false,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        // Wrap with SizedBox to provide width constraint
        width: 326,
        child: TextFormField(
          controller: TextEditingController(text: value),
          readOnly: !isEditable,
          maxLines: maxLines,
          decoration: InputDecoration(
            labelText: label,
            border: isEditable ? const OutlineInputBorder() : InputBorder.none,
            hintText: label,
            suffixIcon: suffix,
          ),
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Copied to Clipboard')),
    );
  }
}
