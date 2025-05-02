import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ContactInfoType { text, number }

mixin CustomSheets {
  Future<ContactInfoType?> showContactTypeSheet(BuildContext context) async {
    return await showCupertinoModalPopup<ContactInfoType>(
      context: context,
      builder: (BuildContext context) => _buildContactTypeSheet(context),
    );
  }

  Widget _buildContactTypeSheet(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: screenWidth,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFD3D3D3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 15),
                Text(
                  'Contact info',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue.shade900,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Select type of information to fill your input',
                  style: TextStyle(fontSize: 14, color: Colors.blue.shade900),
                ),
                // Phone number option
                _buildActionButton(
                  context: context,
                  text: 'Phone number',
                  value: ContactInfoType.number,
                ),

                // Divider
                _buildDivider(),

                // Name & Link option
                _buildActionButton(
                  context: context,
                  text: 'Name & Link',
                  value: ContactInfoType.text,
                ),
              ],
            ),
          ),

          // Cancel button
          Container(
            width: screenWidth,
            margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            decoration: BoxDecoration(
              color: const Color(0xFFD3D3D3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: CupertinoButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required String text,
    required ContactInfoType value,
  }) {
    return GestureDetector(
      onTap: () => Navigator.pop(context, value),
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(color: Colors.blue, fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(height: 0.5, color: const Color(0xFFBDBDBD));
  }
}
