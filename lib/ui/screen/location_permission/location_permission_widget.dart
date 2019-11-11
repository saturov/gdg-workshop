import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationPermissionScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Мы должны получить\nдоступ к геолокации',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                  textAlign: TextAlign.left,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: MaterialButton(
                    color: Colors.blue,
                    onPressed: () => {
                      requestPermission(PermissionGroup.location),
                    },
                    child: Text(
                      'Замечательно',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> requestPermission(PermissionGroup permission) async {
    final List<PermissionGroup> permissions = <PermissionGroup>[permission];
    final Map<PermissionGroup, PermissionStatus> permissionRequestResult =
    await PermissionHandler().requestPermissions(permissions);
    permissionRequestResult.forEach((permissionGroup, permissionStatus) {
      if (permissionStatus != PermissionStatus.granted) {
        return;
      }
    });
    //todo navigate to cities list screen
  }
}