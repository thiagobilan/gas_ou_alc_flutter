import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _resultado = "";

  void _calcular() {
    if (_controllerGasolina.text.isEmpty || _controllerAlcool.text.isEmpty) {
      setState(() {
        _resultado = "Os Campos devem ser preenchido";
      });
      return;
    }
    double precoAlcool = double.tryParse(
        _controllerAlcool.text.replaceAll(",", "."));
    double precoGasolina = double.tryParse(
        _controllerGasolina.text.replaceAll(",", "."));

    if (precoAlcool / precoGasolina >= 0.7) {
      setState(() {
        _resultado = "Melhor abastecer com Gasolina!";
      });
    } else {
      setState(() {
        _resultado = "Melhor abastecer com Alcool";
      });
    }
    _limparCampos();
  }

  void _limparCampos(){
      _controllerAlcool.text = "";
      _controllerGasolina.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Gasolina ou Álcool"),
          backgroundColor: Colors.lightBlueAccent,
          centerTitle: true,
        ),
        body: Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Image.asset("images/logo.png"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Saiba qual a melhor opcao para abastecimento do seu carro",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Preço Alcool, Ex: 2.59",
                    ),
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    controller: _controllerAlcool,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Preço Gasolina, Ex: 3.09",
                    ),
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    controller: _controllerGasolina,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "Calcular",
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: _calcular),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      _resultado,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )));
  }
}
