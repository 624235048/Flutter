import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miniproject/src/config/app_route.dart';
import 'package:miniproject/src/configs/api.dart';
import 'package:miniproject/src/model/dormitory_model.dart';

class DormitoryManagement extends StatefulWidget {

  @override
  _DormitoryManagementState createState() => _DormitoryManagementState();
}

class _DormitoryManagementState extends State<DormitoryManagement> {
  File _image;
  final picker = ImagePicker();

  final _formKey = GlobalKey<FormState>();

  bool _editMode;
  Dormitory dm;

  @override
  void initState() {
    _editMode = false;
    dm = Dormitory();
    super.initState();
  }

  callback(File image){
    _image = image;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(18),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: _buildIdInput(),
                        flex: 1,
                      ),
                      SizedBox(width: 12.0),
                      Flexible(
                        child: _buildNameInput(),
                        flex: 2,
                      ),
                      SizedBox(height: 12.0),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  _buildLimitedroomInput(),
                  SizedBox(height: 12.0),
                  _buildFacilitiesInput(),
                  SizedBox(height: 12.0),
                  _buildTypenput(),
                  SizedBox(height: 12.0),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: _buildPriceInput(),
                        flex: 1,
                      ),
                      SizedBox(width: 12.0),
                      Flexible(
                        child: _buildPhoneInput(),
                        flex: 3,
                      ),
                      SizedBox(height: 12.0),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  _buildLocationInput(),
                  SizedBox(height: 12.0),
                  _buildDetailInput(),
                  SizedBox(height: 12.0),
                  _buildImageInput(),
                  SizedBox(height: 12.0),
                  ProductImage(callback, image: dm.dmImage),
                ],
              ),
            ),
          ),
        )
    );
  }

  InputDecoration inputStyle({String label}) => InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.indigo,
        width: 2,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black12,
      ),
    ),
    labelText: label,
  );

  TextFormField _buildIdInput() => TextFormField(
    enabled: !_editMode ,
    initialValue: dm.dmId ?? "",
    decoration: inputStyle(label: "id"),
    onSaved: (String value) {
      print(value);
     dm.dmId = value;
    },
  );

  TextFormField _buildNameInput() => TextFormField(
    initialValue: dm.dmName ?? "",
    decoration: inputStyle(label: "name"),
    onSaved: (String value) {
      print(value);
      dm.dmName = value;
    },
  );

  TextFormField _buildPriceInput() => TextFormField(
    initialValue: dm.dmPrice ?? "",
    decoration: inputStyle(label: "price"),
    onSaved: (String value) {
      print(value);
      dm.dmPrice = value;
    },
  );

  TextFormField _buildLocationInput() => TextFormField(
    initialValue:dm.dmLocation?? "",
    decoration: inputStyle(label: "location"),
    onSaved: (String value) {
      print(value);
      dm.dmLocation = value;
    },
  );

  TextFormField _buildPhoneInput() => TextFormField(
    initialValue:dm.dmPhone ?? "",
    decoration: inputStyle(label: "phone"),
    onSaved: (String value) {
      print(value);
      dm.dmPhone = value;
    },
  );

  TextFormField _buildLimitedroomInput() => TextFormField(
    initialValue: dm.dmLimitedroom ?? "",
    decoration: inputStyle(label: "Limitedroom"),
    onSaved: (String value) {
      print(value);
      dm.dmLimitedroom = value;
    },
  );

  TextFormField _buildFacilitiesInput() => TextFormField(
    initialValue: dm.dmFacilities ?? "",
    decoration: inputStyle(label: "facilities"),
    onSaved: (String value) {
      print(value);
      dm.dmFacilities = value;
    },
  );

  TextFormField _buildTypenput() => TextFormField(
    initialValue: dm.dmType ?? "",
    decoration: inputStyle(label: "type"),
    onSaved: (String value) {
      print(value);
     dm.dmType = value;
    },
  );

  TextFormField _buildDetailInput() => TextFormField(
    initialValue:dm.dmDetail ?? "",
    decoration: inputStyle(label: "detail"),
    onSaved: (String value) {
      print(value);
      dm.dmDetail = value;
    },
  );

  TextFormField _buildImageInput() => TextFormField(
    initialValue: dm.dmImage ?? "",
    decoration: inputStyle(label: "image"),
    onSaved: (String value) {
      print(value);
      dm.dmImage = value;
    },
  );

  AppBar _buildAppBar() => AppBar(
    centerTitle: true,
    title: Text('Add Dormitory'),
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
      //onPressed: () => Navigator.of(context).pop(),
      onPressed: () {
        Navigator.pushNamed(context, AppRoute.DormitoryRoute);
      },
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.check, color: Colors.grey),
        //onPressed: () => Navigator.of(context).pop(),
        onPressed: () {
          Navigator.pushNamed(context, AppRoute.DormitoryRoute);
        },
      ),
    ],
  );
}//end class

class ProductImage extends StatefulWidget {
  final Function callBack;
  final String image;

  const ProductImage(this.callBack, {Key key, @required this.image})
      : super(key: key);

  @override
  _ProductImageState createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  File _imageFile;
  String _image;
  final _picker = ImagePicker();

  @override
  void initState() {
    _image = widget.image;
    super.initState();
  }

  @override
  void dispose() {
    _imageFile?.delete();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildPickerImage(),
          _buildPreviewImage(),
        ],
      ),
    );
  }

  dynamic _buildPreviewImage() {
    if ((_image == null || _image.isEmpty) && _imageFile == null) {
      return SizedBox();
    }

    final container = (Widget child) => Container(
      color: Colors.grey[100],
      margin: EdgeInsets.only(top: 4),
      alignment: Alignment.center,
      height: 350,
      child: child,
    );

    return _image != null
        ? container(Image.network('${API.DORMITORY_IMAGE}/$_image'))
        : Stack(
      children: [
        container(Image.file(_imageFile)),
        _buildDeleteImageButton(),
      ],
    );
  }

  OutlinedButton _buildPickerImage() => OutlinedButton.icon(
    icon: Icon(Icons.image),
    label: Text('image'),
    onPressed: () {
      _modalPickerImage();
    },
  );

  void _modalPickerImage() {
    final buildListTile =
        (IconData icon, String title, ImageSource source) => ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.of(context).pop();
        _pickImage(source);
      },
    );

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buildListTile(
                Icons.photo_camera,
                "Take a picture from camera",
                ImageSource.camera,
              ),
              buildListTile(
                Icons.photo_library,
                "Choose from photo library",
                ImageSource.gallery,
              ),
            ],
          ),
        );
      },
    );
  }

  void _pickImage(ImageSource source) {
    _picker
        .getImage(
      source: source,
      imageQuality: 70,
      maxHeight: 500,
      maxWidth: 500,
    )
        .then((file) {
      if (file != null) {
        setState(() {
          _imageFile = File(file.path);
          _image = null;
          widget.callBack(_imageFile);
        });
      }
    }).catchError((error) {
      //todo
    });
  }


  Positioned _buildDeleteImageButton() => Positioned(
    right: 0,
    child: IconButton(
      onPressed: () {
        setState(() {
          _imageFile = null;
          widget.callBack(null);
        });
      },
      icon: Icon(
        Icons.clear,
        color: Colors.black54,
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    ),
  );
}