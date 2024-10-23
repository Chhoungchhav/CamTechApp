import 'package:flutter/material.dart';
import '../repository/settings_repository.dart';
import '../models/setting.dart';

import '../pages/apply_now_page.dart';

class CamtechTemplate extends StatefulWidget {
  final Widget child;

  Color? color;
  CamtechTemplate({super.key, required this.child, this.color});

  @override
  State<CamtechTemplate> createState() => _CamtechTemplateState();
}

class _CamtechTemplateState extends State<CamtechTemplate> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(9),
          height: 65,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // CamTech logo aligned to the left-most side
              Image.asset(
                "assets/logo/logocamtech.png",
                height: 50, // Adjust the size as needed
                fit: BoxFit.contain,
              ),
              // Row for Apply Now button and flag aligned to the right-most side
              Row(
                children: [
                  // Apply Now button
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ApplyNowPage()), // Navigate to new page
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: const Text(
                      'Apply Now',
                      style: TextStyle(
                        color: Color(0xFF003665), // Change this color as needed
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  // Separator (vertical line)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: VerticalDivider(
                      color: Color(0xFF003665),
                      thickness: 2,
                      width: 1,
                    ),
                  ),
                  // Flag and dropdown icon
                  GestureDetector(
                    onTap: () {
                      var _setting = Setting();
                      setState(() {
                        if (setting.value.defaultLang) {
                          _setting.lang = "khmer";
                          _setting.mobileLanguage.value =
                              const Locale("km", "");
                          _setting.defaultLang = false;
                        } else {
                          _setting.lang = "English";
                          _setting.mobileLanguage.value =
                              const Locale("en", "");
                          _setting.defaultLang = true;
                        }
                        setting.value.defaultLang = !_setting.defaultLang;
                        setting.value = _setting;
                        setting.notifyListeners();
                      });
                    },
                    child: Row(
                      children: [
                        // Display flag based on the current language
                        setting.value.defaultLang
                            ? Image.asset(
                                "assets/logo/english.png",
                                width: 30,
                                height: 30,
                              )
                            : Image.asset(
                                "assets/logo/khmer.png",
                                width: 30,
                                height: 30,
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: widget.color,
            width: double.infinity,
            height: double.infinity,
            child: widget.child,
          ),
        ),
      ],
    ));
  }
}
