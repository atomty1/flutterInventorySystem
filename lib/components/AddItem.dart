import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:image_picker/image_picker.dart';
class AddItem extends StatelessWidget {
  var img;
  //   List<Map<String, dynamic>> inputs = [
  //   {"key": "name", "value": "", "type": "text"},
  //   {"key": "quantity", "value": "", "type": "number"},
  //   {"key": "price", "value": "", "type": "number"},
  
  // ];
  // File? _storedImage;
  
   
    Future<void> _takePicture() async{
    ImagePicker picker =  ImagePicker();
    var imageFile = await picker.pickImage(source: ImageSource.gallery, maxHeight: 600);
    img = imageFile?.path;
    // setState(() {
    //   _storedImage = File(imageFile?.path);
    // });

  
  }

  _sendToServer() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String url = 'http://localhost:8000/uploadgoods';
    http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers['authorization'] = 'Bearer $token';
    Iterable<dynamic> imagebytes = await img.readAsBytes();
    request.fields['name'] = 'Taiwo';
    List<int>  listData =List<int>.from(imagebytes);
    request.files.add(http.MultipartFile.fromBytes('image', listData ,
        filename:'good.jpg'));
    http.StreamedResponse response = await request.send();
    String serverResponse = await response.stream.bytesToString();

}
  @override
  Widget build(BuildContext context) {
     return Container(
      child: Row(children: [
        TextField(decoration: InputDecoration(labelText:
        "name")),
        TextField(decoration: InputDecoration(labelText:
        "Quantity"),
        keyboardType: TextInputType.number
        ),
        TextField(decoration: InputDecoration(labelText:
        "price"
        ),
        keyboardType: TextInputType.number),
        ElevatedButton(onPressed: _takePicture, 
          child: Text("Upload Image")
        ),
        ElevatedButton(onPressed: _sendToServer, 
          child: Text("Submit")
        ),
        // ...inputs.asMap().entries.map((entry) =>
        // TextField(
        //   onChanged: (val)=>setValue(val, entry.key),
        //   decoration: InputDecoration(
        //     labelText: entry.value['key']),
        //     keyboardType: entry.value['type'],)
        // ),
       
        
      ],),
    );
  }
}