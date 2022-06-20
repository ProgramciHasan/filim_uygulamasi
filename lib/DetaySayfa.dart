import 'package:flutter/material.dart';
import 'Filimler.dart';

class DetaySayfa extends StatefulWidget {
  Filimler filim;

  DetaySayfa({required this.filim});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.filim.filim_adi),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Image.asset("resimler/${widget.filim.filim_resim_adi}"),
              Text("${widget.filim.filim_adi}", style: TextStyle(fontSize: 48)),

               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: SizedBox(
                   height: 100,
                   child: ElevatedButton(onPressed: (){}, child:
                   Text("Kirala",style: TextStyle(backgroundColor: Colors.deepPurple,fontSize: 30),)
                   ),
                 ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}
