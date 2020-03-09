import 'package:flutter/material.dart';
import './questions.dart';
import './resposta.dart';

main() => runApp(QuestionsApp());

class _PerguntaAppState extends State<QuestionsApp>{
  var perguntaSelecionada = 0;

  void _responder(){
    setState(() {
      perguntaSelecionada++;
    });
    print(perguntaSelecionada);
  }
  @override
  Widget build(BuildContext context){
     final List <Map<String, Object>> perguntas = [
      {
        'texto':'Qual a sua cor favorita?',
        'resposta': ['Preto', 'Vermelho', 'Verde', 'Branco',]
      },
      {
        'texto': 'Qual a sua cor favorita?',
        'resposta': ['Coelho', 'Cobra', 'Elefante', 'Leão',]
      },
      {
        'texto': 'Qual é o seu instrutor vavorito?',
        'resposta': ['Maria', 'Joãso', 'Leo', 'Pedro',]
      }
    ];

    List<String> respostas = perguntas[perguntaSelecionada]['resposta'];
    List<Widget> widgets = respostas
      .map((t) => Resposta(t, _responder))
      .toList();p_

    return MaterialApp(
      home:  Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Questions(perguntas[perguntaSelecionada]['texto']),
            ...widgets, 
          ],
        ),
      )
    );
  }
}
 
class QuestionsApp extends StatefulWidget{
    _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}