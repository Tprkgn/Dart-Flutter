import 'package:flutter/material.dart'; //material app import etme
import 'package:hesap_makinesi/buttoncontainer.dart';
import 'functions.dart';
import 'textshow.dart';

class Hesap extends StatefulWidget {
  const Hesap({super.key});
  @override
  State<Hesap> createState() => _HesapState();
}
class _HesapState extends State<Hesap> {
  // uygulama classı
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // material app şeklinde uyglamayı çizme
      home: Scaffold(
        backgroundColor:
            const Color.fromARGB(255, 21, 26, 29), // uygulama arka plan rengi

//----------------------------------------------------APP BAR RENGİ YAZI VE RENGİ-------------------------------------------------------------------------------------------
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(170, 0, 0, 0),
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: const Text("Hesap Makinesi"),
          centerTitle: true,
        ),
//----------------------------------------------------SAFE AREA KULLANARAK UYGLAMAYI OLUŞTURMA-------------------------------------------------------------------------------
        body: SafeArea(
          child: Column(
            // KOLONLAR AÇILARAK METİN VE BUTONLARI HİZALAMA
            children: [
              //İMZA CONTAİNERİ-----------------------------------------------------------------------------------------------------------------------------------------------------------
              Container(
                margin: const EdgeInsets.only(top: 0),
                width: double.infinity,
                child: const Text(
                  "Toprak Tarafından Oluşturuldu.",
                  style: TextStyle(
                    color: Color.fromARGB(19, 255, 255, 255),
                    fontSize: 22.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // METİN CONTAİNERİ-----------------------------------------------------------------------------------------------------------------------------------------------------------
              TexShow(texts: text),
              // ROW KULLANARAK SİLME BUTONU OLUŞTURMA VE YERİNİ AYARLAMA --------------------------------------------------------------------------------------------------------------------
              Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, //Butonların aralarını eşit açma
                  children: [
                    Container(), //Hizalamada kolaylık için açılmış boş containerler
                    Container(), //Hizalamada kolaylık için açılmış boş containerler
                    Container(), //Hizalamada kolaylık için açılmış boş containerler
                    Container(), //Hizalamada kolaylık için açılmış boş containerler
                    Container(
                      margin: const EdgeInsets.only(
                          top: 40,
                          left: 80), //geri butonunun metinden uzaklaştırılması
                      child: Ink(
                        decoration: const ShapeDecoration(
                          color: Color.fromARGB(255, 21, 26, 29),
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          splashColor: const Color.fromARGB(255, 171, 11, 0),
                          onPressed: () {
                            setState(() {
                              deletetext();
                            });
                          },
                          icon: const Icon(
                            Icons.backspace_outlined,
                            size: 40,
                            color: Color.fromARGB(255, 171, 11, 0),
                          ),
                        ),
                      ),
                    ),
                    Container(), //Hizalamada kolaylık için açılmış boş container
                  ]),
              // ROW KULLANARAK TEMİZLEME, YÜZDE, ONDALIK İŞARETİ VE BÖLME BUTONLARINI OLUŞTURMA VE YERİNİ AYARLAMA ------------------------------------------------------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, //Butonların aralarını eşit açma
                children: [
                  Container(), //Hizalamada kolaylık için açılmış boş container
                  const ButContainer(buttext: 'C', func: '0'),
                  const ButContainer(buttext: ' % ', func: '3'),
                  const ButContainer(buttext: '.', func: '3'),
                  const ButContainer(buttext: ' ÷ ', func: '3'),
                  Container(), //Hizalamada kolaylık için açılmış boş container
                ],
              ),
              // ROW KULLANARAK 1, 2, 3 VE X BUTONLARINI OLUŞTURMA VE YERİNİ AYARLAMA -----------------------------------------------------------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, //Butonların aralarını eşit açma
                children: [
                  Container(), //Hizalamada kolaylık için açılmış boş container
                  const ButContainer(buttext: '1', func: '3'),
                  const ButContainer(buttext: '2', func: '3'),
                  const ButContainer(buttext: '3', func: '3'),
                  const ButContainer(buttext: ' X ', func: '3'),
                  Container(), //Hizalamada kolaylık için açılmış boş container
                ],
              ),
              // ROW KULLANARAK 4, 5, 6 VE - BUTONLARINI OLUŞTURMA VE YERİNİ AYARLAMA -----------------------------------------------------------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, //Butonların aralarını eşit açma
                children: [
                  Container(), //Hizalamada kolaylık için açılmış boş container
                  const ButContainer(buttext: '4', func: '3'),
                  const ButContainer(buttext: '5', func: '3'),
                  const ButContainer(buttext: '6', func: '3'),
                  const ButContainer(buttext: ' - ', func: '3'),
                  Container(), //Hizalamada kolaylık için açılmış boş container
                ],
              ),
              // ROW KULLANARAK 7, 8, 9 VE + BUTONLARINI OLUŞTURMA VE YERİNİ AYARLAMA -----------------------------------------------------------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, //Butonların aralarını eşit açma
                children: [
                  Container(), //Hizalamada kolaylık için açılmış boş container
                  const ButContainer(buttext: '7', func: '3'),
                  const ButContainer(buttext: '8', func: '3'),
                  const ButContainer(buttext: '9', func: '3'),
                  const ButContainer(buttext: ' + ', func: '3'),
                  Container(), //Hizalamada kolaylık için açılmış boş container
                ],
              ),
              // ROW KULLANARAK 0 ve = BUTONLARINI OLUŞTURMA VE YERİNİ AYARLAMA -----------------------------------------------------------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, //Butonların aralarını eşit açma
                children: [
                  Container(), //Hizalamada kolaylık için açılmış boş containerlar
                  Container(), //Hizalamada kolaylık için açılmış boş containerlar
                  Container(), //Hizalamada kolaylık için açılmış boş containerlar
                  Container(), //Hizalamada kolaylık için açılmış boş containerlar
                  const ButContainer(buttext: '0', func: '3'),
                  Container(), //Hizalamada kolaylık için açılmış boş container
                  Container(), //Hizalamada kolaylık için açılmış boş container
                  Container(), //Hizalamada kolaylık için açılmış boş container
                  const ButContainer(buttext: '=', func: '1'),
                  Container(), //Hizalamada kolaylık için açılmış boş container
                ]
              ),
            ], // children
          ),
        ),
      ),
    );
  }
}