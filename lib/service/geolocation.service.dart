import 'package:geolocator/geolocator.dart' show Geolocator, LocationPermission, Position;


abstract class GeolocatorServiceInterface{
  Future<bool> _enableService();
  Future<void> _requestPermission();
  bool isPermissionEnabled();
  Future<Position> getPosition();
  Future<bool> start();
}

class GeolocatorService implements GeolocatorServiceInterface {

  bool _serviceEnabled = false;
  late LocationPermission _permission = LocationPermission.denied;
  
  @override
  Future<bool> _enableService () async{
    _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!_serviceEnabled){
      return Future.error("O serviço de geolocalização não está ativo");
    }
    return Future.sync(() => true);    
  }

  @override
  Future<void> _requestPermission() async{
    _permission = await Geolocator.checkPermission();
    if(_permission == LocationPermission.denied){
      _permission = await Geolocator.requestPermission();
    }
    return Future.sync(() => null); 
  }

  @override
  Future<Position> getPosition() async {
    return await Geolocator.getCurrentPosition();
  }

  @override
  bool isPermissionEnabled() {
      if(_permission == LocationPermission.denied || _permission == LocationPermission.deniedForever){
      return false;
    }
      return true;
  }

  @override
  Future<bool> start() async{
    bool enabled = await _enableService();
    if(enabled){
      await _requestPermission();
      return Future.sync(() => true);
    }
    return Future.sync(() => false);
  }

}