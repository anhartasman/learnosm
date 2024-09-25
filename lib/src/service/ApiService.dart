import 'package:learnosm/src/models/ModelGeoPoint.dart';

class ApiService {
  static ModelGeoPoint getRoute(int idx) {
    List<ModelGeoPoint> driverRoute = [
      ModelGeoPoint(latitude: -6.183445, longitude: 106.766983),
      ModelGeoPoint(latitude: -6.182447, longitude: 106.764848),
      ModelGeoPoint(latitude: -6.182447, longitude: 106.764848),
      ModelGeoPoint(latitude: -6.182975, longitude: 106.766221),
      ModelGeoPoint(latitude: -6.183445, longitude: 106.766983),
      ModelGeoPoint(
          latitude: -6.184621127132916, longitude: 106.76827645244671),
      ModelGeoPoint(latitude: -6.185512216109643, longitude: 106.7686049917702),
      ModelGeoPoint(
          latitude: -6.186628062357749, longitude: 106.76862622140794),
      ModelGeoPoint(latitude: -6.18770372731301, longitude: 106.76864006436475),
      ModelGeoPoint(latitude: -6.18874805357724, longitude: 106.76894235175799),
      ModelGeoPoint(latitude: -6.189671886702063, longitude: 106.76957613597),
      ModelGeoPoint(latitude: -6.18952613643995, longitude: 106.77050538540172),
      ModelGeoPoint(
          latitude: -6.189373659192843, longitude: 106.77115270240601),
      ModelGeoPoint(
          latitude: -6.189131489365127, longitude: 106.77187444955338),
      ModelGeoPoint(
          latitude: -6.1889678004355115, longitude: 106.77238192802278),
      ModelGeoPoint(
          latitude: -6.188721145789557, longitude: 106.77300217948425),
      ModelGeoPoint(
          latitude: -6.188366859824726, longitude: 106.77396977175842),
    ];
    var currentRoute = idx;
    if (currentRoute == driverRoute.length - 1) {
      currentRoute = -1;
    }
    currentRoute += 1;
    return driverRoute[currentRoute].copyWith(idx: currentRoute);
  }
}
