class Circuit{
  late String nomCircuit; 
  late double rate;
  late String? duree; 
  late String? distance;
  late String imageUrl ; 
  Circuit({required this.nomCircuit,required this.rate,this.duree,this.distance,required this.imageUrl});
}

List<Circuit> circuitList = [
  Circuit(nomCircuit: "Jardin Essai" ,rate: 4.3,imageUrl: "123" ),
  Circuit(nomCircuit: "Musée Ain Sefra",rate: 3.2,imageUrl: "123"),
  Circuit(nomCircuit: "El hammat or Idk",rate: 4.5,imageUrl: "123"),
];