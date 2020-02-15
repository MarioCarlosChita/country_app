class Country{

   String nome ;
   String reginal ;
   String capital;
   String CountryCode;
   String population;
   String Timezone;
   String Language;
   String flag;

   Country({this.nome , this.capital , this.flag , this.Language ,this.population ,this.reginal , this.Timezone , this.CountryCode});

   factory Country.jsonForm(Map<String ,dynamic>map){
      return Country(
          nome: map['name'].toString(),
          capital: map['capital'].toString(),
          flag: map['flag'].toString(),
          Language: map['Language'].toString(),
          population: map['population'].toString(),
          reginal: map['region'].toString(),
          CountryCode: map['alpha2Code']
      );
   }

}