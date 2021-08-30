import 'package:flutter/material.dart';



void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String info = "Informe seus dados";
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  Widget buildTextField(String label, TextEditingController c){
    return TextField(
              decoration: InputDecoration(
                labelText: label, labelStyle: TextStyle(color: Colors.purple, fontSize: 20.0),
                border: OutlineInputBorder()
              ),
              style: TextStyle(color: Colors.purple, fontSize: 25.0),
              keyboardType: TextInputType.number,
              controller: c,
            );
  }


   
  void _resetFields(){
    setState(() {
      weightController.text = "";
      heightController.text = "";
      info = "Informe seus dados";
      
    });
  }

  void _caculateImc(){
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;
    double imc = weight/(height*height);
      setState(() {
        if(imc < 17){
      info = "Peso muito abaixo da média (${imc.toStringAsPrecision(4)})";
      }else if(imc >= 17 && imc <=18.49){
      info = "Peso abaixo da média (${imc.toStringAsPrecision(4)})";
     }else if(imc >= 18.5 && imc <= 24.99){
     info = "Peso ideal (${imc.toStringAsPrecision(4)})";
     }else if(imc >= 25 && imc <= 29.99){
      info = "Peso a cima (${imc.toStringAsPrecision(4)})";
      }else if(imc >= 30 && imc <= 34.99){
      info = "Obsedidade I (${imc.toStringAsPrecision(4)})";
      }else if(imc >= 35 && imc <= 39.99){
      info = "Obsedidade II (${imc.toStringAsPrecision(4)})";
      }else if(imc > 40){
      info = "Obsedidade III (${imc.toStringAsPrecision(4)})";
      }
        
      });

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Calculadora IMC"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(onPressed: (){
            _resetFields();
          }, icon: Icon(Icons.refresh))
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person_outline, size: 170.0, color: Colors.purple,),
            buildTextField("Peso", weightController),
            Divider(),
            buildTextField("Altura", heightController),
            Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  child: Text("Verificar",style: TextStyle(color:Colors.white, fontSize: 25.0),),
                  onPressed: (){
                    _caculateImc();
                  },
                  color: Colors.purple,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Text(info, style: TextStyle(color: Colors.purple, fontSize: 25.0),
              textAlign: TextAlign.center,),
            )   
          ],
        ),
      ),
    );
  }
}