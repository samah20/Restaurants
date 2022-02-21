import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:restaurants/firestore/models/item_details.dart';
import 'package:restaurants/firestore/providers/app_provider.dart';
import 'package:restaurants/firestore/ui/widgets/custom_button.dart';
import 'package:restaurants/firestore/ui/widgets/custom_testfield.dart';
import 'package:restaurants/firestore/ui/widgets/dot_border.dart';
import 'package:restaurants/firestore/ui/widgets/page_top_container.dart';
import 'package:sizer/sizer.dart';

class AddNewProduct extends StatefulWidget {
  bool isForEdit;
  String productId;

  AddNewProduct({this.isForEdit = false, this.productId});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  List<XFile> selectedPics = [];
  XFile FItem;
  XFile SItem;
  final ImagePicker _picker = ImagePicker();
  bool isEmpty = true;
  ItemDetails itemDetails;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('New Product Screen'),
      ),
      body: Consumer<AppProvider>(builder: (context, provider, x) {
        return Container(
            margin: EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (selectedPics == null || selectedPics.isEmpty)
                    SizedBox(
                      height: 15.h,
                      width: 40.w,
                      child: GestureDetector(
                        onTap: () {
                          selectImages();
                        },
                        child: DotBorder(
                          name: selectedPics.isNotEmpty
                              ? 'وضع المزيد'
                              : 'الاستوديو',
                          icon: 'assets/images/gallery.png',
                          isBig: true,
                        ),
                      ),
                    ),
                  if (selectedPics.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PageTopContainer(
                          text: 'الصور من الاستوديو',
                          height: 7.h,
                          color: Colors.black,
                          padding:
                              EdgeInsets.only(top: 5.h, right: 5.w, left: 9.w),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 1.0, bottom: 16),
                                child: SizedBox(
                                  height: selectedPics.length > 2 ? 25.h : 20.h,
                                  width: double.infinity,
                                  child: GridView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: selectedPics.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 1,
                                              //  mainAxisExtent: 1,
                                              mainAxisSpacing: 2),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Center(
                                            child: Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5.0),
                                              child: Container(
                                                width: 50.w,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      spreadRadius: 3,
                                                      blurRadius: 10,
                                                      offset: Offset(2,
                                                          3), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.file(
                                                      File(selectedPics[index]
                                                          .path),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 8,
                                              left: 4,
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    selectedPics
                                                        .removeAt(index);
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(Icons.cancel),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ));
                                      }),
                                ),
                              ),
                              Positioned(
                                  bottom: 5,
                                  left: 8,
                                  child: GestureDetector(
                                    onTap: () {
                                      print("clicked");
                                      selectImages();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          //  color: kPrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      height: 40,
                                      width: 40,
                                      child:
                                          Icon(Icons.add, color: Colors.white),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),

                  SizedBox(
                    height: 15,
                  ),
                  CustomTextfield(
                    controller: provider.nameController,
                    label: 'Name',
                  ),
                  CustomTextfield(
                    controller: provider.statusController,
                    label: 'status',
                  ),
                  CustomTextfield(
                    controller: provider.titleController,
                    label: 'Title',
                  ),
                  CustomTextfield(
                    controller: provider.priceController,
                    textInputType: TextInputType.number,
                    label: 'Price',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // Expanded(

                  //   child: ListView(
                  //     shrinkWrap: true,
                  //     scrollDirection: Axis.horizontal,
                  //     children: [
                  //       Container(
                  //         width: 200,
                  //         height: 60,
                  //         margin: EdgeInsets.all(10),
                  //         child: GestureDetector(
                  //           onTap: () {
                  //             provider.loopOnFilesList();
                  //           },
                  //           child: provider.file == null
                  //               ? provider.imageUrl == null
                  //                   ? CircleAvatar(
                  //                       radius: 90,
                  //                     )
                  //                   : CircleAvatar(
                  //                       radius: 90,
                  //                       backgroundImage:
                  //                           NetworkImage(provider.imageUrl))
                  //               : CircleAvatar(
                  //                   radius: 90,
                  //                   backgroundImage: FileImage(provider.file)),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),

                  CustomTextfield(
                    controller: provider.locationController,
                    textInputType: TextInputType.text,
                    label: 'location',
                  ),
                  GestureDetector(
                    onTap: () {
                      // provider.addAllItemDetals();
                      singleSelectImages(SItem);
                    },
                    child: SItem == null
                        ? CircleAvatar(
                            radius: 90,
                          )
                        : CircleAvatar(
                            radius: 90,
                            backgroundImage: FileImage(File(SItem.path))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextfield(
                    controller: provider.nameController,
                    label: 'Title Image',
                  ),
                  widget.isForEdit
                      ? CustomButton(
                          title: 'Edit Product',
                          function: () {
                            provider.editProduct(this.widget.productId);
                          },
                        )
                      : CustomButton(
                          title: 'Add Product',
                          function: () {
                            provider.items.add(ItemDetails(
                                imageFile: SItem,
                                title: provider.nameController.text,
                                imageUrl: ""));
                            provider.addAllItemDetals();

                            // provider.addProduct();
                          },
                        )
                ],
              ),
            ));
      }),
    );
  }

  void selectImages() async {
    print("select clicked");

    selectedPics = await _picker.pickMultiImage();

    if (selectedPics != null) {
      print(selectedPics);
      setState(() {
        if (selectedPics.isNotEmpty) {
          isEmpty = false;
        }
      });
    }
  }

  void singleSelectImages(XFile item) async {
    print("select clicked");

    SItem = await _picker.pickImage(source: ImageSource.gallery);

    if (SItem != null) {
      print(SItem);
      setState(() {});
    }
  }
}
