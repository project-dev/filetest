import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:developer' as developer;

import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('File Test'),
      ),
      body: Center(
        child: IconButton(
            icon: const Icon(Icons.run_circle_outlined, size:128),
            onPressed:() async {
              [
                Permission.storage,
                Permission.photos,
                Permission.videos,
                Permission.audio,
              ].request().then((result) async{
                result.forEach((key, status) {
                  developer.log("${key.toString()} ${status.name}");
                });
                await _writeTextFiles();
                await _writeImageFiles();
              });


/*
              var isSetting = false;
              Map<Permission, PermissionStatus> result = await [
                Permission.storage,
                Permission.photos,
                Permission.videos,
                Permission.audio,
              ].request();
              result.forEach((key, status) {
                developer.log("${key.toString()} ${status.name}");
                switch(status){
                  case PermissionStatus.granted:
                    // 許可
                    break;
                  case PermissionStatus.restricted:
                    // 制限付き
                    break;
                  case PermissionStatus.provisional:
                    // 仮(なんだこれ)
                    break;
                  case PermissionStatus.permanentlyDenied:
                    // 永遠に拒否
                    break;
                  case PermissionStatus.denied:
                    isSetting = true;
                    break;
                  default:
                    break;
                }
              });

              if(isSetting){
                openAppSettings();
              }
              developer.log("-----------------------------------------------------");

              await _writeTextFiles();
              await _writeImageFiles();
 */
            },
          )
        ),
    );
  }

  ///
  Future<void> _writeTextFiles() async{
    try{
      var appDocDir = await getApplicationDocumentsDirectory();
      _fileTextWrite("getApplicationDocumentsDirectory", "${appDocDir.path}/test");
    }catch(e){
      developer.log("", error: e);
    }

    try{
      var appSupDir = await getApplicationSupportDirectory();
      _fileTextWrite("getApplicationSupportDirectory", "${appSupDir.path}/test");
    }catch(e){
      developer.log("", error: e);
    }

    try{
      var dlDir = await getDownloadsDirectory();
      _fileTextWrite("getDownloadsDirectory", "${dlDir!.path}/test");
    }catch(e){
      developer.log("", error: e);
    }

    var extCacheDirs = await getExternalCacheDirectories();
    extCacheDirs?.forEach((path) {
      try{
        _fileTextWrite("getExternalCacheDirectories", "${path.path}/test");
      }catch(e){
        developer.log("", error: e);
      }
    });

    try{
      var extStorageDir = await getExternalStorageDirectory();
      _fileTextWrite("getExternalStorageDirectory", "${extStorageDir!.path}/test");
    }catch(e){
      developer.log("", error: e);
    }

    try{
      var extDirs = await getExternalStorageDirectories(type:StorageDirectory.alarms);
      extDirs?.forEach((dir) {
        _fileTextWrite("getExternalStorageDirectories(type:StorageDirectory.alarms)", "${dir.path}/test");
      });
    }catch(e){
      developer.log("", error: e);
    }

    try{
      var extDirs = await getExternalStorageDirectories(type:StorageDirectory.dcim);
      extDirs?.forEach((dir) {
        _fileTextWrite("getExternalStorageDirectories(type:StorageDirectory.dcim)", "${dir.path}/test");
      });
    }catch(e){
      developer.log("", error: e);
    }

    try{
      var extDirs = await getExternalStorageDirectories(type:StorageDirectory.documents);
      extDirs?.forEach((dir) {
        _fileTextWrite("getExternalStorageDirectories(type:StorageDirectory.documents)", "${dir.path}/test");
      });
    }catch(e){
      developer.log("", error: e);
    }

    try{
      var extDirs = await getExternalStorageDirectories(type:StorageDirectory.downloads);
      extDirs?.forEach((dir) {
        _fileTextWrite("getExternalStorageDirectories(type:StorageDirectory.downloads)", "${dir.path}/test");
      });
    }catch(e){
      developer.log("", error: e);
    }

    try{
      var extDirs = await getExternalStorageDirectories(type:StorageDirectory.movies);
      extDirs?.forEach((dir) {
        _fileTextWrite("getExternalStorageDirectories(type:StorageDirectory.movies)", "${dir.path}/test");
      });
    }catch(e){
      developer.log("", error: e);
    }

    try{
      var extDirs = await getExternalStorageDirectories(type:StorageDirectory.music);
      extDirs?.forEach((dir) {
        _fileTextWrite("getExternalStorageDirectories(type:StorageDirectory.music)", "${dir.path}/test");
      });
    }catch(e){
      developer.log("", error: e);
    }

    try{
      var extDirs = await getExternalStorageDirectories(type:StorageDirectory.notifications);
      extDirs?.forEach((dir) {
        _fileTextWrite("getExternalStorageDirectories(type:StorageDirectory.notifications)", "${dir.path}/test");
      });
    }catch(e){
      developer.log("", error: e);
    }

    try{
      var extDirs = await getExternalStorageDirectories(type:StorageDirectory.pictures);
      extDirs?.forEach((dir) {
        _fileTextWrite("getExternalStorageDirectories(type:StorageDirectory.pictures)", "${dir.path}/test");
      });
    }catch(e){
      developer.log("", error: e);
    }

    try{
      var extDirs = await getExternalStorageDirectories(type:StorageDirectory.podcasts);
      extDirs?.forEach((dir) {
        _fileTextWrite("getExternalStorageDirectories(type:StorageDirectory.podcasts)", "${dir.path}/test");
      });
    }catch(e){
      developer.log("", error: e);
    }

    try{
      var extDirs = await getExternalStorageDirectories(type:StorageDirectory.ringtones);
      extDirs?.forEach((dir) {
        _fileTextWrite("getExternalStorageDirectories(type:StorageDirectory.ringtones)", "${dir.path}/test");
      });
    }catch(e){
      developer.log("", error: e);
    }

    developer.log("----- ▽ExternalPath ------------------------------------------------");
    try{
      String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_ALARMS);
      _fileTextWrite("getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_ALARMS)", "$dir/test");
    }catch(e){
      developer.log("", error: e);
    }
    try{
      String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_AUDIOBOOKS);
      _fileTextWrite("getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_AUDIOBOOKS)", "$dir/test");
    }catch(e){
      developer.log("", error: e);
    }
    try{
      String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DCIM);
      _fileTextWrite("getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DCIM)", "$dir/test");
    }catch(e){
      developer.log("", error: e);
    }
    try{
      String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOCUMENTS);
      _fileTextWrite("getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOCUMENTS)", "$dir/test");
    }catch(e){
      developer.log("", error: e);
    }
    try{
      String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
      _fileTextWrite("getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS)", "$dir/test");
    }catch(e){
      developer.log("", error: e);
    }
    try{
      String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_MOVIES);
      _fileTextWrite("getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_MOVIES)", "$dir/test");
    }catch(e){
      developer.log("", error: e);
    }
    try{
      String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_MUSIC);
      _fileTextWrite("getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_MUSIC)", "$dir/test");
    }catch(e){
      developer.log("", error: e);
    }
    try{
      String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_NOTIFICATIONS);
      _fileTextWrite("getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_NOTIFICATIONS)", "$dir/test");
    }catch(e){
      developer.log("", error: e);
    }
    try{
      String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_PICTURES);
      _fileTextWrite("getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_PICTURES)", "$dir/test");
    }catch(e){
      developer.log("", error: e);
    }
    try{
      String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_PODCASTS);
      _fileTextWrite("getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_PODCASTS)", "$dir/test");
    }catch(e){
      developer.log("", error: e);
    }
    try{
      String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_RINGTONES);
      _fileTextWrite("getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_RINGTONES)", "$dir/test");
    }catch(e){
      developer.log("", error: e);
    }
    try{
      String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_SCREENSHOTS);
      _fileTextWrite("getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_SCREENSHOTS)", "$dir/test");
    }catch(e){
      developer.log("", error: e);
    }

    List<String> extDirs = await ExternalPath.getExternalStorageDirectories();
    for (var path in extDirs) {
      try{
        _fileTextWrite("ExternalPath.getExternalStorageDirectories(", "$path/ExternalPathTest");
      }catch(e){
        developer.log("", error: e);
      }
    }
    developer.log("----- △ExternalPath ------------------------------------------------");

  }



  ///
  Future<void> _writeImageFiles() async{
    try{
      var appDocDir = await getApplicationDocumentsDirectory();
      _fileImageWrite("getApplicationDocumentsDirectory", "${appDocDir.path}/test");
    }catch(e){
      developer.log("", error: e);
    }

    try{
      var appSupDir = await getApplicationSupportDirectory();
      _fileImageWrite("getApplicationSupportDirectory", "${appSupDir.path}/test");
    }catch(e){
      developer.log("", error: e);
    }

    try{
      var dlDir = await getDownloadsDirectory();
      _fileImageWrite("getDownloadsDirectory", "${dlDir!.path}/test");
    }catch(e){
      developer.log("", error: e);
    }

    var extCacheDirs = await getExternalCacheDirectories();
    extCacheDirs?.forEach((path) {
      try{
        _fileImageWrite("getExternalCacheDirectories", "${path.path}/test");
      }catch(e){
        developer.log("", error: e);
      }
    });

    try{
      var extStorageDir = await getExternalStorageDirectory();
      _fileImageWrite("getExternalStorageDirectory", "${extStorageDir!.path}/test");
    }catch(e){
      developer.log("", error: e);
    }

    try{
      var extDirs = await getExternalStorageDirectories(type:StorageDirectory.alarms);
      extDirs?.forEach((dir) {
        _fileImageWrite("getExternalStorageDirectories(type:StorageDirectory.alarms)", "${dir.path}/test");
      });
    }catch(e){
      developer.log("", error: e);
    }

    try{
      var extDirs = await getExternalStorageDirectories(type:StorageDirectory.dcim);
      extDirs?.forEach((dir) {
        _fileImageWrite("getExternalStorageDirectories(type:StorageDirectory.dcim)", "${dir.path}/test");
      });
    }catch(e){
      developer.log("", error: e);
    }

    try{
      var extDirs = await getExternalStorageDirectories(type:StorageDirectory.documents);
      extDirs?.forEach((dir) {
        _fileImageWrite("getExternalStorageDirectories(type:StorageDirectory.documents)", "${dir.path}/test");
      });
    }catch(e){
      developer.log("", error: e);
    }

    try{
      var extDirs = await getExternalStorageDirectories(type:StorageDirectory.downloads);
      extDirs?.forEach((dir) {
        _fileImageWrite("getExternalStorageDirectories(type:StorageDirectory.downloads)", "${dir.path}/test");
      });
    }catch(e){
      developer.log("", error: e);
    }

    try{
      var extDirs = await getExternalStorageDirectories(type:StorageDirectory.movies);
      extDirs?.forEach((dir) {
        _fileImageWrite("getExternalStorageDirectories(type:StorageDirectory.movies)", "${dir.path}/test");
      });
    }catch(e){
      developer.log("", error: e);
    }

    try{
      var extDirs = await getExternalStorageDirectories(type:StorageDirectory.music);
      extDirs?.forEach((dir) {
        _fileImageWrite("getExternalStorageDirectories(type:StorageDirectory.music)", "${dir.path}/test");
      });
    }catch(e){
      developer.log("", error: e);
    }

    try{
      var extDirs = await getExternalStorageDirectories(type:StorageDirectory.notifications);
      extDirs?.forEach((dir) {
        _fileImageWrite("getExternalStorageDirectories(type:StorageDirectory.notifications)", "${dir.path}/test");
      });
    }catch(e){
      developer.log("", error: e);
    }

    try{
      var extDirs = await getExternalStorageDirectories(type:StorageDirectory.pictures);
      extDirs?.forEach((dir) {
        _fileImageWrite("getExternalStorageDirectories(type:StorageDirectory.pictures)", "${dir.path}/test");
      });
    }catch(e){
      developer.log("", error: e);
    }

    try{
      var extDirs = await getExternalStorageDirectories(type:StorageDirectory.podcasts);
      extDirs?.forEach((dir) {
        _fileImageWrite("getExternalStorageDirectories(type:StorageDirectory.podcasts)", "${dir.path}/test");
      });
    }catch(e){
      developer.log("", error: e);
    }

    try{
      var extDirs = await getExternalStorageDirectories(type:StorageDirectory.ringtones);
      extDirs?.forEach((dir) {
        _fileImageWrite("getExternalStorageDirectories(type:StorageDirectory.ringtones)", "${dir.path}/test");
      });
    }catch(e){
      developer.log("", error: e);
    }


    developer.log("----- ▽ExternalPath ------------------------------------------------");
    try{
      String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_ALARMS);
      _fileImageWrite("getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_ALARMS)", "$dir/test");
    }catch(e){
      developer.log("", error: e);
    }
    try{
      String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_AUDIOBOOKS);
      _fileImageWrite("getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_AUDIOBOOKS)", "$dir/test");
    }catch(e){
      developer.log("", error: e);
    }
    try{
      String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DCIM);
      _fileImageWrite("getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DCIM)", "$dir/test");
    }catch(e){
      developer.log("", error: e);
    }
    try{
      String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOCUMENTS);
      _fileImageWrite("getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOCUMENTS)", "$dir/test");
    }catch(e){
      developer.log("", error: e);
    }
    try{
      String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
      _fileImageWrite("getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS)", "$dir/test");
    }catch(e){
      developer.log("", error: e);
    }
    try{
      String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_MOVIES);
      _fileImageWrite("getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_MOVIES)", "$dir/test");
    }catch(e){
      developer.log("", error: e);
    }
    try{
      String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_MUSIC);
      _fileImageWrite("getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_MUSIC)", "$dir/test");
    }catch(e){
      developer.log("", error: e);
    }
    try{
      String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_NOTIFICATIONS);
      _fileImageWrite("getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_NOTIFICATIONS)", "$dir/test");
    }catch(e){
      developer.log("", error: e);
    }
    try{
      String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_PICTURES);
      _fileImageWrite("getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_PICTURES)", "$dir/test");
    }catch(e){
      developer.log("", error: e);
    }
    try{
      String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_PODCASTS);
      _fileImageWrite("getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_PODCASTS)", "$dir/test");
    }catch(e){
      developer.log("", error: e);
    }
    try{
      String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_RINGTONES);
      _fileImageWrite("getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_RINGTONES)", "$dir/test");
    }catch(e){
      developer.log("", error: e);
    }
    try{
      String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_SCREENSHOTS);
      _fileImageWrite("getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_SCREENSHOTS)", "$dir/test");
    }catch(e){
      developer.log("", error: e);
    }

    List<String> extDirs = await ExternalPath.getExternalStorageDirectories();
    for (var path in extDirs) {
      try{
        _fileImageWrite("ExternalPath.getExternalStorageDirectories(", "$path/ExternalPathTest");
      }catch(e){
        developer.log("", error: e);
      }
    }
    developer.log("----- △ExternalPath ------------------------------------------------");

    _writeImageGalleryServer();
  }

  void _fileTextWrite(String methodName, String path){
    File targetPath = File("$path/test.txt");
    var isDelete = true;
    developer.log("-- $methodName --------------------------------------");

    try{
      developer.log("exists check ${targetPath.path}");
      isDelete = targetPath.existsSync();
    }catch(e){
      developer.log("_fileWrite 1 error : ${targetPath.path} : ", error: e);
      return;
    }

    try{
      if(isDelete) {
        developer.log("delete ${targetPath.path}");
        targetPath.deleteSync();
      }
    }catch(e){
      developer.log("_fileWrite 2 error : ${targetPath.path} : ", error: e);
      return;
    }

    try{
        developer.log("create ${targetPath.path}");
        targetPath.createSync(recursive: true);
    }catch(e){
      developer.log("_fileWrite 3 error : ${targetPath.path} : ", error: e);
      return;
    }

    try{
      developer.log("write ${targetPath.path}");
      targetPath.writeAsStringSync("$path : ${DateTime.now()}");
    }catch(e){
      developer.log("_fileWrite 4 error : $targetPath : ", error: e);
      return;
    }
    developer.log(targetPath.readAsStringSync());
    developer.log("-------------------------------------------------------------");
  }

  void _fileImageWrite(String methodName, String path) async{
    ByteData imgBuff = await rootBundle.load('assets/images/waguma03.png');
    Uint8List imgBuffData = Uint8List.view(imgBuff.buffer);
    developer.log("-- $methodName --------------------------------------");

    File targetPath = File("$path/test.png");
    var isDelete = true;

    try{
//      developer.log("exists check ${targetPath.path}");
      isDelete = targetPath.existsSync();
    }catch(e){
      developer.log("_fileWrite 1 error : ${targetPath.path} : ", error: e);
      return;
    }

    try{
      if(isDelete) {
//        developer.log("delete ${targetPath.path}");
        targetPath.deleteSync();
      }
    }catch(e){
      developer.log("_fileWrite 2 error : ${targetPath.path} : ", error: e);
      return;
    }

    try{
//      developer.log("create ${targetPath.path}");
      targetPath.createSync(recursive: true);
    }catch(e){
      developer.log("_fileWrite 3 error : ${targetPath.path} : ", error: e);
      return;
    }

    try{
//      developer.log("write ${targetPath.path}");
      targetPath.writeAsBytesSync(imgBuffData);
    }catch(e){
      developer.log("_fileWrite 4 error : ${targetPath.path} : ", error: e);
      return;
    }

    if(targetPath.existsSync()){
      developer.log("${targetPath.path} exists");

    }else {
      developer.log(targetPath.readAsStringSync());
      developer.log("${targetPath.path} not exists !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    }
    developer.log("-------------------------------------------------------------");
  }

  void _writeImageGalleryServer() async{
    ByteData imgBuff = await rootBundle.load('assets/images/waguma03.png');
    Uint8List imgBuffData = Uint8List.view(imgBuff.buffer);
    var result = await ImageGallerySaver.saveImage(
      imgBuffData,
      name: "test_${DateTime.now()}",
      quality: 80,
      isReturnImagePathOfIOS: true
    );
    developer.log("_writeImageGalleryServer : ${result["isSuccess"]} : ${result["filePath"]}");
  }
}
