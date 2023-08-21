double sum = 0; // sonuç değişkeni
String text = ""; // ekranda gözüken metin
List list = [];  // metine eleman eklemek için kullanılan liste
void textmaker(){
    text="";
    for(int i = 0; i<list.length;i++){/*basılan her tuşu metine girebilmek için basılan tuş sayısı kadar dönen for döngüsü*/
      text += list[i].toString();
    }
  }
//--------------------------------------Sonuç metnini yazdırabilmek için fonksiyon textmaker()dan farkı ise hafızayı silip yerine sonucu eklemesidir
  void sumtextmaker(String sum){
    list.clear();
    list.add(sum);
    text=sum.toString();
  }
//----------------------------------------geri tuşuna basıldığında hafızadaki son karakteri siler

  void deletetext(){
    if(list.isNotEmpty){//hataya el vermemek için hafızada karakter varsa çalışır
      list.removeLast();
      textmaker();
    }
  }
  //---------------------------------------Clear tuşuna "C" basıldığında veya kod hataya düşecekse hafızayı siler 
  void deleteall(){
    list.clear();
    textmaker();
  }
  //----------------------------------------- basılan tuşların ekrana yazdırılması için basılan karakteri hafızaya "list[]" ekler
  void add(String str){
    if(list.isEmpty && str == "."){list.add("0$str"); textmaker();}// hafıza ve metin boşken virgüle basılırsa ,str yerine 0,str şeklinde düzenler
    else if (isOperand(lastIndex())&&isOperand(str)){   
      list.remove(lastIndex());
      list.add(str);
      textmaker(); 
    }
    else {
      list.add(str);
      textmaker(); 
    }
  }
