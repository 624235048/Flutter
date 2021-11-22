import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miniproject/src/config/app_route.dart';
import 'package:miniproject/src/configs/api.dart';
import 'package:miniproject/src/model/condo_model.dart';




class CondoManagement extends StatefulWidget {

  @override
  _CondoManagementState createState() => _CondoManagementState();
}

class _CondoManagementState extends State<CondoManagement> {
  File _image;
  final picker = ImagePicker();

  final _formKey = GlobalKey<FormState>();

  bool _editMode;
  Condo _condo;

  @override
  void initState() {
    _editMode = false;
    _condo = Condo();
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
                  ProductImage(callback, image: _condo.condoImage),
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
    initialValue: _condo.condoId ?? "",
    decoration: inputStyle(label: "id"),
    onSaved: (String value) {
      print(value);
      _condo.condoId = value;
    },
  );

  TextFormField _buildNameInput() => TextFormField(
    initialValue: _condo.condoName ?? "",
    decoration: inputStyle(label: "name"),
    onSaved: (String value) {
      print(value);
      _condo.condoName = value;
    },
  );

  TextFormField _buildPriceInput() => TextFormField(
    initialValue: _condo.condoPrice ?? "",
    decoration: inputStyle(label: "price"),
    onSaved: (String value) {
      print(value);
      _condo.condoPrice = value;
    },
  );

  TextFormField _buildLocationInput() => TextFormField(
    initialValue: _condo.condoLocation ?? "",
    decoration: inputStyle(label: "location"),
    onSaved: (String value) {
      print(value);
      _condo.condoLocation = value;
    },
  );

  TextFormField _buildPhoneInput() => TextFormField(
    initialValue: _condo.condoPhone ?? "",
    decoration: inputStyle(label: "phone"),
    onSaved: (String value) {
      print(value);
      _condo.condoPhone = value;
    },
  );

  TextFormField _buildLimitedroomInput() => TextFormField(
    initialValue: _condo.condoLimitedroom ?? "",
    decoration: inputStyle(label: "Limitedroom"),
    onSaved: (String value) {
      print(value);
      _condo.condoLimitedroom = value;
    },
  );

  TextFormField _buildFacilitiesInput() => TextFormField(
    initialValue: _condo.condoFacilities ?? "",
    decoration: inputStyle(label: "facilities"),
    onSaved: (String value) {
      print(value);
      _condo.condoFacilities = value;
    },
  );

  TextFormField _buildTypenput() => TextFormField(
    initialValue: _condo.condoType ?? "",
    decoration: inputStyle(label: "type"),
    onSaved: (String value) {
      print(value);
      _condo.condoType = value;
    },
  );

  TextFormField _buildDetailInput() => TextFormField(
    initialValue: _condo.condoDetail ?? "",
    decoration: inputStyle(label: "detail"),
    onSaved: (String value) {
      print(value);
      _condo.condoDetail = value;
    },
  );

  TextFormField _buildImageInput() => TextFormField(
    initialValue: _condo.condoImage ?? "",
    decoration: inputStyle(label: "image"),
    onSaved: (String value) {
      print(value);
      _condo.condoImage = value;
    },
  );

  AppBar _buildAppBar() => AppBar(
    centerTitle: true,
    title: Text('Add Condominium'),
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
      //onPressed: () => Navigator.of(context).pop(),
      onPressed: () {
        Navigator.pushNamed(context, AppRoute.CondoRoute);
      },
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.check, color: Colors.grey),
        //onPressed: () => Navigator.of(context).pop(),
        onPressed: () {
          Navigator.pushNamed(context, AppRoute.CondoRoute);
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
        ? container(Image.network('${API.CONDO_IMAGE}/$_image'))
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