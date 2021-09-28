import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa/presenter/controllers/home_store.dart';
import 'package:nasa/presenter/pages/picture_page.dart';
import 'package:nasa/presenter/widgets/custom_app_bar.dart';
import 'package:nasa/presenter/widgets/round_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'APOD'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Text("Welcome to Astronomy Picture of the Day",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption),
                SizedBox(
                  height: 150,
                ),
                RoundButton(
                  label: "Select datetime",
                  onTap: () async {
                    var datePicked = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1995, 06, 16),
                      initialDate: DateTime.now(),
                      lastDate: DateTime.now(),
                    );
                    PicturePage.navigate(datePicked);
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
