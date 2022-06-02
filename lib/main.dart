import 'package:flutter/material.dart';
import 'package:material_design_component/Page/bottom_navigator.dart';
import 'package:material_design_component/Page/card.dart';
import 'package:material_design_component/Page/checkbox.dart';
import 'package:material_design_component/Page/chip.dart';
import 'package:material_design_component/Page/date_picker.dart';
import 'package:material_design_component/Page/dialog.dart';
import 'package:material_design_component/Page/otp_textfiled.dart';
import 'package:material_design_component/custom_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Design Demo',
      home: const MyHomePage(),
      theme: CustomTheme().buildDarkTheme(),
    );
  }
}

//Main Page gồm Appbar top, bottom; drawer; Material Banner
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedDestination = 0;
  List<bool> checked = [true, true, false, false, true];
  @override
  Widget build(BuildContext context) {
    //MaterialBanner chung cho cả 2 button trên
    final MaterialBanner materialBanner = MaterialBanner(
      content: const Text('Error message text'),
      leading: const CircleAvatar(child: Icon(Icons.delete)),
      actions: [
        TextButton(
          child: const Text('ACTION 1'),
          onPressed: () {},
        ),
        TextButton(
          child: const Text('HIDE'),
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          },
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('APPBAR: TOP'),
        actions: [
          //Menus
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.add),
                  title: Text('Item 1'),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.anchor),
                  title: Text('Item 2'),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.article),
                  title: Text('Item 3'),
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(child: Text('Item A')),
              const PopupMenuItem(child: Text('Item B')),
            ],
          ),
        ],
      ),
      drawer: Drawer(
          child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Header',
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Data Table'),
              selected: _selectedDestination == 0,
              onTap: () {
                selectDestination(0);
              }),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Dialog'),
            selected: _selectedDestination == 1,
            onTap: () {
              selectDestination(1);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DialogPage()));
            }
          ),
          ListTile(
            leading: const Icon(Icons.label),
            title: const Text('Bottom Navigator Bar'),
            selected: _selectedDestination == 2,
              onTap: () {
                selectDestination(2);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const BottomNavigatorPage()));
              }
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Label',
            ),
          ),
          ListTile(
            leading: const Icon(Icons.bookmark),
            title: const Text('Item A'),
            selected: _selectedDestination == 3,
            onTap: () => selectDestination(3),
          ),
        ],
      )),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
            const Spacer(),
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showMaterialBanner(materialBanner);
              },
              child: const Text('MATERIAL BANNER'),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CardPage()));
              },
              child: const Text("CARD"),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CheckBoxesPage(checked)));
              },
              child: const Text("CHECKBOX"),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ChipPage()));
              },
              child: const Text("CHIPS"),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const DatePickerPage()));
              },
              child: const Text("DATE PICKER"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          label: const Text('OTP TEXTFIELD'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const OTPPage()));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}

