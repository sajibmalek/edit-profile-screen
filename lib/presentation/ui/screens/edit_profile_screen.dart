import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import '../utility/app_colors.dart';
import '../utility/app_images.dart';
import '../utility/app_texts.dart';
import '../utility/text_style.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}



class _EditProfileScreenState extends State<EditProfileScreen> {
  final _dateOfBirthTEController = TextEditingController();
  late String selectedValue = '';
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    super.dispose();
    _dateOfBirthTEController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bottom_nav_bg_color,
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 300.w,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const BackButton(
                style: ButtonStyle(splashFactory: NoSplash.splashFactory),
                color: AppColor.colorNaturalShade800,
              ),
              // SizedBox(width: 10.w,),
              Text(
                "Edit Profile",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.colorNaturalShade800,
                ),
              ),
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: AppColor.bottom_nav_bg_color,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 108.w,
                          width: 108.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                          child: Container(
                            width: 10.w,
                            height: 10.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SvgPicture.asset(
                                AppImages.home_user,
                                width: 10.w,
                                height: 10.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: AppColor.colorPrimaryShade500),
                          height: 24.w,
                          width: 24.w,
                          child: Center(
                              child: SvgPicture.asset(
                            AppImages.editSVG,
                            width: 16.w,
                            height: 16.w,
                            color: Colors.white,
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                width: 382.w,
                height: 72.h,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 5, right: 10),
                    border: InputBorder.none,
                    prefixIcon: SizedBox(
                      height: 20.r,
                      width: 20.r,
                      //color: Colors.green,
                      child: Center(
                        child: SvgPicture.asset(
                          AppImages.user,
                          height: 20.r,
                          width: 20.r,
                        ),
                      ),
                    ),
                    labelText: AppString.full_name,
                    labelStyle:
                        subHeaderLight(color: AppColor.colorDarkShade600),
                    hintText: "Mahmud Saimon",
                    hintStyle: subHeaderLight(
                      color: AppColor.colorDarkShade200,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColor.colorNaturalShade600,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColor.colorPrimaryShade500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                width: 382.w,
                height: 72.h,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 5, right: 10),
                    border: InputBorder.none,
                    prefixIcon: SizedBox(
                      height: 20.r,
                      width: 20.r,
                      //color: Colors.green,
                      child: Center(
                        child: SvgPicture.asset(
                          AppImages.perfix_email_icon,
                          height: 20.w,
                          width: 20.w,
                        ),
                      ),
                    ),
                    labelText: AppString.yourEmail,
                    labelStyle:
                        subHeaderLight(color: AppColor.colorDarkShade600),
                    hintText: "user@website.com",
                    hintStyle: subHeaderLight(
                      color: AppColor.colorDarkShade200,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColor.colorNaturalShade600,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColor.colorPrimaryShade500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                width: 382.w,
                height: 72.h,
                child: TextFormField(
                  controller: TextEditingController(text: selectedValue),
                  readOnly: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    prefixIcon: SizedBox(
                      height: 20.r,
                      width: 20.r,
                      //color: Colors.green,
                      child: Center(
                        child: SizedBox(
                          child: SvgPicture.asset(
                            AppImages.gender_icon,
                            height: 20.w,
                            width: 20.w,
                          ),
                        ),
                      ),
                    ),
                    suffixIcon: Theme(
                      data: Theme.of(context).copyWith(
                        // <- Here
                        splashColor: Colors.transparent, // <- Here
                        highlightColor: Colors.transparent, // <- Here
                        hoverColor: Colors.transparent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: DropdownButton(
                          focusColor: Colors.transparent,
                          underline: const SizedBox.shrink(),
                          icon: SvgPicture.asset(AppImages.arrowDownSVG),
                          elevation: 0,
                          // autofocus: false,
                          style: TextStyle(
                            fontSize: 16.sp,
                            backgroundColor: Colors.transparent,
                          ),
                          // value: "Male",
                          items: <String>['Male', 'Female', 'Other']
                              .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ),
                              )
                              .toList(),
                          onChanged: (String? value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    labelText: AppString.gender,
                    labelStyle:
                        subHeaderLight(color: AppColor.colorDarkShade600),
                    hintText: "Select one",
                    hintStyle: subHeaderLight(
                      color: AppColor.colorDarkShade200,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColor.colorNaturalShade600,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColor.colorPrimaryShade500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                width: 382.w,
                height: 72.h,
                child: TextFormField(
                  onTap: () {
                    selectDate();
                  },
                  controller: _dateOfBirthTEController,
                  readOnly: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    prefixIcon: SizedBox(
                      height: 20.r,
                      width: 20.r,
                      //color: Colors.green,
                      child: Center(
                        child: SvgPicture.asset(
                          AppImages.calendarSVG,
                          height: 20.w,
                          width: 20.w,
                        ),
                      ),
                    ),
                    labelText: 'Date of Birth',
                    labelStyle:
                        subHeaderLight(color: AppColor.colorDarkShade600),
                    hintText: "10/01/2023",
                    hintStyle: subHeaderLight(
                      color: AppColor.colorDarkShade200,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColor.colorNaturalShade600,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColor.colorPrimaryShade500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                width: 382.w,
                height: 72.h,
                child: TextFormField(
                  obscuringCharacter: '*',
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 5, right: 10),
                    border: InputBorder.none,
                    prefixIcon: SizedBox(
                      height: 20.r,
                      width: 20.r,
                      //color: Colors.green,
                      child: Center(
                        child: SvgPicture.asset(
                          AppImages.lock_iconSVG,
                          height: 20.r,
                          width: 20.r,
                        ),
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: _isPasswordVisible
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        _isPasswordVisible = !_isPasswordVisible;
                        setState(() {});
                      },
                    ),
                    labelText: AppString.password,
                    labelStyle:
                        subHeaderLight(color: AppColor.colorDarkShade600),
                    hintText: "*******",
                    hintStyle: subHeaderLight(
                      color: AppColor.colorDarkShade200,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColor.colorNaturalShade600,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColor.colorPrimaryShade500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                width: 382.w,
                height: 72.h,
                child: TextFormField(
                  obscuringCharacter: '*',
                  obscureText: !_isConfirmPasswordVisible,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    prefixIcon: SizedBox(
                      height: 20.r,
                      width: 20.r,
                      //color: Colors.green,
                      child: Center(
                        child: SvgPicture.asset(
                          AppImages.lock_iconSVG,
                          height: 20.r,
                          width: 20.r,
                        ),
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: _isConfirmPasswordVisible
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                        setState(() {});
                      },
                    ),
                    labelText: AppString.confirm_password,
                    labelStyle:
                        subHeaderLight(color: AppColor.colorDarkShade600),
                    hintText: "*******",
                    hintStyle: subHeaderLight(
                      color: AppColor.colorDarkShade200,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColor.colorNaturalShade600,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColor.colorPrimaryShade500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              TextButton(
                onPressed: () {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => deleteAlert);
                },
                child: Text(
                  "delete account",
                  style: TextStyle(
                      color: AppColor.colorError,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp),
                ),
              ),
              SizedBox(
                height: 28.h,
              ),
              SizedBox(
                width: 382.w,
                height: 56.h,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Save Changes",
                        style: TextStyle(
                          fontSize: 24.sp,
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AlertDialog get deleteAlert {
    return AlertDialog(
        contentPadding: EdgeInsets.zero,
        icon: Align(
            alignment: Alignment.topRight,
            child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  AppImages.cancel_icon,
                  width: 24.w,
                  height: 24.w,
                ))),
        title: Column(
          children: [
            Text(
              'Account Deletion',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text('Are you sure you want to Delete your Travelo Account?',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                )),
          ],
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Get.back();
            },
            child: FittedBox(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 32.0, right: 32, bottom: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      child: Container(
                        width: 151.w,
                        height: 56.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: AppColor.colorPrimaryShade500,
                                width: 1.5)),
                        child: Center(
                            child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.colorPrimaryShade500,
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 16.h,
                    ),
                    FittedBox(
                      child: Container(
                        width: 151.w,
                        height: 56.h,
                        decoration: BoxDecoration(
                            color: AppColor.colorError,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Text(
                          "Delete",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // const SizedBox(height: 32,),
        ]);
  }

  void selectDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      setState(() {
        _dateOfBirthTEController.text =
            formattedDate; //set output date to TextField value.
      });
    } else {}
  }
}
