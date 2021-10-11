import 'package:flutter/material.dart';

class DetailChecUp extends StatelessWidget {
  const DetailChecUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context, true);
                    },
                    icon: Icon(Icons.arrow_back,color:Colors.white,size: 30,),
                  ),

                  Text('Detail Checkup'),
                ],
              ),
            ],
          ),
        ),

        body: Column(
          children: [
            SizedBox(height: 20,),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Checkup 1',style: TextStyle(fontSize:18),), SizedBox(height: 8,),
                          Text('Kondisi Sapi : Sehat',style: TextStyle(fontSize:18)), SizedBox(height: 8,),
                          Text('Berat Sapi : 200 Kg',style: TextStyle(fontSize:18)), SizedBox(height: 8,),

                          Text('Suhu Sapi : 39',style: TextStyle(fontSize:18)), SizedBox(height: 8,),
                          Text('Aktif Tanggap : Tanggap',style: TextStyle(fontSize:18)), SizedBox(height: 8,),
                          Text('Gerak Tubuh : Normal',style: TextStyle(fontSize:18)), SizedBox(height: 8,),
                          Text('Warna Feses : Coklat',style: TextStyle(fontSize:18)), SizedBox(height: 8,),
                          Text('Bau Feses : Berbau Tanah',style: TextStyle(fontSize:18)), SizedBox(height: 8,),
                          Text('Textur Feses : Kasar',style: TextStyle(fontSize:18)), SizedBox(height: 8,),
                          Text('Kualitas Feses : Baik',style: TextStyle(fontSize:18)), SizedBox(height: 8,),

                        ],
                      ),

                      Text("Rabu 7 Oktober 2021",style: TextStyle(fontSize:18),), SizedBox(height: 8,),
                    ],
                  ),
                ],
              ),

            ),

              Container(
                width: double.infinity  ,
                height: 1,
                color: Colors.grey,
              ),

              SizedBox(height: 20,),
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text('Checkup 1',style: TextStyle(fontSize:18),), SizedBox(height: 8,),
                          // Text('Kondisi Sapi : Sehat',style: TextStyle(fontSize:18)), SizedBox(height: 8,),
                          // Text('Berat Sapi : 2 Kg',style: TextStyle(fontSize:18)), SizedBox(height: 8,),
                          // Text('Kualitas Feses : Baik',style: TextStyle(fontSize:18)), SizedBox(height: 8,),
                        ],
                      ),

                      // Text("Senin 1 Januari 2020",style: TextStyle(fontSize:18),), SizedBox(height: 8,),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text('Terakhir Sakit : 20 Oktober 2019',style: TextStyle(fontSize:18),), SizedBox(height: 8,),
                      // Text('Note : ',style: TextStyle(fontSize:18)), SizedBox(height: 8,),
                      // Text('Sapi blablabla',style: TextStyle(fontSize:18)), SizedBox(height: 8,),
                    ],
                  ),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