// --------------------------------------------hafızadaki karakterleri işleme sokan ve eşittir "=" tuşuna basıldığında çalışan fonksiyon----------------------------------------------------------------------
  void equal(){
    bool isError = false; //hata değişkeni
    List<String> temp = text.split(" ");// hafızadaki metni boşluklara göre ayırır (operatlar yani işlem karakterleri hafızaya boşluk ile girilir böylece her operattan öncesi bir sayı olarak tutulur)

    for(int i = 0; i<temp.length; i++){ //
      if(temp[i]== " "|| temp[i]==""){  //split işleminden kalan ara boşlukları siler böylece işlemleri yapmak kolaylaşır
        temp.remove(temp[i]);           //örnek:temp=["123" , "" , " +" , "" , "456"] ----> temp=["123", " +" , "456"]
      }                                 // 
    }

    for(int i = 0; i<temp.length-1; i++){ //
      int j = i+1;                        //
      if(isOperand(temp[i])){             //
        if(isOperand(temp[j])){           // ardı ardına girilen operatların "+-"  uygulamada hataya dönüşmemesi için hafızayı silen ve hata değişkenini trueye çeviren for döngüsü
          deleteall();                    // (hata değişkeni işlemlerin yapılmasını if döngüsünü kırar)
          isError= true;                  //
        }                                 //
      }                                   //
    }                                     //


    if(temp.isEmpty||temp[0]=="+"||temp[0]=="-"||temp[0]=="X"||temp[0]=="÷"||temp[0]=="X"||temp[0]=="%"){deleteall(); isError =true;}// kullanıcı kaynaklı en başta operatla başlama hatasını algılar ve engeller, kodu kurtarır 
    if(!isError){// hata varsa işlemleri yapmayıp uygulamayı kurtaran if
      while(temp.length>1){// uzun bir işlem döngüsü yetisi kazandırabilmek için işlemleri döngüye alan while
        for(int i = 1; i<temp.length; i++){ // hafızadaki karakterleri bir bir gezen for döngüsü
          if(temp[i]=="X"||temp[i]=="÷"||temp[i]=="%"){// matematik kurallarına göre en öncelikli işlem sıralarını belirleyen if (iki çarpma işleminde sola yakın olan önceliklidir.)
            if(temp[i]=="X"){//işlem belirteci
              sum += double.parse(temp[i-1])*double.parse(temp[i+1]);                             //
              temp[i] = (double.parse(temp[i-1])*double.parse(temp[i+1])).toString();             //      işlemler if(temp[i]=="X") sayesinde tanınır
              temp.remove(temp[i-1]);                                                             //      
              temp.remove(temp[i]);                                                               //      işlem için önce operatın yeri hafızada bulunur ve operattan önceki "i-1" ve sonraki "i+1"
            }                                                                                     //      önce double.parse() ile double çevrilir sonra işaretlere göre işleme sokulur 
            else if(temp[i]=="÷"){//işlem belirteci                                               //      yapılan işlem önce sonuca tanımlanır sonra işlemin sonucu splitlenmiş hafızadaki operatla
              sum += double.parse(temp[i-1])/double.parse(temp[i+1]);                             //      değiştirilir "temp[i]="X" -> temp[i] = (i-1) * (i+1)" 
              temp[i] = (double.parse(temp[i-1])/double.parse(temp[i+1])).toString();             //      
              temp.remove(temp[i-1]);                                                             //      operatorun solundaki ve sağındaki işlemde kullanılmış sayılar hafızadan temp.remove() kullanarak
              temp.remove(temp[i]);                                                               //      silinir ve diğer işlemlere karışması engellenir   temp.remove(temp[i-1]); temp.remove(temp[i+1]);                                                                      
            }                                                                                     //
            else if(temp[i]=="%"){//işlem belirteci                                               //      bu işlem temp listesi tek elemanlı yani tek sonuç barındırana aynı zamanda hiç operat kalmayana 
              sum += double.parse(temp[i-1])/(100/double.parse(temp[i+1]));                       //      kadar yukarıdaki while döngüsü sayesinde devam ettirilir.
              temp[i] = (double.parse(temp[i-1])/(100/double.parse(temp[i+1]))).toString();       //
              temp.remove(temp[i-1]);                                                             //
              temp.remove(temp[i]);                                                               //
            }                                                                                     //
          }                                                                                       //
        }//for                                                                                    //
        for(int i = 1; i<temp.length; i++){                                                       //
          if(temp[i]=="+"||temp[i]=="-"){                                                         //
            if(temp[i]=="+"){//işlem belirteci                                                    //
              sum += double.parse(temp[i-1])+double.parse(temp[i+1]);                             //
              temp[i] = (double.parse(temp[i-1])+double.parse(temp[i+1])).toString();             //
              temp.remove(temp[i-1]);                                                             //
              temp.remove(temp[i]);                                                               //
            }                                                                                     //
            else if(temp[i]=="-"){//işlem belirteci                                               //
              sum += (double.parse(temp[i-1])-double.parse(temp[i+1]));                           //
              temp[i] = (double.parse(temp[i-1])-double.parse(temp[i+1])).toString();             //
              temp.remove(temp[i-1]);                                                             //
              temp.remove(temp[i]);                                                               //
            }
          }
        }
      }
      if(temp.isNotEmpty){ // hafıza boşken eşittir tuşuna basılması sırasında oluşacak hatayı önlemek için gereken if
        sumtextmaker(temp[0]);  // sonucu yazdırması için sumtextmaker() hafıza listesi parametresi "temp" gönderilerek çağırılır
      }
    }
  }//equal

//------------------------------------------------isOperand fonksiyonu karakterlerin sayı mı yoksa operator mü olduğunu kontrol eder
  bool isOperand(String x){                       
    List operands = ["+","-","%","X","÷","%"," + "," - "," % "," X "," ÷ "," % ","."];
    bool isTrue = false;
    for(int i = 0; i<operands.length; i++){
      if(x == operands[i]){isTrue = true;}
    }
    if(isTrue){return true;}
    else{return false;}
  }
//-------------------------------------------------LastIndex( fonksiyonu bir önceki basılan tuşu hafızaya alır)
  String lastIndex(){
    String last = "0";
    if(list.isEmpty){last="0";}
    else{
      last = list[list.length-1];
    }
    return last;
  }
  