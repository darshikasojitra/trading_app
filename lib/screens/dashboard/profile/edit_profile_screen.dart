import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trading_app/widgets/common_widgets/common_button.dart';
import 'package:trading_app/widgets/common_widgets/common_textformfeild.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _fullname = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _phnno = TextEditingController();
  bool _passwordVisible = false;
  XFile? _imagefile;
  PickedFile? pickedFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _takephoto(ImageSource src) async {
    final pickedFile = await _picker.pickImage(source: src);
    setState(() {
      _imagefile = pickedFile;
    });
    Reference ref = FirebaseStorage.instance.ref().child('path');
    await ref.putFile(File(_imagefile!.path));
  }
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  Future<void> _showPassword() async {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 50.h, left: 25.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 36.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.w),
                          border: Border.all(color: Colors.black12)),
                      child:  Center(
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 18.h,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                  ),
                   SizedBox(
                    width: 70.w,
                  ),
                   Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff03314B),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 30.h, bottom: 80.h),
              child: profileimage(_imagefile),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 30, bottom: 80),
            //   child: Stack(
            //     children: [
            //       Container(
            //         height: 80,
            //         width: 80,
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(40),
            //             color: const Color(0xff908FEC)),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.only(left: 57,top: 50),
            //         child: Icon(Icons.camera_alt,size: 30,color: Color(0xff03314B),),
            //       )
            //     ],
            //   ),
            // ),
            Form(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    CommonTextFormFeild(
                      obscureText: false,
                      controller: _fullname,
                      labelText: 'Full Name',
                    ),
                     SizedBox(
                      height: 20.h,
                    ),
                    CommonTextFormFeild(
                      obscureText: false,
                      controller: _email,
                      labelText: 'Email',
                    ),
                     SizedBox(
                      height: 20.h,
                    ),
                    CommonTextFormFeild(
                      obscureText: !_passwordVisible,
                      controller: _password,
                      labelText: 'Password',
                      suffixIcon: GestureDetector(
                          onTap: () => _showPassword(),
                          child: _passwordVisible==true? const Icon(
                            Icons.visibility,
                            color: Color(0xffD3D5DA),
                          ):const Icon(Icons.visibility_off,color: Color(0xffD3D5DA))),
                    ),
                     SizedBox(
                      height: 20.h,
                    ),
                    CommonTextFormFeild(
                      obscureText: false,
                      controller: _phnno,
                      labelText: 'Phone No.',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 24.w, right: 24.w, top: 45.h),
              child: CommonButtons(
                onPressed: () {},
                color: Color(0xff3500D4),
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget profileimage(XFile? imagefile) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 40.w,
          backgroundColor: Colors.transparent,
          backgroundImage: (imagefile) == null
              ? const ExactAssetImage('assets/images/addphoto.png')
              : FileImage(File((imagefile.path).toString())) as ImageProvider,
        ),
        Positioned(
            bottom: 5,
            right: 1,
            left: 62,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    builder: ((builder) => bottomsheet()), context: context);
              },
              child: Icon(
                Icons.photo_camera,
                color: Colors.blue,
                size: 30,
              ),
            ))
      ],
    );
  }

  Widget bottomsheet() {
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
      child: Column(
        children: [
           Text(
            'choose profile photo',
            style: TextStyle(fontSize: 20.sp),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  IconButton(
                      onPressed: () async {
                        await _takephoto(ImageSource.camera);
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.camera,
                        size: 28.h,
                        color: Colors.blue,
                      )),
                  const Text('Camera')
                ],
              ),
              SizedBox(width: 30.w),
              Column(
                children: [
                  IconButton(
                      onPressed: () async {
                        await _takephoto(ImageSource.gallery);
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.image,
                        size: 28.h,
                        color: Colors.blue,
                      )),
                  const Text('Gallery'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

}

