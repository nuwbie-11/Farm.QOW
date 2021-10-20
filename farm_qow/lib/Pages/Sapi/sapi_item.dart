import 'package:farm_qow/Pages/Sapi/profil_selected_sapi.dart';
import 'package:flutter/material.dart';

class ItemDataSapi extends StatelessWidget {
  String idSapi;
  String namaSapi;
  String tglLahirSapi;
  String kesehatanSapi;
  final Map<String, dynamic> content;
  ItemDataSapi(this.idSapi, this.namaSapi, this.tglLahirSapi,
      this.kesehatanSapi, this.content);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return ProfilSapi(content: content);
          }));
        },
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          // shape: RoundedRectangleBorder(
          //   side: BorderSide(width: 1,color: Colors.black)
          // ),
          child: Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: 70,
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Text(idSapi),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          namaSapi,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(tglLahirSapi),
                      ],
                    ),
                  ],
                ),
                if (kesehatanSapi == 'Sehat')
                  Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        kesehatanSapi,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                else
                  Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        kesehatanSapi,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      );
    });
  }
}
