import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:flutter/material.dart';

class SearchFormWidget extends StatelessWidget {
  final TextEditingController controller;
  const SearchFormWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(12),
            ),
            height: 60,
            width: double.infinity,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Cari',
                labelStyle: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
                hintStyle: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
