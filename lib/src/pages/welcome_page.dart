import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_pages.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ Expanded(
            child: Image.asset("assets/logo/logo.png",width: double.infinity,)),
          SizedBox(height: 5),
          Text("CamTech University", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          Padding(padding: EdgeInsets.all(15),
            child: Text("Knowledge Reason Character",
              style: TextStyle(fontSize: 23, color: Colors.black54, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 80),
          InkWell(
            onTap: () async{
              final SharedPreferences checkStartPagr = await SharedPreferences.getInstance();
              checkStartPagr.setBool("PREF_START_PAGE", false);

              Navigator.push(context, MaterialPageRoute(builder: (context) => MainPages(),));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Get Started", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueAccent),),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
