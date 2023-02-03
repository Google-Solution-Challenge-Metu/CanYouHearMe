class DataModel {
  final String title;
  final String imageName;
  final String author;
  final String date;
  final String context;

  DataModel(this.title, this.imageName, this.author, this.date, this.context);
}

List<DataModel> dataList = [
  DataModel(
    "B12 Vitamini Hangi Besinlerde Bulunur?",
    "assets/images/b12vitamini.jpg",
    "Gamze Şanlı Ak",
    "11.08.2022",
    'B12 Vitamini Hangi Besinlerde Bulunur?\n' +
        '\n' +
        'B12 vitamini suda eriyen bir vitamindir ve diğer adı kobalamindir. Vücudunuzun kendini yenileyebilmesi, hastalıklara karşı kalkan oluşturabilmesi, büyümesi, gelişmesi ve sağlıklı bir yaşam rutini oluşturabilmesi için yardımcı olan vitaminlerin başında gelir.\n' +
        '\n' +
        'Peki, B12 vitamini hangi besinlerde bulunur?\n' +
        '\n' +
        'B12 vitamini, hayvansal kaynaklı besinler olan kırmızı et, tavuk, balık, karaciğer, deniz ürünleri, süt, yumurta, yoğurt ve peynirde bulunur. Günlük diyet çoğunlukla bitkisel besinlerden oluştuğunda, alınan B12 vitamini miktarı da azalır. Özellikle vejetaryen beslenme tipi uygulayanların çok dikkat etmesi gereken bir vitamindir. B12 ile zenginleştirilmiş yiyeceklerle takviye yapılabilir. Gerekirse, beslenmeye ek olarak B12 vitamini takviyesi alınabilir.  Besinlere uygulanan yüksek sıcaklık, B12 vitamininin de kaybına yol açmaktadır.\n' +
        '\n' +
        'Hafızayı güçlendirmeye yardımcı olur\n' +
        '\n' +
        'Bilişsel fonksiyonların gelişmesine destek sağlayan B12 vitamini, eksikliğinde unutkanlıkla kendini gösterir, düzenli alımda ise hafızayı güçlendirerek beyin sağlığını destekler.\n' +
        '\n' +
        'Kansızlık tedavisini destekler\n' +
        '\n' +
        'Kansızlık probleminde B12 vitamini destekleyici rol üstlenir. Folik asitle birlikte çalışarak kansızlığı önlemeye, tedavinin faydalı olmasına destek sağlar.\n' +
        '\n' +
        'Saç ve cilt sağlığının destekçisidir\n' +
        '\n' +
        'Saç, cilt ve tırnak yapısında görülen cansızlık, kırılmalar, dökülmeler ve genel problemler B12 eksikliğinden kaynaklanıyor olabilir. B12 vitaminini düzenli aldığınızda saç, cilt ve tırnak yapınızın daha güçlü, daha sağlıklı olması için destekleyebilirsiniz.\n' +
        '\n' +
        'Kilo kontrolüne yardımcı olur\n' +
        '\n' +
        'B12 vitamini vücuttaki karbonhidratların enerjiye dönüşümüne yardımcı olur. Bu döngü yağ yakımı, metabolizmanın hızlanması ve kilo kontrolü sağlamada destek sağlar. Vücut enerjisinin artması yanı zamanda fiziksel performansı da destekler, spor rutininizi canlandırabilir.\n' +
        '\n' +
        'Kalp ve damar sağlığını destekler\n' +
        '\n' +
        'Son yıllarda artış gösteren kalp ve damar rahatsızlıklarının temel sebeplerinden biri de vitamin eksikliğidir. B12 vitamini, kalp ve damar sağlığı rahatsızlıklarına yakalanma riskini düşürmeye yardımcı olabilir, kalbi doğal yollarla destekler.  \n' +
        '\n' +
        'Hücre onarımını destekler\n' +
        '\n' +
        'B12 vitamini sinir hücrelerini onarmaya, vücudunuzdaki hücrelerin yaşlanmasını önlemeye yardımcı olur.\n' +
        '\n' +
        'Günlük B12 Vitamini İhtiyacı\n' +
        '\n' +
        'B12 vitamini referans aralığına göre kişilerin günlük B12 vitamin ihtiyacı 2-3 mcg’dir. Hamile ve emziren kişilerde ise bu ihtiyaç daha yüksek seviyelerdedir. Günlük alım seviyeleri;\n' +
        '\n' +
        '    0 - 1 yaş bebeklerde; 0,5 mcg\n' +
        '    1 - 13 yaş çocuklarda; 1 - 2 mcg\n' +
        '    14 yaş üstü kişilerde; 2,4 mcg\n' +
        '    Gebe ve emzirenlerde; 2,8 mcg\n' +
        '\n' +
        'B12 Vitamini Eksikliği Belirtileri\n' +
        '\n' +
        'B12 vitamini eksikliğini vücudunuzdaki değişikliklerden, olumsuz hallerden anlayabilirsiniz. İşte vücudunuzun size gönderdiği sinyaller;\n' +
        '\n' +
        '    Hafıza problemleri, yoğun unutkanlık\n' +
        '    Depresyon, anksiyete, sinirlilik hali\n' +
        '    Kilo kaybı\n' +
        '    Ciltte kuruluk\n' +
        '    Saç dökülmesi\n' +
        '    Ağız için yara\n' +
        '    Konsantrasyon bozukluğu\n' +
        '    El ve ayaklarda uyuşma / karıncalanma\n' +
        '    İştahsızlık, kilo kaybı\n' +
        '    Denge problemleri\n' +
        '\n' +
        'B12 vitamini eksikliği nasıl tedavi edilir?\n' +
        '\n' +
        'Kandaki B12 seviyesini yükseltmek için vitamin takviyesi alabilirsiniz veya hayvansal ürünlerin tüketimini artırabilirsiniz. Ancak kandaki seviyeniz düşük durumdaysa hekiminizin yönlendirmesi ile B12 vitaminini burun spreyi olarak veya belirli aralıklarla iğne olarak da kullanılabilirsiniz. \n' +
        '\n' +
        'Vücuttaki B12 vitaminin ciddi eksikliğinde ne yaşanır?\n' +
        '\n' +
        'B12 vitamini beynin sinir ağını oluşturan hücrelerin büyümesinde ve onarımında önemli rol oynar. Eksikliğinde geri dönüşsüz olan hatırlama güçlüğü, hafıza kaybı ve demans gibi ciddi sorunlar ortaya çıkar.\n' +
        '\n' +
        'Hangi durumlar B12 vitamini eksikliği riskini arttırır?\n' +
        '\n' +
        'B12 vitamini eksikliği vücudunuza yeterli ve doğru besin ögesi alamadığınızda ve sindirim sisteminde yaşanan problemlere bağlı olarak görülebilir. Vegan olarak beslenen bireyler hayvansal kaynakları tüketmedikleri için risk altındadırlar. Kronik alkolizim, Crohn hastalığı veya çölyak hastası olmak, yağ aldırma operasyonları, ilerleyen yaş riski arttırır çünkü bu durumlarda vücutta yeterli emilim gerçekleşemez.\n' +
        '\n' +
        'Yeterli B12 vitamini alınmazsa ne olur?\n' +
        '\n' +
        'Vücut yeterli kırmızı kan hücresi üretemez. Yetersizliği halinde, sinir sistemi bozuklukları ile birlikte, “pernisiyöz anemi” (kansızlık) oluşur. Pernisiyöz anemide, kırmızı ve beyaz kan hücrelerinin sayısı azalır ve şekilleri bozulur. Bu durum, kemik iliğinde kan hücrelerinin yapımındaki bozukluktan ileri gelir. Pernisiyöz aneminin oluşum nedenleri farklı da olabilir. Nedenlerinden biri, diyetle yeteri kadar B12 vitamini alınmaması veya besinlerin hazırlanması ve saklanması için uygulanan işlemlerin vitamin kaybını artırmasıdır.',
  ),
  DataModel(
      "Kahvenin İnsan Sağlığına Faydaları",
      "assets/images/kahve.jpg",
      "İlkay Gök",
      "21.10.2021",
      'Bir Fincan Kahveyle Gelen Sağlık\n' +
          '\n' +
          'Dünyada en popüler içeceklerden biri olan kahve, sağlığa kanıtlı faydalarından dolayı fonksiyonel gıda olarak değerlendirilmeye başlandı.\n' +
          '\n' +
          'Kahve içeceğinin fonksiyonel özelliği, yapısında bulunan kafein, klorojenik asid ve malliard reaksiyonun ürünü melanoidinler gibi bioaktif bileşenlerden kaynaklıdır.\n' +
          '\n' +
          'Araştırma sonuçlarına göre günlük 2-3 fincan kahve içeceği tüketimi güvenlidir.\n' +
          '\n' +
          '*Metabolik ve mental sağlığı destekleyici,\n' +
          '\n' +
          '*Keyif verici ve uyanıklık artırıcı,\n' +
          '\n' +
          '*Yüksek tansiyon ve depresyonla savaşmaya yardımcı,\n' +
          '\n' +
          '*Tip 2 diyabet,\n' +
          '\n' +
          '*Alzaymır ve Parkinson hastalıkları gibi bazı kronik hastalıkları,\n' +
          '\n' +
          '*Karaciğer kanseri gibi bazı kanser türlerini\n' +
          '\n' +
          '*Kardiyovasküler hastalıklar gibi dejeneratif hastalıkları önleyici faydaları vardır.\n' +
          '\n' +
          'Bununla birlikte bazı çalışmalarda olumsuz etkileri açıklanmış, hamile kadınlar için zararlı olabileceği ve kahve tüketiminin 300 mg/g kafein miktarıyla sınırlandırmaları gerektiği aktarılmıştır.\n' +
          '\n' +
          'Kahve çekirdeği hasadı, yeşil çekirdeğe uygulanan yöntemler ve sonrasında kavurma sıcaklık dereceleri, öğütme ve ardından uygulanan kahve demleme yöntemleri, kahve içeceğinin kalitesini belirler.\n' +
          '\n' +
          'Yapılan araştırmalarda kafein, klorojenik asit, kafestol-kahveol ve melanodinlerin sağlık açısından önemli etkileri tespit edilmiştir.\n' +
          '\n' +
          'Kafein\n' +
          '\n' +
          'Bilimsel araştırma sonuçları yetişkin bireylerin günlük 400 mg kafein tüketiminin güvenli olduğunu belirtmektedir.\n' +
          '\n' +
          'Kavrulmuş Arabika kahve çekirdeğinde, 100 g kuru maddede yaklaşık olarak 0.7-1.6 g, Robusta’da ise 1.8-2.6 g kafein tespit edilmiştir.\n' +
          '\n' +
          'Türk kahvesi, kaynatılmış kahve demlemenin yer aldığı dekoksiyon yönteminde, filtre kahvenin yer aldığı infüzyon yöntemine göre kafein oranı daha yüksek bulunmuştur. Koyu kavrulmuş kahve çekirdeğinde yüksek kafein miktarı bulunur.\n' +
          '\n' +
          'Kafein 15-120 dk. içinde kanda en yüksek seviyeye ulaşır ve alınan miktara göre merkezi sinir sisteminde uyarı etki gösterir.\n' +
          '\n' +
          'Günde 250-400 mg arası ya da 1-5 mg/vücut ağırlığı kafein, keyif verme, enerjik hissetme, işte isteklilik ve motivasyon, güçlü dikkat ve odaklanmayla kendine güven ve bilişsel fonksiyonların artması gibi olumlu etkilere sahipken bilimsel araştırmalar 500 mg üstü kafein alımının tedirginlik, huzursuzluk gibi olumsuz etkilere neden olduğunu göstermektedir.\n' +
          '\n' +
          'Günde 9 fincandan fazla (600-900 mg kafein) tüketimin kalp hızı ve kan basıncında artışa neden olduğu bildirilmiştir. Kafeinin ayrıca midenin asit salgısını artışına ve diüretik etkiye neden olduğu belirtilmektedir.\n' +
          '\n' +
          'Son yıllarda ‘’kafein tüketimi ile Tip 2 diyabet, Alzaymır ve Parkinson hastalığı riskinde azalma, kafein tüketimi ile karaciğer dokusunda yenilenme’’ en çok araştırılan konularındandır.\n' +
          '\n' +
          'Günlük 300 mg kafein tüketiminin metabolizmayı hızlandırdığı, yaklaşık 79 kcal lik enerji harcamasını sağladığı bulunmuştur.\n' +
          '\n' +
          'Klorojenik Asit\n' +
          '\n' +
          'Klorojenik asit çok yüksek antioksidan kapasitesine sahiptir ve kafein gibi ısıya dayanıklı değildir.\n' +
          '\n' +
          'Bir fincan kahve içeceğindeki klorojenik asit miktarı, kavurma derecesi, demleme yöntemi, su ve öğütülmüş kahve oranı, suyun sıcaklığı, kahve ve suyun temas süresine bağlı olarak değişmektedir.\n' +
          '\n' +
          'Bir araştırmada kahve içeceğindeki klorojenik asit miktarı 20-675 mg aralığında tespit edilmişken başka bir çalışmada bir fincan ya da 200 ml kahve içeceğinde klorojenik asit miktarı 70-350 mg, kafeik asit miktarı 35-175 mg arasında, diğer bir araştırmada ise 200 ml kahve içeceğinde klorojenik asit miktarı 15-325 mg aralığında bulunmuştur.\n' +
          '\n' +
          'Melanoidinler\n' +
          '\n' +
          'Melanoidinler kahve çekirdeğinin kavrulması esnasında oluşur ve yüksek antioksidan özelliği taşırlar.\n' +
          '\n' +
          'Melanoidinlerin;\n' +
          '\n' +
          '*antioksidan,\n' +
          '\n' +
          '*antimikrobiyal,\n' +
          '\n' +
          '*antihipertansif,\n' +
          '\n' +
          '*antialerjij ve\n' +
          '\n' +
          '*prebiyotik\n' +
          '\n' +
          'Özelliğiyle sağlığı destekleyici özelliklere sahip olduğu, bu özelliklere ek olarak metal iyonlarıyla bağ yapabildiği için antimutajenik ve timör büyümeyi önleyici özellikleri de yeni çalışmalarda gösterilmektedir.\n' +
          '\n' +
          'Kaynakça:\n' +
          '\n' +
          'Cite this article as: Gök, İ. (2021). Kavurma işlemi, demeleme/pişirme yöntemlerinin kahvenin biyoaktif bileşenlerine etkisi: Fonksiyonel içecek olarak insan sağlığına faydaları. Food and Health, 7(4), 311-328. https://doi.org/10.3153/FH21032'),
  DataModel(
      "Sürdürülebilir Beslenme Nedir, Nasıl Uygulanır?",
      "assets/images/sürdürülebilir.jpg",
      "Kısık Ateş",
      "27.07.2021",
      'Sürdürülebilir Beslenme Modeli\n' +
          '\n' +
          'Dünya nüfusu hızla artıyor ve 2050 yılında dünya nüfusunun yaklaşık 10 milyar olması bekleniyor. Günümüzde 3 milyardan fazla insanın yetersiz beslendiği ve 7 milyarlık nüfusun çoğunun düşük kaliteli diyetlerle beslendiği düşünüldüğünde, mevcut gıda sisteminin artan gıda talebini karşılamak için en az %60 oranında daha fazla üretim yapması gerekiyor. Dünyamızın kaynakları sınırlı olduğu için üretimin bu oranda artması çok mümkün görünmese de en azından kaynakların verimli kullanılması, gıda israfının azaltılması, çevreye en az zarar verecek biçimde beslenme ve gıda sisteminde değişiklik yapılması için hepimize önemli görevler düşüyor. Bir başka deyişle, gelecek nesillere daha yaşanılır bir dünya bırakmak için beslenmenin de sürdürülebilir olması gerekiyor.\n' +
          '\n' +
          'Mevcut küresel gıda sistemini incelediğimizde, tarımsal faaliyetlerin küresel iklim değişikliğinin en büyük nedenlerinden biri olduğunu görürüz. Çünkü gıda üretimi, küresel sera gazı emisyonlarının yaklaşık %30\'undan sorumludur ve tek başına hayvancılık sektörü bu emisyonların neredeyse yarısını (%14,5) temsil eder. Ayrıca gıda tarımı ve üretimi, karasal arazinin yaklaşık %40\'ını kaplarken, tatlı suyun %70\'ini kullanmaktadır. Bunun yanında gıda üretimi nesli tükenmekte olan türleri tehdit eden en büyük etken olarak karşımıza çıkmaktadır. Tüm bu gerçeklerin ışığında, küresel gıda tedarik sistemi maalesef sürdürülebilir değildir. Hepimiz adına sürdürülebilir bir gelecek istiyorsak yediğimiz gıdayı ve nasıl üretildiğini tekrar düşünmek bir zorunluluk haline gelmiştir.\n' +
          '\n' +
          'Gıda Tarım Örgütü (FAO) sürdürülebilir beslenmeyi, besleyici, güvenli, sağlıklı, aynı zamanda düşük çevresel etkiye sahip olarak tanımlamaktadır. Tüm bu özelliklere ek olarak, bu beslenme şekli uygulandığı coğrafyada kültürel olarak kabul edilebilir, ulaşılabilir, adil, ekonomik, gıda güvencesine katkı sağlayan ve şimdiki ve gelecek nesiller için sağlıklı olmayı destekleyen bir yaşam biçimi olmalıdır.\n' +
          '\n' +
          'Literatürde, diyetleri, insan sağlığı ve çevresel sürdürülebilirlik ile ilişkilendiren önemli çalışmalar bulunmaktadır. 2019 yılında, küresel olarak sağlıklı diyetler ve sürdürülebilir gıda üretimi arasındaki ilişkiyi açıklamak üzere EAT-Lancet Komisyonu (insan sağlığı, beslenme, ekonomi, tarım, siyaset bilimleri ve çevresel sürdürülebilirlik alanlarında çalışan 37 bilim insanından oluşan grup) mevcut bilimsel çalışmaları değerlendirerek, sağlıklı diyetler ve sürdürülebilir gıda üretimi arasındaki ilişkiyi açıklamak üzere hedef geliştirmiştir. Bu hedefler, tüm insanlar ve gezegen için geçerli olan iki temel alana odaklanmaktadır.\n' +
          '\n' +
          'Bunlardan ilki “Sağlıklı Diyetler” olup, komisyon, gıdalar, diyet tipleri ve sağlık sonuçları üzerine yapılan araştırmaları kapsamlı bir şekilde inceleyerek, her gıda grubu için tüketim aralıkları olan bir “gezegen diyeti” tanımlamıştır. Bu diyet, büyük ölçüde sebze, meyve, kepekli tahıllar, baklagiller, kuruyemişler ve doymamış yağlardan oluşan esnek bir diyet modelidir; bu diyet aynı zamanda düşük-orta miktarda deniz ürünleri ve kümes hayvanları içerirken kırmızı et, işlenmiş et, ilave şeker, rafine tahıllar ve nişastalı sebzelerden hiçbirini içermeyen veya çok az içeren şekilde oluşturulmuştur. Komisyon\'a göre, bu yeme düzeninin küresel olarak benimsenmesi, toplam ölüm oranında büyük bir azalmanın yanında önemli sağlık yararları da sağlayacaktır. Gezegen diyeti modeli, çeşitli yüksek kaliteli bitki bazlı gıdalar ve düşük miktarda hayvansal bazlı gıdalar, rafine edilmiş tahıllar, gıdalara eklenmiş şekerler ve sağlıksız yağlar ile tanımlanabilir. Bu model yerel ve bireysel duruma, geleneklere ve diyet tercihlerine uyum sağlamak için esnek olacak şekilde tasarlanmalıdır. Halihazırdaki diyetlerle karşılaştırıldığında, bu değişim, kırmızı et ve gıdaya eklenmiş şeker gibi içeriklerin küresel tüketiminin %50 oranında azalmasını, meyve, kuruyemiş, sebze ve bakliyat tüketiminin ise iki katına çıkmasını gerektirmektedir. Bununla birlikte, Komisyon bu hedefleri yerel durumlara uyarlamanın önemini vurgulamaktadır. Örneğin, Kuzey Amerika ülkeleri şu anda bu modelde önerilen kırmızı et miktarının neredeyse 6,5 katı fazlasını tüketirken, Güney Asya\'daki ülkeler ise önerilen miktarın sadece yarısını tüketiyor.\n' +
          '\n' +
          'İkinci alan ise “Sürdürülebilir Gıda Üretimidir”. Mevcut gıda üretimi, iklim değişikliğini, biyolojik çeşitlilik kaybını, çevresel kirliliği, su ve arazi kullanımındaki sürdürülemez oluşumları tetiklemektedir. Komisyon, Dünya sisteminin geri dönüşü olmayan ve potansiyel olarak yıkıcı değişimlere uğrama riskini azaltmak için küresel gıda üretiminin içinde kalması gereken bir dizi limit ölçüt tanımlamıştır. Bu sınırlar altı temel süreçle ilgilidir: iklim değişikliği (sera gazı emisyonlarına dayalı), arazi sistemi değişikliği (ekilebilir arazi kullanımına dayalı), tatlı su kullanımı, biyolojik çeşitlilik kaybı (yok olma oranına dayalı) ve azot ve fosfor döngüsü (bu aktif maddeleri içeren kimyasal gübrelerin uygulanması temelli).\n' +
          '\n' +
          '2050 yılına kadar tahmini 10 milyar insana sağlıklı beslenme sağlayabilecek sürdürülebilir bir gıda sistemine geçiş, insanlık adına benzeri görülmemiş bir zorluktur. Ancak, yapılan araştırmalar, bu Büyük Gıda Dönüşümünün, gıda kayıpları ve israfında çarpıcı azalmalar, gıda üretim uygulamalarında büyük iyileştirmeler ve çoğunlukla bitki temelli beslenme modellerine yönelik önemli diyet değişiklikleri ile elde edilebileceğini gösteriyor.\n' +
          '\n' +
          ' Sürdürülebilir Beslenme Modellerine en iyi örnek Akdeniz Diyeti ile Yeni İskandinav Diyeti’dir. Akdeniz ve Yeni İskandinav diyetlerinin her ikisi de, çoğunlukla bitki bazlı gıdalar, biraz balık ve sınırlı miktarda et içerir. Bitki bazlı diyetlerin çevre üzerinde daha az olumsuz etkisi vardır.\n' +
          '\n' +
          'Akdeniz Diyeti, Akdeniz bölgesinin zeytin yetiştirilen bölgelerinde ortaya çıkmıştır ve bu bölgelerle güçlü bir kültürel ilişkiye sahiptir. Bu beslenme modelinde, bitki bazlı gıdalar (meyve, sebze, kabuklu yemişler ve tahıllar) ve zeytinyağı tüketimi fazladır. Ortalama balık ve kümes hayvanı tüketiminin yanında nispeten daha düşük miktarda süt ürünleri (esas olarak yoğurt ve peynir), kırmızı et, işlenmiş et ve tatlı tüketimi vardır.\n' +
          '\n' +
          'Yeni İskandinav Diyeti’nin Akdeniz Diyeti ile birçok ortak özelliği vardır, ancak geleneksel olarak Danimarka, Finlandiya, İzlanda, Norveç ve İsveç\'ten elde edilen gıdaları içermektedir. Yeni İskandinav Diyeti’nin temel bileşenleri arasında meyveler, yağlı (ringa balığı, uskumru ve somon) ve yağsız balıklar, baklagiller, sebzeler (lahana ve kök sebzeler) ve tam tahıllar (arpa, yulaf ve çavdar) bulunur. Akdeniz Diyeti’nden önemli bir farklılığı ise zeytinyağı yerine kolza (kanola) yağının kullanılmasıdır. İskandinav Diyeti ağırlıklı olarak bitki bazlı ve yerel kaynaklıdır, bu nedenle İskandinav bölgesinde tüketildiğinde daha az atıkla daha çevre dostu üretim sağlar.\n' +
          '\n' +
          'Akdeniz Diyeti ve Yeni İskandinav Diyeti arasında birçok benzerlik vardır. Her iki diyet de, bitkisel bazlı beslenme ilkelerine dayalı benzer beslenme önerilerini paylaşmakta ve çevreyi korumaya ve sürdürülebilirliğe yönelmektedir. İki diyet arasındaki temel fark ise kullanılan yağ kaynağıdır. Zeytinyağı Akdeniz Diyeti’nin temel yağ kaynağı iken, İskandinav Diyeti’nde kolza tohumu/kanola yağı kullanır.\n' +
          '\n' +
          'Sonuç olarak, tabaklarımıza koyduğumuz her gıdanın çevre üzerinde büyük bir etkisi olduğu açıktır. Daha sağlıklı ve daha sürdürülebilir bir beslenme için, yani hem kendi sağlığımızı iyileştiren ve aynı zamanda gezegenin sağlığına fayda sağlayan sürdürülebilir beslenme uygulamaları geliştirebiliriz.\n' +
          '\n' +
          'Sürdürülebilir Beslenme İçin 5 İpucu\n' +
          '\n' +
          '1. Bitkisel kaynaklı gıdalara öncelik verin\n' +
          '\n' +
          'Sağlıklı beslenme tabağı hazırlamak için tabağınızın yarısını sebze ve meyvelerle doldurun, yemeklerimizi bu prensibe göre planlamak gezegene de fayda sağlar. Daha bitkisel temelli bir beslenme biçimine geçmek kişisel sağlığımızı olumlu yönde iyileştirirken, içilebilir su kaynaklarının ve ormanların azalmasının engellenmesinde fayda sağlayacaktır.\n' +
          '\n' +
          '2. Eti en aza indirin\n' +
          '\n' +
          'Et üretimi, özellikle sığır eti üretimi, sera gazı emisyonlarına önemli bir katkıda bulunur. Besi hayvanlarının yetiştirilmesi, taşınması ve kesilmesi bitkisel gıdalara kıyasla daha fazla yem, su, toprak ve enerji gerektirdiğinden dünyamızın karşılaştığı çevresel yük daha da artmaktadır. Hem kendi sağlığımız hem de gezegenin sağlığı için et proteinleri yerine kuruyemiş ve baklagillerden elde edilen bitkisel proteinleri seçmeyi tekrar düşünmeliyiz.\n' +
          '\n' +
          '3. Yeni deniz ürünleri seçin\n' +
          '\n' +
          'Balık, genel olarak beslenme açısından sağlıklı bir seçim olabilir, ancak bazı türler aşırı avlanmakta veya deniz ortamına zarar verecek şekilde üretilmektedir. Burada size sunulan balık çeşidi “risk altındaki türler” listesindeyse, farklı deniz ürünleri denemeyi düşünün.\n' +
          '\n' +
          '4. Yerele yönelin\n' +
          '\n' +
          'Çiftçi pazarlarını keşfetmek, hem yerel olarak yetiştirilen taze ürünleri bulmanıza yardımcı olurken, hem de yemeğinizi üreten çiftçilerle tanışma fırsatı bulursunuz. Bu tür ilişkiler kurmak, yemeğinizin nasıl yetiştirildiğini, ne zaman hasat edildiğini ve hatta nasıl hazırlanacağını öğrenmek için önemlidir.\n' +
          '\n' +
          '5. Yeme farkındalığı geliştirin\n' +
          '\n' +
          'Daha sürdürülebilir bir şekilde yemek yemek için yapabileceğiniz en basit şeylerden biri, yeme farkındalığı geliştirmektir. Ne yediğinize odaklanmak, yemeğinizin nereden geldiğini ve vücudunuzu nasıl beslediğini düşünmenizi sağlar.\n' +
          '\n' +
          'Ek olarak, açlık hissinizi dikkate alarak, düşündüğünüz kadar fazla yiyeceğe ihtiyacınız olmadığını öğrenebilir ve öğünlerinizi buna göre yeniden planlayabilirsiniz.\n' +
          '\n' +
          'Nasıl yediğimize daha fazla dikkat ederek, sadece yiyeceğe odaklı değil arkasındaki “büyük resim” hakkında da daha fazla düşünerek, gıda tüketimimizi değiştirebilir, gıda israfını azaltabilir ve daha sürdürülebilir gıda kaynakları arayabiliriz.\n' +
          '\n' +
          'Referanslar\n' +
          '\n' +
          '    FAO/WHO. Sustainable healthy diets – Guiding principles. Rome, 2019, http://www.fao.org/3/ca6640en/ca6640en.pdf\n' +
          '    Krznaric, Z, Karas, I, Kelečić,D.L, Bender,D.V. Mediterranean and Nordic diet: a review of differences and similarities of two sustainable, health-promoting dietary patterns, Front. Nutr. | doi: 10.3389/fnut.2021.683678\n' +
          '    Pekcan G.A. Sürdürülebilir Beslenme ve Beslenme Örüntüsü: Bitkisel Kaynaklı Beslenme. Beslenme ve Diyet Dergisi. 2019, 47, 2\n' +
          '    Willett, Walter et al. Food in the Anthropocene: the EAT–Lancet Commission on healthy diets from sustainable food systems, The Lancet, Vol. 393, Issue 10170, 447 –492\n' +
          '    The Nutrition Source, 5 Tips for Sustainable Eating, https://www.hsph.harvard.edu/ nutritionsource/ 2015/06/17/5-tips-for-sustainable-eating/\n' +
          '\n' +
          'Bu içerik, Yaşar Üniversitesi Uygulamalı Bilimler Yüksekokulu Gastronomi ve Mutfak Sanatları Bölüm Başkanı Doç Dr. Seda Genç tarafından derlenmiştir.'),
  DataModel(
      "Bağışıklık Sistemini Güçlendiren Top 10 Besin!",
      "assets/images/bağışıklık.jpg",
      "Gamze Şanlı Ak",
      "06.04.2020",
      '1. Turunçgiller, Kuşburnu ve Kivi\n' +
          '\n' +
          'Yüksek C vitamini bağışıklık sistemi aktivasyonunu arttırır. C vitaminin çok iyi kaynağı olan kivinin günde 2 adet tüketimi, günlük C vitamini ihtiyacımızı karşılamaktadır.\n' +
          '\n' +
          '2. Sarımsak\n' +
          '\n' +
          'Doğal bir antibiyotik olarak da bilinen sarımsak bağışıklık sistemini destekleyen antioksidanları içerir.\n' +
          '\n' +
          '3. Nar\n' +
          '\n' +
          'Antioksidan kapasitesi oldukça zengin olan nar önemli miktarda da potasyum, lif, C ve A vitamini ve niasin içermektedir. Bağışıklık sistemini de güçlendirdiği için gribe karşı koruyucudur.\n' +
          '\n' +
          '4. Kefir\n' +
          '\n' +
          'İçerisinde bulunan probiyotikler bağışıklık sistemini destekleyici bir rol oynarlar.\n' +
          '\n' +
          '5. Yulaf\n' +
          '\n' +
          'İçinde bulunan beta-glukan, bağışıklık sistemini güçlendirir.\n' +
          '\n' +
          '6. Elma\n' +
          '\n' +
          'Elma, içeriğindeki E ve C gibi antioksidan vitaminler ile bağışıklılık sistemini güçlendirerek hastalıklara karşı vücut direncini artırır.\n' +
          '\n' +
          '7. Yeşil çay\n' +
          '\n' +
          'İçerisinde bulunan polifenollar ve flavonoidlerden dolayı güçlü bir antioksidan özelliğe sahiptir.\n' +
          '\n' +
          '8. Propolis\n' +
          '\n' +
          'Doğal bir arı ürünü olan propolis, bağışıklık sistemine destek olup hastalık oluşumunu engeller.\n' +
          '\n' +
          '9. Brokoli, Ispanak ve Lahana\n' +
          '\n' +
          'İçerisindeki antioksidan vitamin ve minerallerden dolayı bağışıklık sistemini güçlendirici bir etki sağlar.\n' +
          '\n' +
          '10. Yoğurt\n' +
          '\n' +
          'Yoğurt, probiotikler ile zengin besin öğeleri içermesi sayesinde bağışıklık sistemini güçlendirir.'),
];
