import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectLanguagePage extends StatefulWidget {
  @override
  State<SelectLanguagePage> createState() => _SelectLanguagePageState();
}

class _SelectLanguagePageState extends State<SelectLanguagePage> {
  String selectedLang = 'English (US)';

  List<Map<String, String>> languages = [
    {'name': 'English (US)', 'flag': '🇺🇸'},
    {'name': 'Indonesia', 'flag': '🇮🇩'},
    {'name': 'Afghanistan', 'flag': '🇦🇫'},
    {'name': 'Algeria', 'flag': '🇩🇿'},
    {'name': 'Malaysia', 'flag': '🇲🇾'},
    {'name': 'Arabic', 'flag': '🇦🇪'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              SizedBox(height: 10),
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'What is Your Mother Language',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Discover what is a podcast description and podcast summary.',
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
              SizedBox(height: 24),
              Expanded(
                child: ListView.builder(
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    final lang = languages[index];
                    final isSelected = lang['name'] == selectedLang;

                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: isSelected
                            ? Border.all(color: Colors.blue, width: 1.5)
                            : Border.all(color: Colors.grey[300]!),
                      ),
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        leading: Text(
                          lang['flag'] ?? '',
                          style: TextStyle(fontSize: 26),
                        ),
                        title: Text(lang['name'] ?? '',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        trailing: isSelected
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Selected',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              )
                            : OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedLang = lang['name']!;
                                  });
                                },
                                style: OutlinedButton.styleFrom(
                                  shape: StadiumBorder(),
                                  side: BorderSide(color: Colors.grey),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                ),
                                child: Text('Select',
                                    style: TextStyle(fontSize: 12)),
                              ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
            SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(
                        '/login',
                      ); // Navigate to Reset Password Page
                    },
                    child: const Text(
                      'Continue',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}


