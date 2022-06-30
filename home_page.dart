import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube/detail_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  List dataHouse = [
    {
      "image":"https://image.architonic.com/prj2-3/20006586/dia-dittel-architekten-modern-house-architonic-dittelarchitekten-wohnhaus-hofgut-04-08-arcit18.jpg",
      "price":"\$2.999",
      "name":"Dia Dittel Modern House",
      "place":"Melbourne, Australia",
      "beds":"4",
      "baths":"6",
      "size":"500",
    },
    {
      "image":"http://cdn.home-designing.com/wp-content/uploads/2017/05/wood-white-and-charcoal-modern-exterior-paint-themes.jpg",
      "price":"\$700",
      "name":"Wood White Modern House",
      "place":"Perth, Australia",
      "beds":"6",
      "baths":"3",
      "size":"240",
    },
    {
      "image":"https://www.architecturalrecord.com/ext/resources/Issues/2021/02-February/Golden-Valley-Midcentury-Modern-House-01-B.jpg?height=635&t=1611944303&width=1200",
      "price":"\$450",
      "name":"Golden Valley House",
      "place":"Sydney, Australia",
      "beds":"2",
      "baths":"5",
      "size":"150",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final pages = [
      Container(
        padding: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              //Top Current Location, Menu, Settings
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade200)
                    ),
                    child: Center(
                      child: Icon(Icons.menu),
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Current Location",style: GoogleFonts.manrope(color: Colors.grey.shade400),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on_sharp,color: Colors.blue,size: 15,),
                            SizedBox(width: 5,),
                            Text("Melbourne, Aus",style: GoogleFonts.manrope(fontWeight: FontWeight.w600),)
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade200)
                    ),
                    child: Center(
                      child: FaIcon(FontAwesomeIcons.sliders),
                    ),
                  ),
                ],
              ),
              //Search
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.grey.shade500,
                  hintText: "Search for dream house",
                  hintStyle: GoogleFonts.manrope(color: Colors.grey.shade500),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none
                  ),
                  enabledBorder:  OutlineInputBorder(
                      borderSide: BorderSide.none
                  ),
                ),
              ),
              //Banner
              Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("GET YOUR 10% \nCASHBACK",style: GoogleFonts.montserrat(fontWeight: FontWeight.w700,color: Colors.white),textAlign: TextAlign.start,),
                        Container(
                          margin: EdgeInsets.only(left: 30),
                            child: Text("*Expired 20 Dec 2022",style: GoogleFonts.montserrat(color: Colors.white),))
                      ],
                    ),
                    SizedBox(width: 20,),
                    Image.network("https://www.pngmart.com/files/16/Modern-House-PNG-Clipart.png")
                  ],
                ),
              ),
              SizedBox(height: 20,),
              //List
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: dataHouse.length,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(dataHouse[index])));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 220,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage("${dataHouse[index]['image']}"),
                                  fit: BoxFit.cover
                                )
                              ),
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: 200,
                                  bottom: 100,
                                  left: 10,
                                  top: 10
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("${dataHouse[index]['price']}",style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w700),),
                                    Text("/month",style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w400),),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Text("${dataHouse[index]['name']}",style: GoogleFonts.montserrat(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 16),)
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined,size: 15,color: Colors.grey.shade500,),
                                SizedBox(width: 5,),
                                Text("${dataHouse[index]['place']}",style: GoogleFonts.montserrat(fontWeight: FontWeight.w500,color: Colors.grey.shade500,fontSize: 16),)
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
      Container(child: Center(
        child: Text("Search"),
      ),),
      Container(child: Center(
        child: Text("Liked"),
      ),),
      Container(child: Center(
        child: Text("Profile"),
      ),),
    ];
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            pages[_currentIndex],
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment(0.0, 1.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: BottomNavigationBar(
                    showUnselectedLabels: false,
                    showSelectedLabels: false,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.grey,
                    selectedFontSize: 0,
                    unselectedFontSize: 0,
                    backgroundColor: Colors.black,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: _currentIndex,
                    onTap: (index){
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    items: [
                      BottomNavigationBarItem(
                          icon: FaIcon(FontAwesomeIcons.home),
                          label: "",
                          backgroundColor: Colors.black,
                      ),
                      BottomNavigationBarItem(
                        icon: FaIcon(FontAwesomeIcons.search),
                        label: "",
                        backgroundColor: Colors.black,
                      ),
                      BottomNavigationBarItem(
                        label: "",
                        backgroundColor: Colors.black,
                        icon: FaIcon(FontAwesomeIcons.solidHeart)
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: "",
                        backgroundColor: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
