import 'package:flutter/material.dart';

class PForm extends StatefulWidget {
  final List<Widget> pages;
  final List<PTitle> title;
 PForm({required this.pages,required this.title});

  @override
  State<PForm> createState() => _PFormState();
}

class _PFormState extends State<PForm> with TickerProviderStateMixin {
  late List <AnimationController> _controllers ;
  late List <Animation<double>> _animations ;
  late List <Animation<double>> _animationsOpavity ;
  late List <bool> activeColor;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllers = List.generate(widget.pages.length, (index) => AnimationController(vsync: this, duration: Duration (milliseconds : 200 ),lowerBound: .1));

    _animations = _controllers.map((_controller) => Tween<double>(begin: .05, end: 1).animate(_controller)).toList();

    _animationsOpavity = _controllers.map((_controller) => Tween<double>(begin: .0, end: 1).animate(_controller)).toList();

    activeColor = List.generate(widget.pages.length, (index) => false);
  }

  controlColor(int index){
    for(var i=0; i < activeColor.length; i++ ){
        if (index == i ){
                          if (_controllers[index].isCompleted)
                          _controllers[index].reverse();
                          else
                          _controllers[index].animateTo(1);
                        }
                        else {
                          if (_controllers[i].isCompleted)
                          _controllers[i].reverse();
                        }
    }
    for (var i = 0 ; i<= index; i++){
      activeColor[i] = true;
    }
    for (var i = index + 1 ; i< activeColor.length; i++ ){
      activeColor[i] = false ; 
    }
    setState(() {
      
    });
  } 
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.pages.map((e){
        int index = widget.pages.indexOf(e);
       return Stack(
         children: [
          if (index != widget.pages.length - 1)
          Container(
             margin: EdgeInsets.only(left: 2, top: 37),
            child: SizeTransition(
              sizeFactor: _animations[index],
              child: Container(
                margin: EdgeInsets.only(left: 13, top: 20),
                width : 3,
                height : 240,
                color : activeColor[index+1]? Color(0xFF8D74F7).withOpacity(.9): Colors.grey,
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: (){
                     controlColor(index);
                    },
                    child: Container(
                      width : 35,
                      height : 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: 
                        activeColor[index] ? Color(0xFF8D74F7).withOpacity(.9) : Colors.grey,
                      ),
                      
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  widget.title[index].copyWith( activeColor: activeColor[index] ?Color(0xFF8D74F7) : Colors.black,  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(child: FadeTransition(opacity: _animationsOpavity[index],
                  child: SizeTransition(sizeFactor: _animations[index],
                  child: e,),
                  )
                  )
                ],
                )
            ],
          ),
         ],
        );
        }).toList(),
      ),
    );
  }
}
class PTitle extends StatelessWidget {
  late String title , subtitle ;
  late Color activeColor;
  PTitle({ required this.activeColor, required this.subtitle, required this.title});
  @override
  Widget build(BuildContext context) {
    if (activeColor == null) activeColor = Colors.black;
    return Column(
      children: [
        Text(title, style : TextStyle(fontSize: 15,
        fontWeight: FontWeight.bold,
        color: activeColor)),
        if (subtitle != null) Text(subtitle),
      ],
    );
  }

  copyWith({ required Color activeColor}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
       children: [
        Text(title ?? this.title, 
        style : TextStyle(fontSize: 15,
        fontWeight: FontWeight.w500,fontFamily: 'Poppins',
        color: activeColor?? this.activeColor)),
        if (subtitle != null) Text(subtitle?? this.subtitle ?? "",style: TextStyle(color: Colors.black54,fontFamily: 'Montserrat',fontWeight: FontWeight.w500), ),
      ],
    );
  }
}