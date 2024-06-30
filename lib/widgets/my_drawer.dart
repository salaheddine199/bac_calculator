import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../screens/subject_weights_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void _sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'your-email@example.com',
      query: 'subject=Issue%20with%20App&body=Please%20describe%20the%20issue:',
    );
    try {
      await launchUrl(emailLaunchUri);
    } catch (e) {
      // Handle the error
      print('Could not launch $emailLaunchUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'تطبيق حساب المعدل',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('إرسال بريد إلكتروني'),
            onTap: _sendEmail,
          ),
          ListTile(
            leading: Icon(Icons.table_chart),
            title: Text('معاملات المواد'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubjectWeightsScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
