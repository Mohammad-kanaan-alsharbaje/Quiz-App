import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'appbrain.dart';
void main() {
  runApp(const MyApp());
}

AppBrain appBrain = AppBrain();
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: const Text('Quiz'),
          backgroundColor: Colors.grey[700],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Exampage(),
        ),
      )
    );
  }
}


class Exampage extends StatefulWidget {
  const Exampage({Key? key}) : super(key: key);

  @override
  State<Exampage> createState() => _ExampageState();
}

class _ExampageState extends State<Exampage> {
  List<Widget> x =[];
  int ra =0 ;
  void checkanswer (bool useranswer){
    setState(() {
    bool correctanswer =appBrain.getQuestionAnswer() ;
    if (correctanswer == useranswer){ra ++ ;

        x.add(Padding(padding: EdgeInsets.all(3),child:Icon(Icons.thumb_up,color: Colors.green,)));
    }else{

      x.add(Padding(padding: EdgeInsets.all(3),child:Icon(Icons.thumb_down,color: Colors.red,)));
    }
      if (appBrain.isFinishe() == true){
        Alert(
          context: context,

          title: "Quiz is finish",
          desc: "u answered on $ra of 7 questions",
          buttons: [
            DialogButton(
              child: Text(
                "Retry",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        appBrain.reset();
        x=[];ra =0 ;

      }else{ appBrain.getNextQuestion();}

    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(children: x,),
        
        Expanded(
            flex: 5,
            child: Column(
          children: [
            Image.asset(appBrain.getQuestionImage()),
            SizedBox(height: 20,),
            Text(appBrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize: 24
            ),)
          ],
        )),
        Expanded(child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextButton(onPressed:(){
            checkanswer(true);
          } ,child:Text('True') ,style:TextButton.styleFrom(backgroundColor: Colors.indigo),


          ),
        )),

        Expanded(child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextButton(onPressed:(){
            checkanswer(false);
          } ,child:Text('false') ,style:TextButton.styleFrom(backgroundColor: Colors.deepOrange)),
        ))


      ],
    );
  }
}

