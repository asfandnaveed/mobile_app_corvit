import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class GeoLocator extends StatelessWidget {
  const GeoLocator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GeoLocatorSTF(),
    );
  }
}


class GeoLocatorSTF extends StatefulWidget {
  const GeoLocatorSTF({Key? key}) : super(key: key);

  @override
  State<GeoLocatorSTF> createState() => _GeoLocatorSTFState();
}

class _GeoLocatorSTFState extends State<GeoLocatorSTF> {

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Center(
          child: Container(
            child: FutureBuilder(
              future: _determinePosition(),
              builder: (BuildContext context , AsyncSnapshot snapshot){

                if(snapshot.connectionState == ConnectionState.done){
                  print(snapshot.data.toString());
                  return Container(
                    child: Text(
                      snapshot.data.toString()
                    ),
                  );
                }else{
                  return Container(
                    child: Text(
                        'Waiting For Data'
                    ),
                  );
                }

              },
            ),
          ),
        ),
      ),
    );
  }
}

