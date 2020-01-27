import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera And Gallery"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Center(
          child: _image == null? Text("No Image Available"): Image.file(_image),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_a_photo,
        ),
        onPressed: (){_onpressflottingbutton();},
        tooltip: "Open Camera/Gallery",
      ),
    );
  }

  Future <void> _onpressflottingbutton(){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(),
          backgroundColor: Colors.blue,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  onTap: camerImage,
                  child: Text("Take From Camera",
                    style: TextStyle(fontSize: 20.0,color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                GestureDetector(
                  onTap: galleryImage,
                  child: Text("Select From Gallery",
                    style: TextStyle(fontSize: 20.0,color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
  Future camerImage() async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image =image;
    });
  }
  Future galleryImage() async{
    var pitcher = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pitcher;
    });
  }
}