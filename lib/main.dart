import 'package:filim_uygulamasi/DetaySayfa.dart';
import 'package:flutter/material.dart';
import  'Filimler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {


     Future<List<Filimler>> filimleriGetir () async {

        var filimleriListele =  <Filimler>[];
        var f1 =  Filimler(1, "Anadoluda", "anadoluda.png", 15.99);
        var f2 =  Filimler(2, "Django", "django.png", 15.99);
        var f3 =  Filimler(3, "Inception", "inception.png", 15.99);
        var f4 =  Filimler(4, "Interstellar", "interstellar.png", 15.99);
        var f5 =  Filimler(5, "The Hatefuleight", "thehatefuleight.png", 15.99);
        var f6 =  Filimler(6, "The Pianist", "thepianist.png", 15.99);

          filimleriListele.add(f1);
        filimleriListele.add(f2);
        filimleriListele.add(f3);
        filimleriListele.add(f4);
        filimleriListele.add(f5);
        filimleriListele.add(f6);

        return filimleriListele;

     }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("FİLİMLER"),
        centerTitle:true,
      ),

      body: FutureBuilder<List<Filimler>>(
        future: filimleriGetir(),
        builder: (context,snapshot){
          if(snapshot.hasData)
          {
            var filimlerListesi = snapshot.data;
            return GridView.builder
              (
              itemCount: filimlerListesi!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2/3.5,
              ),
              itemBuilder: (context,index){
                var filim = filimlerListesi[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(filim: filim,)));
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset("resimler/${filim.filim_resim_adi}"),
                        Text("${filim.filim_adi}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                        Text("${filim.filim_ucret}\u{20BA}",style: TextStyle(fontSize: 16)),

                      ],
                    ),
                  ),
                );
              },

            );

          }
          else
            {
                return Center(
                  child: Text("Veri yok"),
                );
            }
        },
      ),


    );
  }
}
