import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'my_profile_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Map Page'),
      ),
      body: Center(
        child: MapSample(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.white,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.maps_ugc, size: 40, color: Color(0xffF7B327)),
                onPressed: () {
                  // 새로고침 기능 수행
                  // Stateless 위젯에서는 상태를 변경할 수 없으므로 해당 기능은 제거됩니다.
                },
              ),
              IconButton(
                icon: Icon(Icons.camera_alt, size: 40, color: Colors.grey),
                onPressed: () async {
                  final ImagePicker _picker = ImagePicker();
                  await _picker.pickImage(source: ImageSource.camera);
                  // 여기서 카메라 열기 및 사진 찍기 기능 구현
                },
              ),
              IconButton(
                icon: Icon(Icons.favorite, size: 40, color: Colors.grey),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyProfilePage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  GoogleMapController? mapController; // Initialize as nullable
  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
    );
  }
}
