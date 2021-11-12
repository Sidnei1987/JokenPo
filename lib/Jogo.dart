import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _mensagem = "Escolha uma opção abaixo" ;
  var _imagemApp = AssetImage("image/padrao.png");

  void _opcaoSelecionada(String escolhaUsuario){

    var opcoes = ["pedra","tesoura", "papel"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes [numero];

    print("Escolha do App:" + escolhaApp);
    print("Escolha do usuario:" + escolhaUsuario);

    //Exibição da imagem escolhida pelo App
    switch ( escolhaApp ){
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("image/pedra.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("image/tesoura.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("image/papel.png");
        });
        break;
    }
    //Validação do ganhador
    // Usuario Ganhador
    if (
    (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
           (escolhaUsuario == "papel" && escolhaApp == "pedra")
    ){
      setState(() {
        this._mensagem = "Parabéns !!!! Você ganhou :D ";
      });
      //App Ganhador
    } else if (
    (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario  == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")

    ){
      setState(() {
        this._mensagem = "Que pena !!!! Você perdeeu :( ";
      });

    }else {
      setState(() {
        this._mensagem = "Empatamos ;D";
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("JokenPo")
        ),
      ) ,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //1)text
            //2)imagem
            //3)text resultado
            //4)Linha 3 imagem
            Padding(
                padding: EdgeInsets.only(top: 30, bottom: 16),
              child: Text(
                "Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                  
                ),
              ),
            ),

            Image(image: this._imagemApp,),

            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 16),
              child: Text(
                this._mensagem ,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold

                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget> [
                GestureDetector(
                  onTap: () => _opcaoSelecionada ("pedra"),
                  child: Image.asset("image/pedra.png",height: 100,),
                ),
                GestureDetector(
                  onTap:  () => _opcaoSelecionada ("tesoura"),
                  child: Image.asset("image/tesoura.png", height: 100,),
                ),
                GestureDetector(
                  onTap:  () => _opcaoSelecionada ("papel"),
                  child: Image.asset("image/papel.png", height: 100,),
                ),
                /*
                Image.asset("image/pedra.png",height: 100,),
                Image.asset("image/tesoura.png", height: 100,),
                Image.asset("image/papel.png", height: 100,),
                */

              ],
            )

          ],
        ),

    );
  }
}
