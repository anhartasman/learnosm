import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:learnosm/src/service/ApiService.dart';

class HomeExample extends StatefulWidget {
  const HomeExample({super.key});

  @override
  State<HomeExample> createState() => _HomeExampleState();
}

class _HomeExampleState extends State<HomeExample> {
  late MapController mapController;
  final titikAsal = GeoPoint(latitude: -6.183445, longitude: 106.766983);
  final titikTujuan = GeoPoint(latitude: -6.188178, longitude: 106.783901);
  GeoPoint? lastPosition;

  int currentRoute = -1;

  final markerDriver = const MarkerIcon(
    icon: Icon(
      Icons.motorcycle,
      color: Colors.red,
      size: 80,
    ),
  );
  @override
  void initState() {
    super.initState();
    mapController = MapController(
      initMapWithUserPosition: false,
      initPosition: titikAsal,
    );
  }

  GeoPoint getCurrentPosition() {
    final hasilAPI = ApiService.getRoute(currentRoute);
    currentRoute = hasilAPI.idx;
    return GeoPoint(latitude: hasilAPI.latitude, longitude: hasilAPI.longitude);
  }

  void setDriver() async {
    final currentPosition = getCurrentPosition();
    if (lastPosition != null) {
      await mapController.removeMarker(lastPosition!);
    }
    lastPosition = currentPosition;
    await mapController.addMarker(
      currentPosition,
      markerIcon: markerDriver,
    );
    await mapController.removeLastRoad();

    final roadInfo = await mapController.drawRoad(
      currentPosition,
      titikTujuan,
      roadType: RoadType.car,
      //  intersectPoint : [ GeoPoint(latitude: 47.4361, longitude: 8.6156), GeoPoint(latitude: 47.4481, longitude: 8.6266)],
      roadOption: const RoadOption(
        roadWidth: 10,
        roadColor: Colors.blue,
        zoomInto: true,
      ),
    );

    // print("roadInfo driverRoute Length: ${driverRoute.length}");
    print("roadInfo ${roadInfo.distance}km");
    print("roadInfo ${roadInfo.duration}sec");
    print("roadInfo ${roadInfo.instructions}");

// nembak ke APi per sekian detik
    Future.delayed(const Duration(seconds: 1)).then((value) => setDriver());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Learn OSM"),
      ),
      body: OSMFlutter(
        controller: mapController,
        trackMyPosition: false,
        initZoom: 12,
        minZoomLevel: 8,
        maxZoomLevel: 14,
        stepZoom: 1.0,
        onMapIsReady: (isReady) {
          if (isReady == true) {
            setDriver();
          }
        },
        userLocationMarker: UserLocationMaker(
          personMarker: MarkerIcon(
            icon: Icon(
              Icons.location_history_rounded,
              color: Colors.red,
              size: 48,
            ),
          ),
          directionArrowMarker: MarkerIcon(
            icon: Icon(
              Icons.double_arrow,
              size: 48,
            ),
          ),
        ),
        roadConfiguration: RoadOption(
          roadColor: Colors.yellowAccent,
        ),
        markerOption: MarkerOption(
            defaultMarker: MarkerIcon(
          icon: Icon(
            Icons.person_pin_circle,
            color: Colors.blue,
            size: 56,
          ),
        )),
      ),
    );
  }
}
