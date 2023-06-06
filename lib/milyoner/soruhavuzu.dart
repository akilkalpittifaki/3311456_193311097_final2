class Soru {
  String soruText;
  bool soruCevap;

  Soru(
      {required this.soruText,
      required this.soruCevap}); //normalde kabul etmiyordu, required ekleyince sorun çözüldü
}

class SoruHavuzu {
  int _soruIndex =
      0; //sadece bu class içinde kullanacağımızı belirtmek için _soru index diyorum yani bu classa private bir değişken atıyıcaz

  final List<Soru> _soruBankasi = [
    Soru(
        soruText:
            '1- Russell Aylakliğa Övgü eserinde teknoloji sayesinde insanlarin 4 saat çalışmasını yeterli görmüştür.',
        soruCevap: true),
    Soru(
        soruText:
            '2- Nietzsche\'nin Ecce Homo eserinde hayranlık duyduğu Wagner bir felsefecidir.',
        soruCevap: false),
    //\' ile kesmeyle ayirdik bolmeden.', soruCevap: true)
    Soru(
        soruText:
            '3- Saint Agustinus un "itiraflar" eseri otobiyografik bir eserdir.',
        soruCevap: true),
    Soru(
        soruText: '4- Sokrates Savunma yaptıktan sonra beraat etmiştir.',
        soruCevap: false),
    Soru(
        soruText:
            '5- David Hume\'un "Din Üzerine" eserinde Hume ve bir ilahiyatçı 2 farklı insan tartışmaktadır.',
        soruCevap: false),
    Soru(
        soruText:
            '6- La Mettrie "İnsan Bir Makine" eserinde bilim ile felsefeyi kıyaslayıp filozofların doğruya ulaşması mümkün olmayan ve sürekli konuşup tartışıp duran boşboğazlar olduğunu söylemiştir.',
        soruCevap: true),
    Soru(
        soruText:
            '7- Schopenhauer "Aşkın Metafiziği" eserinde insanın iyi bir ruh halini değil nötr bir ruh halini hedeflemesi gerektiğini savunmuştur',
        soruCevap: true),
    Soru(
        soruText:
            '8- Hobbes; Leviathan eserinde devletin oluşma sebebi olarak bireylerin hayatta kalması ve kendini koruması gerektiğini söylemiş ve bireylerin yaşama hakkının asıl önemli olan ve devletin oluşma sebebi, ve devlet başkanına itaatin sebebi olduğu için; eğer devlet başkanı bir birey hakkında ölüm fermanı verirse, bireyin krala karşı gelip idamdan kaçması gerektiğini savunmuştur.',
        soruCevap: true),
    Soru(
        soruText:
            '9- Rousseau "Toplum Sözleşmesi" eserinde devletin sağlam olması için zengin ve fakir arasındaki ayrımın açılmasını, böylece zenginlerin devleti koruyacağını söylemiştir.',
        soruCevap: false),
    Soru(
        soruText:
            '10- Sartre "Varlık ve Hiçlik" eserinde insanın özgür olup olmamak konusunda seçim hakkı olduğunu söylemiştir.',
        soruCevap: false),
    Soru(
        soruText:
            '11-Marquis de Sade "Tanrıya Karşı Söylev" eserinde din adamlarına güç uygulamak yerine dinlerin kendisine yönelik eleştiriler yapılmalı demiştir.',
        soruCevap: true),
    Soru(
        soruText:
            '12- Freud "Uygarlığın Huzursuzluğu" eserinde insanın en savunmasız anı bilgiden yoksun olduğu zamandır demiştir.',
        soruCevap: false),
    Soru(
        soruText:
            '13- Karl Popper "Açık Toplum ve Düşmanları" eserinde insanların fikirleri için gerekirse ölmesi gerektiğini savunmuştur.',
        soruCevap: false),
    Soru(
        soruText:
            '14- Farabi "Erdemliler Şehri" eserinde insanın maddeye odaklanması gerektiğini ve maddeye odaklanarak yaracıyı anlayabileceğini savunmuştur.',
        soruCevap: false),
    Soru(
        soruText:
            '15- Senaca "Mutlu Yaşam Üzerine" eserinde insanın bir yaşama amacı olması gerektiğini savunmuştur. Eğer yaşama amacı yoksa lüks ve umursamazlık yüzünden ömür tükenir ve yaşam hızla tükenir demiştir.',
        soruCevap: true),
    Soru(
        soruText:
            '16- Schopenhauer "Yaşam Bilgeliği Üzerine Aforizmalar" eserinde seçkin insanların kaderinin yalnızlık olduğunu söylemiştir.',
        soruCevap: true),
    Soru(
        soruText:
            '17- Mihail Bakunin "Devlet ve Anarşi" eserinde toplumun bilgi ve bilim tarafından yönetilmesi gerektiğini söylemiştir.',
        soruCevap: false),

    Soru(
        soruText:
            '18- Henry Bergson "Gülme" eserinde sanatın oluşma sebebi olarak gülme eyleminin keyif verici olması ve insanın da güldürmek için fırsat kollaması ve dalgınlıkları abartması olduğunu söylemiştir.',
        soruCevap: true),
    Soru(
        soruText:
            '19- Hegel "Tarihte Akıl" eserinde devleti yönetmesi gereken şeyin halkın istekleri olduğunu savunmuştur. Devleti devlet yapan halktır demiştir.',
        soruCevap: false),

    Soru(
        soruText:
            '20- Spinoza "Etika" eserinde köleliği insanın duygularını yönetme konusundaki güçsüzlüğü olarak tanımlamıştır.',
        soruCevap: true),
    Soru(
        soruText:
            '21- Russell "Mutlu Olma Sanatı" eserinde psikolojik baskının olduğu yerde mutluluğun olmayacağını savunmuştur.',
        soruCevap: true),
    Soru(
        soruText:
            '22- Russell "Eğitim Üzerine" eserinde öğretim sevgisiz olsa bile yine de bilimsellik olduğu sürece öğretimin faydalı olacağını söylemiştir. ',
        soruCevap: false),
    Soru(
        soruText:
            '23- Mevlana "Mesnevi" eserinde insanın bedene maddeye ve surete önem vermesi gerektiğini savunmuştur.',
        soruCevap: false),
    Soru(
        soruText:
            '24- Heidegger "Varlık ve Zaman" eserinde; bir insanın bu hayatı gerçekten yaşamaya başladığı zaman ölmeye de artık hazır hale geldiğini söylemiştir. ',
        soruCevap: true),
    Soru(
        soruText:
            '25- Platon "Devlet" eserinde iyi olan şeyin halk için de aydın kişiler için de zevkte olduğunu söylemiştir. ',
        soruCevap: false)
  ];

