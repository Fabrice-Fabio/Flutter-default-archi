import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:repozen/constants/global_vars.dart';
import 'package:repozen/presentation/screens/export_screens.dart';
import 'package:repozen/presentation/widgets/export_widgets.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  double textFontSize = 13;
  final List<Widget> _children = [
    HomePage(),
    Partenerships(),
    MakePost(),
    News(),
    Profiles()
  ];

  @override
  void initState() {
    super.initState();
  }

  onTabTapped(int index) {
    // try to show animation when user want to publish
    if (index == 2) {
      cameraSelect(context);
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _children[_currentIndex],
        // default background for all page
        decoration: const BoxDecoration(
          /*image:  DecorationImage(
            image: ExactAssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),*/
        ),
      ),
      /*bottomNavigationBar: Container(
        child: ClipRRect(
          /*borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),*/
          child: BottomNavigationBar(
            elevation: 10,
            backgroundColor: navbarColor,
            fixedColor: Colors.white,
            unselectedItemColor: Colors.white,
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.homeVariantOutline, color: Colors.white70,),
                label: 'Accueil',
                activeIcon: Icon(MdiIcons.homeVariant, color: Colors.white,),
              ),
              BottomNavigationBarItem(
                  icon: Icon(MdiIcons.compassOutline, color: Colors.white70,),
                  label: "Actualité",
                  activeIcon: Icon(MdiIcons.compass, color: Colors.white,),
              ),
              BottomNavigationBarItem(
                  icon: Icon(MdiIcons.plusCircleOutline, color: Colors.white70, size: 40,),
                  label: '',
                  activeIcon: Icon(MdiIcons.plusCircle, color: Colors.white, size: 40,),
              ),
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.accountGroupOutline, color: Colors.white70,),
                label: 'Partenaires',
                activeIcon: Icon(MdiIcons.accountGroup, color: Colors.white,),
              ),
              BottomNavigationBarItem(
                  icon: Icon(MdiIcons.accountOutline, color: Colors.white70,),
                  label: 'Mon compte',
                  activeIcon:  Icon(MdiIcons.account, color: Colors.white,),
              ),
            ],
          ),
        ),
      ),*/


      bottomNavigationBar: Container(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 3,
            color: navbarColor,
            child: Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialButton(
                        onPressed: (){
                          setState(() {
                            _currentIndex = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(_currentIndex == 0 ? MdiIcons.homeVariant : MdiIcons.homeVariantOutline,
                              color: _currentIndex == 0 ? secondColor : Colors.white,),
                            Text('Accueil', style: TextStyle(color: Colors.white, fontSize: textFontSize),),
                          ],
                        ),
                      ),
                      MaterialButton(
                        onPressed: (){
                          setState(() {
                            _currentIndex = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(_currentIndex == 1 ? MdiIcons.compass : MdiIcons.compassOutline,
                              color: _currentIndex == 1 ? secondColor : Colors.white,),
                            Text('Actualité', style: TextStyle(color: Colors.white, fontSize: textFontSize),),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Right
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialButton(
                        onPressed: (){
                          setState(() {
                            _currentIndex = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(_currentIndex == 2 ? MdiIcons.accountGroup : MdiIcons.accountGroupOutline,
                              color: _currentIndex == 2 ? secondColor : Colors.white,),
                            Text('Partenaires', style: TextStyle(color: Colors.white, fontSize: textFontSize),),
                          ],
                        ),
                      ),
                      MaterialButton(
                        onPressed: (){
                          setState(() {
                            _currentIndex = 3;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(_currentIndex == 3 ? MdiIcons.account : MdiIcons.accountOutline,
                              color: _currentIndex == 3 ? secondColor : Colors.white,),
                            Text('Mon compte', style: TextStyle(color: Colors.white, fontSize: textFontSize),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(MdiIcons.plus, size: 30),
        onPressed: (){},
        backgroundColor: floatingBtnColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }



  Future pickMedia(ImageSource source, MediaType type) async {
    final XFile? asset;
    File file;
    String filePath;
    if (type == MediaType.image) {
      asset = await ImagePicker().pickImage(source: source,imageQuality: 50);
      if (asset != null) {
        file = File(asset.path);
        filePath = asset.path;
        debugPrint("imgUrl  : $file");
        return [file, filePath];
      }
    } else {
      asset = await ImagePicker().pickVideo(source: source);
      if (asset != null) {
        file = File(asset.path);
        filePath = asset.path;
        debugPrint("videoUrl  : $file");
        return [file, filePath];
      }
    }
  }


  Future cameraSelect(parentContext) async {
    bottomModalSheetCustom(
      parentContext: parentContext,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Create"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () async {
                var response = await pickMedia(ImageSource.gallery, MediaType.image);
                if (response != null) {
                  File fileContent = response[0];
                  String filePath = response[1];
                  /*Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        /// TODO: redirect to postpage
                        return Text("");
                        /*return PostTimeline(
                                fileContent: fileContent,
                                filePath: filePath,
                                mediaType: "image",
                              );*/
                      },
                    ),
                        (Route<dynamic> route) => false,
                  );*/
                } else {
                  debugPrint("User cancel uploading");
                }
              },
              child: Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.image,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Image from gallery"),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () async {
                var response =
                await pickMedia(ImageSource.gallery, MediaType.video);
                if (response != null) {
                  File fileContent = response[0];
                  String filePath = response[1];
                  /*Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        /// TODO: redirect to postpage
                        return Text("");
                        /*return PostTimeline(
                                fileContent: fileContent,
                                filePath: filePath,
                                mediaType: "video",
                              );*/
                      },
                    ),
                        (Route<dynamic> route) => false,
                  );*/
                } else {
                  debugPrint("User cancel uploading");
                }
              },
              child: Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.video_library,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Video from gallery"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
