import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'my_map_page.dart';

class MyProfilePage extends StatefulWidget {
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  // 페이지 새로고침을 위한 GlobalKey
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  // 페이지 새로고침 로직을 수행하는 함수
  Future<void> _handleRefresh() async {
    // 여기서 새로고침 로직을 구현
    // 예를 들어 데이터를 다시 불러오거나 원하는 작업을 수행
    await Future.delayed(Duration(seconds: 2)); // 임시 대기 시간

    // 상태를 변경하여 새로고침을 완료
    setState(() {});
  }

  final List<String> _likedPhotos = [
    'assets/Kittens Strike Back.png',
    'assets/Kittens Strike Back (1).png',
    'assets/Kittens Strike Back (2).png',
    'assets/Kittens Strike Back (3).png',
    // 다른 이미지 파일들 추가
  ];

  // final ImagePicker _picker = ImagePicker();
  // XFile? _imageFile;

  // Future<void> _takePicture() async {
  //   final XFile? image = await _picker.pickImage(source: ImageSource.camera);
  //   if (image != null) {
  //     setState(() {
  //       _imageFile = image;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내 프로필'),
      ),
      body: Column(
        children: <Widget>[
          _buildProfileSection(),
          // if (_imageFile != null) // 촬영한 사진이 있으면 보여줌
          //   Image.file(File(_imageFile!.path)),
          Expanded(
            child: _buildLikedPhotosSection(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.white,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.maps_ugc, size: 40, color: Colors.grey),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyMapPage()),
                  );
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
                icon: Icon(Icons.favorite, size: 40, color: Color(0xffF7B327)),
                onPressed: () {
                  // 새로고침 기능 수행
                  _refreshIndicatorKey.currentState?.show();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            // 프로필 사진
            backgroundImage: NetworkImage(
                'https://post-phinf.pstatic.net/MjAyMTAzMzFfMTMg/MDAxNjE3MTgyNDY5OTQ2.7lToiE1uDhnZ60mKOC8ZdK3xe9PVOx2pNdefS_afqdkg.hiWgkZfjEygAmhUuHcpv61eB80v3pOgS8_3ph8bQ_Ywg.JPEG/%EA%BC%AC%EB%A6%AC%EC%95%BC_%281%29.jpg'),
            radius: 30,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('hyang2',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('프로냥택러', style: TextStyle(fontSize: 15)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLikedPhotosSection() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: _likedPhotos.length, // 이미지 목록의 길이
      itemBuilder: (context, index) {
        return Container(
          child: Image.asset(_likedPhotos[index]), // 각 항목마다 다른 이미지 로드
        );
      },
    );
  }
}
