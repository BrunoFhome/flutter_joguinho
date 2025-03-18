import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("imagem/padrao.png")!;
  var _mensagem = "Escolha sua opção abaixo";

  final Map<String, AssetImage> _opcaoImagem = {
    "pedra" : AssetImage("imagem/pedra.png"),
    "papel" : AssetImage("imagem/papel.png"),
    "tesoura" : AssetImage("imagem/tesoura.png")
  };

  void _opcaoSelecionada(String escolhaUsuario){
    final opcoes = ["pedra","papel","tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];


    setState((){
      this._imagemApp = _opcaoImagem(escolhaApp)!;

      if(
        (escolhaUsuario == "pedra" && escolhaApp == "tesoura") || 
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") || 
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
        
        
        setState(() {
          this._mensagem = "Parabens Voce ganhou";
        });
        }else if(
          (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
          (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
          (escolhaApp == "papel" && escolhaUsuario == "pedra")
        ){
        setState(() {
          this._mensagem = "Voce perdeu";
        });
        } else {
        setState(() {
          this._mensagem = "Empate";
        });
      }

      });
      }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Joken Po"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            ),
            Image(image: this._imagemApp),
            Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            ),

        ],
      ),
    );
  }
}