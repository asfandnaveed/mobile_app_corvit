import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFD8D7DB),
      resizeToAvoidBottomInset: false,
      body: ShoppingCartSTF(),
    );
  }
}


class ShoppingCartSTF extends StatefulWidget {
  const ShoppingCartSTF({Key? key}) : super(key: key);

  @override
  State<ShoppingCartSTF> createState() => _ShoppingCartSTFState();
}

class _ShoppingCartSTFState extends State<ShoppingCartSTF> {

  late double width;
  late double height;

  List<String> productNameList=[
    'Facial Cleanser',
    'Face Wash',
    'Toner',
    'Hair Serum',
  ];


  List<String> productPriceList=[
    '19.98',
    '3.78',
    '15.67',
    '12.87',
  ];
  List<String> productSizeList=[
    'Size: 7.60 fl oz/225ml',
    'Size: 9.31 fl oz/400ml',
    'Size: 3.45 fl oz/55ml',
    'Size: 4.76 fl oz/900ml',
  ];
  List<String> productImageList=[
    'assets/images/facial_product.png',
    'assets/images/facial_product.png',
    'assets/images/facial_product.png',
    'assets/images/facial_product.png',
  ];
  List<int> productCartCountList=[
    1,
    1,
    1,
    1

  ];
  double sub=0;
  String baseUrl="https://prototype.analogenterprises.com/corvit/";

  double shipping = 7.24;

  @override
  void initState(){
    super.initState();
    getCartData();
  }

  void getCartData() async{

    String url = "https://prototype.analogenterprises.com/corvit/getCartProducts.php";

    var result =await http.get(Uri.parse(url));

    var json = jsonDecode(result.body);

    print(json[3]["productName"]);

    productNameList.clear();
    productPriceList.clear();
    productSizeList.clear();
    productImageList.clear();
    productCartCountList.clear();

    for(int i=0 ; i<json.length ;i++){

      productNameList.add(json[i]["productName"]);
      productPriceList.add(json[i]["productPrice"]);
      productSizeList.add(json[i]["productSize"]);
      productImageList.add(json[i]["productImage"]);
      productCartCountList.add(1);

      setState((){
        print("data Updated");
      });

    }

  }

  String getSubTotal(){

    sub =0;

    for(int i=0; i< productPriceList.length ; i++){

      double price = double.parse(productPriceList[i]);
      double cart = productCartCountList[i].toDouble();
      sub += (price * cart);

    }
    return sub.toStringAsFixed(2);

  }



  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Container(
          child: Column(
            children: [
              ///Top Bar
              Container(
                margin: EdgeInsets.only(top: height*0.03,left: width*0.035,right: width*0.035),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Icon(Icons.arrow_back_ios_new_outlined),
                    ),
                    Container(
                      child: const Text(
                          'Shopping Bag',
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 17,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    Container(
                      child: Stack(
                        children: [
                          Container(
                            width: width*0.11,
                            height: width*0.11,
                            child: Card(
                              elevation: 6.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Icon(Icons.shopping_bag),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: width*0.07),
                            width: width*0.045,
                            height: width*0.045,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Text(
                              '3',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,

                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// Cart Items
              Container(
                height: height*0.42,
                width: width,
                margin: EdgeInsets.only(top: height*0.025),
                child: ListView.builder(
                  itemCount: productNameList.length,
                  itemBuilder: (BuildContext context, index){
                    return Container(
                      margin: EdgeInsets.only(left: width*0.05,top: height*0.03),
                      child: Row(
                        children: [
                          ///Image
                          Container(
                            width: width*0.2,
                            height: width*0.2,
                            child: Card(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(width*0.015),
                                child: Image.network(
                                  baseUrl+productImageList[index],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: width*0.35,
                            margin: EdgeInsets.only(left: width*0.04),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    productNameList[index],
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    productSizeList[index],
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12
                                    ),
                                  ),
                                ),
                                Container(
                                  child:Text(
                                    '\$'+productPriceList[index],
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: height*0.06,left: width*0.06),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                   if(productCartCountList[index] >1){

                                     setState((){
                                       productCartCountList[index]--;
                                     });
                                   }
                                  },
                                  child: Container(
                                    width: width*0.065,
                                    height: width*0.065,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      border: Border.all(
                                          width: 2.0
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.remove_rounded,
                                      size: width*0.05,

                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: width*0.02),
                                  child: Text(
                                    productCartCountList[index].toString(),
                                    style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){


                                    setState((){
                                      productCartCountList[index]++;
                                    });
                                  },
                                  child: Container(
                                    width: width*0.085,
                                    height: width*0.085,
                                    child: Card(
                                      color: Colors.black,
                                      elevation: 7.0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25.0)
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),


                        ],
                      ),
                    );
                  },
                ),
              ),

              /// Cupon Area
              Container(
                width: width*0.8,
                height: height*0.08,

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: Row(
                  children: [
                    Container(
                      width: width*0.47,
                      margin: EdgeInsets.only(left: width*0.04),
                      child: TextField(
                        autofocus: false,
                        style: TextStyle(
                          fontFamily: 'poppins',
                        ),
                        decoration: InputDecoration(
                          hintText: 'Promo Code',
                          helperStyle: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 12,
                            color: Colors.grey.shade400
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      height: height*0.053,
                      width: width*0.24,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)
                          ),
                        ),
                        onPressed: (){},
                        child: Text(
                          'Apply',
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              ///SubTotal Area
              Container(
                margin: EdgeInsets.only(left: width*0.1,right: width*0.1,top: height*0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Subtotal',
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            '\$'+getSubTotal(),
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '  USD',
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.shade500
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: height*0.002,
                width: width*0.8,
                color: Colors.white,
                margin: EdgeInsets.only(top: height*0.014),
              ),

              ///Shipping Total Area
              Container(
                margin: EdgeInsets.only(left: width*0.1,right: width*0.1,top: height*0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Shiopping',
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            '\$'+shipping.toString(),
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '  USD',
                            style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.shade500
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: height*0.002,
                width: width*0.8,
                color: Colors.white,
                margin: EdgeInsets.only(top: height*0.014),
              ),

              ///Total Area
              Container(
                margin: EdgeInsets.only(left: width*0.1,right: width*0.1,top: height*0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Bag Total',
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: width*0.02),
                          child: Text(
                            '('+(productNameList.length).toString()+' items)  ',
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '\$'+(sub+shipping).toString(),
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '  USD',
                            style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.shade500
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// Checkout Area
              Container(
                width: width*0.8,
                height: height*0.07,
                margin: EdgeInsets.only(top: height*0.03),
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    elevation: 6.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Proceed To Checkout',
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
    );
  }
}