  String soruTextGetir() {
    return _soruBankasi[_soruIndex].soruText;
    //Dart Dili Fonksiyonlar da geri değer döndüren bir fonksiyon tanımlarsak return ifadesi içerisine geri dönüş değerini vermelisiniz.
  }

  bool soruCevapGetir() {
    return _soruBankasi[_soruIndex].soruCevap;
  }

  //artik disaridan bir dosyadan soru havuzuna erisebilir ve soruları ve cevapları dondurebiliriz
  //ve simdi sonraki getir fonksiyonu olusturalım. sonrakigetire eriserek sonraki soruya eriselim.
  //fonksiyon bi seyi döndürmücek bu yüzden void olarak ayarlıyoz sonrakigetir fonksiyonunu.
  void sonrakiSoruGetir() {
//dikkat ettiysen fonksiyonun ilkharfi büyük, sonnraki kelimleerin ilkharfileri büyük harfle başlıyor ve bitişik yazılıyor
//void fonksiyonuna bir parametre de vermedim.
    if (_soruIndex < _soruBankasi.length - 1) {
      //indeksler sifirdan basladigi icin bir eksigi.
      _soruIndex++; //ama simdi son soruda hata vericek. bunu onlemek ıcın yukarıya if ekliyorum.
    }
  }

  bool sorularBittiMi() {
    if (_soruIndex >= _soruBankasi.length - 1) {
      //büyük eşit olduysa demek kı son soruya geldik
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _soruIndex = 0;
  }
}
