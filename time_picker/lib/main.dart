import 'package:flutter/material.dart';

void main(){
  runApp(myapp());
}
class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TimeOfDay timeOfDay = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("TIME PICKER")),backgroundColor: Colors.grey),backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              timeOfDay.hour.toString()+ ':' +timeOfDay.minute.toString(),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 30,),
            MaterialButton(
                height: 50,minWidth: 150,
                color: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.2)),
                child: Text("OPEN TIME PICKER",style: TextStyle(color: Colors.white)),
                onPressed: (){
                  selectTime();
                })
          ],
        ),
      ),
    );
  }
  Future<void> selectTime()async{
    TimeOfDay? picked = await showTimePicker(
        initialTime: timeOfDay,
        context: context
    );
    if(picked != null){
      setState(() {
        timeOfDay = picked;
      });
    }
  }
}
