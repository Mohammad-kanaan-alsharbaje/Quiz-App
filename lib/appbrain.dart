
import 'package:quiz/questions.dart';

class AppBrain{  int _qn=0;

  List<Questions> _qu = [
    Questions(q1: "عدد الكواكب في المجموعة الشمسية هو 8 كواكب",a1:true ,il1: 'images/image-1.jpg'),
    Questions(q1:  'القطط هي حيوانات لاحمة',a1:true ,il1: 'images/image-2.jpg'),
    Questions(q1:   'الصين موجودة في القارة الافريقية',a1:false ,il1: 'images/image-3.jpg'),
    Questions(q1:'الارض مسطحة وليست كروية',a1:false ,il1: 'images/image-4.jpg'),
    Questions(q1:  'البشر يأكلون الخضار فقط ',a1:false ,il1: 'images/image-5.jpg'),
    Questions(q1: 'كوكب عطارد اقرب للشمس من الارض',a1:false ,il1: 'images/image-6.jpg'),
    Questions(q1: 'يمكن للدجاج ان يبيض كل يوم بيضة واحدة فقط',a1:false ,il1: 'images/image-7.jpg'),
  ];

  void getNextQuestion(){
    if (_qn < _qu.length -1){
      _qn++;
    }
  }
  String getQuestionText(){
    return _qu[_qn].q;
  }
  String getQuestionImage(){
    return _qu[_qn].il;
  }
  bool getQuestionAnswer(){
    return _qu[_qn].a;
  }
  bool isFinishe(){
    if (_qn >= _qu.length-1){return true;}else{return false;}
  }
  void reset(){
    _qn=0;
  }
}