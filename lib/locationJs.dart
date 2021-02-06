@JS('navigator.geolocation')
library jslocation;
import "package:js/js.dart";
import '';

@JS('getCurrentPosition') // Accessing method getCurrentPosition
external void getCurrentPosition(Function success(GeolocationPosition pos));

@JS()
@anonymous
class GeolocationCoordinates {
  external double get latitude;
  external double get longitude;
  external double get altitude;
  external double get accuracy;
  external double get altitudeAccuracy;
  external double get heading;
  external double get speed;

  external factory GeolocationCoordinates(
      {double latitude,
        double longitude,
        double altitude,
        double accuracy,
        double altitudeAccuracy,
        double heading,
        double speed});
}

@JS()
@anonymous
class GeolocationPosition {
  external GeolocationCoordinates get coords;

  external factory GeolocationPosition({GeolocationCoordinates
  coords});
}