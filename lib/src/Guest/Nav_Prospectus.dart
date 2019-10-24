import 'package:flutter/material.dart';

class Prospectues extends StatefulWidget {
  @override
  _ProspectuesState createState() => _ProspectuesState();
}

class _ProspectuesState extends State<Prospectues> {
  List<String> subject = [
    "B.Sc in CSE",
    "B.Sc in CSE (For Diploma Holder)",
    "B.Sc in SWE",
    "B.Sc in MCT",
    "B.Sc in ESDM",
    "B.Sc in TE",
    "B.Sc in TE (For Diploma Holder)",
    "B.Sc in EEE",
    "B.Sc in EEE (For Diploma Holder)",
    "B.Sc in ETE",
    "B.Sc in ETE (For Diploma Holder)",
    "B.Sc in CE",
    "B.Sc in CE (For Diploma Holder)",
    "B. Architecture",
    "B. Pharmacy",
    "B.Sc in NFE",
    "B.Sc in NFE (For Diploma Holder)",
    "BBA",
    "BRE",
    "BTHM",
    "Entrepreneurship",
    "BA in English",
    "LLB (Hon’s)",
    "BSS in JMC",
    "M.Sc in SWE",
    "M.Sc in MIS",
    "M.Sc in TE",
    "M.Sc in ETE",
    "M. Pharm",
    "MBA",
    "MA in English",
    "MSS in JMC",
  ];

  List image = [
    "https://daffodilvarsity.edu.bd/images/download/flyer/CSE-Day-Spring-2019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/CSE-evening--Spring-2019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/SWE%20Day%20Spring-2019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/B.Sc%20in%20MCT.pdf",
    "https://daffodilvarsity.edu.bd/images/download/flyer/ESDM-Spring-2019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/TE-Day-Spring-2019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/TE-Evening--Spring-2019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/EEE%20Day%20Spring-2019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/EEE-evening-Spring-2019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/ETE%20Day-spring-2019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/ETE-Evening-Spring-2019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/CIS%20Flyer%20Spring%202019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/Civil%20(Evening)-Spring-2019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/Architecture%20Spring-2019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/Pharm%20Spring-2019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/NFE%20Day-Spring-2019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/NFE%20Evening-Spring-2019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/BBA%20Spring-2019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/BRE%20Spring-2019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/BTHM-Spring-2019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/BE%20Spring-Flyer-2019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/English%20Hons%20Spring%202019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/LLB--Spring-2019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/JMC%20MSS%20Spring-2019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/M.Sc%20in%20SWE.pdf",
    "https://daffodilvarsity.edu.bd/images/download/flyer/MIS%20MS%20Spring-2019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/M.Sc%20in%20Textile.pdf",
    "https://daffodilvarsity.edu.bd/images/download/flyer/ETE%20M.Sc-Spring-2019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/Pharm%20Master-Spring-2019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/MBA%20Spring-2018.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/English%20MA-Spring-2019.jpg",
    "https://daffodilvarsity.edu.bd/images/download/flyer/JMC%20MSS%20Spring-2019.jpg"
  ];

  String _selected = "B.Sc in CSE";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5.0,
                        // has the effect of softening the shadow
                        spreadRadius: 5.0,
                        // has the effect of extending the shadow
                        offset: Offset(
                          5.0, // horizontal, move right 10
                          5.0, // vertical, move down 10
                        ),
                      )
                    ]),
                child: DropdownButton(
                  hint: new Text(" ${_selected}"),
                  underline: Container(
                    height: 1.0,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.transparent, width: 0.0))),
                  ),
                 // value: _selected,
                  items: subject.map((String v) {
                    return new DropdownMenuItem<String>(
                      value: v,
                      child: Text(v),
                    );
                  }).toList(),
                  onChanged: ( newValue) {
                    print(newValue);

                    setState(() {
                      _selected = newValue;
                    });
                  },


                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(


                decoration: BoxDecoration(
                   // color: Colors.white,
                   // borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5.0,
                        // has the effect of softening the shadow
                        spreadRadius: 5.0,
                        // has the effect of extending the shadow
                        offset: Offset(
                          5.0, // horizontal, move right 10
                          5.0, // vertical, move down 10
                        ),
                      )
                    ]),



                child: new Image.network(image[subject.indexOf(_selected)],)  ,
              ),
            )

          ],
        ),
      ),
    );
  }
}

/*class Prospectues extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

  }
}*/
