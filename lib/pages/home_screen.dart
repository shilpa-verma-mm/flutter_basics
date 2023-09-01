import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_basics/services/appinfo_service.dart';

class HomeScreen extends StatefulWidget {
  final String? name;
  final String? id;
  final String? email;
  final String? age;
  final String? place;

  const HomeScreen({
    super.key,
    this.name,
    this.id,
    this.email,
    this.age,
    this.place,
  });

  @override
  State<HomeScreen> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  var _packageInfo = AppInfo().packageInfo;

  @override
  void initState() {
    AppInfo().getAppInfo().then((value) {
      setState(() {
        _packageInfo = value;
      });
    });
    super.initState();
  }

  void logout(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text("Logout from app"),
            content: const Text("Are you sure want to logout?"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  context.go("/");
                },
                child: const Text("OK"),
              )
            ],
          );
        });
  }

  void viewAppInfo(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: _packageInfo.appName,
      applicationVersion:
          "${_packageInfo.version}(${_packageInfo.buildNumber})",
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                "A declarative routing package for Flutter that uses the Router API to provide a convenient, url-based API for navigating between different screens. You can define URL patterns, navigate using a URL, handle deep links, and a number of other navigation-related scenarios."),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            viewAppInfo(context);
          },
          icon: const Icon(
            Icons.trolley,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Home Screen",
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              logout(context);
            },
          )
        ],
        backgroundColor: const Color.fromARGB(255, 37, 205, 46),
      ),
      body: Card(
        margin: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 12,
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Hi, ${widget.name}',
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Email id: ${widget.email}',
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Location: ${widget.place}',
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
