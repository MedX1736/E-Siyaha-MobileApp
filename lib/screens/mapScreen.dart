import 'package:flutter/material.dart';
import 'package:flutter_e_siyaha/components/CircuitCard.dart';
import 'package:flutter_e_siyaha/const.dart';
import 'package:flutter_e_siyaha/screens/Login_Screen.dart';
import 'package:flutter_svg/svg.dart';
import 'mappage.dart';
import 'package:flutter_e_siyaha/components/Circuit.dart';
import 'package:flutter_e_siyaha/components/CircuitCard.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

class MapScreen extends StatefulWidget {
  static String routename = "/map";
  MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreen();
}

class _MapScreen extends State<MapScreen> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;

  double opacity = 1;
  Widget widgetText = Text('Veuillez choisir le périmètre',
      style: TextStyle(
        color: kColorGrey,
        fontFamily: 'Lexend',
        fontSize: 14,
      ));
  String location = "Search Location"; 

  Color colorContainer = kColorWhite;
  double topContainer = 30;
  BorderRadius borderRadius = BorderRadius.circular(30);

  EdgeInsets edgeInsetMargin =
      EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25);
GoogleMapController? mapController;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              //Map
              Positioned.fill(child: MapPage()),
              //TextField
              Positioned(
                  top: topContainer,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 25, right: 25),
                    margin: edgeInsetMargin,
                    decoration: BoxDecoration(
                        color: colorContainer,
                        borderRadius: borderRadius,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 10,
                            offset: Offset.zero,
                          )
                        ]),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            child: SvgPicture.asset('assets/SVGS/menu.svg'),
                          ),
                          InkWell(
                            onTap: () async {  
                        var place = await PlacesAutocomplete.show(
                          context: context,
                          apiKey: googleMapApiKey,
                          mode: Mode.overlay,
                          types: [],
                          strictbounds: false,
                          components: [Component(Component.country, 'np')],
                                      //google_map_webservice package
                          onError: (err){
                             print(err);
                          }
                      );

                   if(place != null){
                        setState(() {
                          location = place.description.toString();
                          
                        });

                       //form google_maps_webservice package
                       final plist = GoogleMapsPlaces(apiKey:googleMapApiKey,
                              apiHeaders: await GoogleApiHeaders().getHeaders(),
                                        //from google_api_headers package
                        );
                        String placeid = place.placeId ?? "0";
                        final detail = await plist.getDetailsByPlaceId(placeid);
                        final geometry = detail.result.geometry!;
                        final lat = geometry.location.lat;
                        final lang = geometry.location.lng;
                        var newlatlang = LatLng(lat, lang);
                        

                        //move map camera to selected place with animation
                        mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: newlatlang, zoom: 17)));
                   }
                            },
                            child: Expanded(
                                child: AnimatedSwitcher(
                              duration: const Duration(seconds: 1),
                              child: widgetText,
                            )),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            child: SvgPicture.asset('assets/SVGS/user.svg'),
                          ),
                        ]),
                  )),
              //Cards

              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: kColorLavender,
                  ),
                  child: Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 8,),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('Circuits Prédéfinis',
                            textAlign: TextAlign.left, 
                            style: TextStyle(
                              color: kColorPurple, 
                              fontSize: 18,
                              fontFamily: 'Lexend',
                              fontWeight: FontWeight.bold
                            ),
                            ),
                          ),
                        ), 
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('Préferences', 
                            style: TextStyle(
                              color: kColorOrange, 
                              fontSize: 14,
                              fontFamily: 'Lexend',
                              fontWeight: FontWeight.bold
                            ),
                            ),
                          ),
                        ), 
                       Container(
                         height: 50,
                         child: ListView.builder(
                                  itemCount: circuitList.length + 4,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemBuilder: (context, index) { 
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        isExpanded: true,
                                        hint: Expanded(
                                              child: Text(
                                                'Pref',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: kColorPurple,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                        items: items
                                            .map((item) => DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold,
                                                      color: kColorPurple,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ))
                                            .toList(),
                                        value: selectedValue,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedValue = value as String;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down
                                        ),
                                        iconSize: 20,
                                        iconEnabledColor: kColorPurple,
                                        iconDisabledColor: kColorGrey,
                                        buttonHeight: 5,
                                        buttonWidth: 100,
                                        buttonPadding:
                                            const EdgeInsets.only(left: 14, right: 14),
                                        buttonDecoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          border: Border.all(
                                            color: kColorPurple,
                                          ),
                                          color: kColorWhite,
                                        ),
                                        buttonElevation: 2,
                                        itemHeight: 40,
                                        itemPadding:
                                            const EdgeInsets.only(left: 14, right: 14),
                                        dropdownMaxHeight: 200,
                                        dropdownWidth: 150,
                                        dropdownPadding: null,
                                        dropdownDecoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(14),
                                          color: kColorWhite,
                                        ),
                                        dropdownElevation: 8,
                                        scrollbarRadius: const Radius.circular(40),
                                        scrollbarThickness: 6,
                                        scrollbarAlwaysShow: true,
                                        offset: const Offset(-20, 0),
                                      ),
                                    ),
                                  );
                                }
                                ),
                       ),
                        
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                              itemCount: circuitList.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemBuilder: (context, index) {
                                var circuit = circuitList[index];
                                return Expanded(
                                  child: InkWell(
                                      onTap: () {},
                                      child: CircuitCard(circuit: circuit,onTapGo: ()=>{
                                        // Navigator.push(context,routes.LoginScreen.routename )
                                      },onTapMore:()=>{},)),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextField2 extends StatelessWidget {
  const TextField2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kColorPurple,
      decoration: const InputDecoration(
        fillColor: Colors.red,
        border: UnderlineInputBorder(),
        labelText: 'Enter your username',
      ),
    );
  }
}
