import 'package:petapp/model/pet_model.dart';
import 'package:petapp/model/pet_owner_model.dart';
import 'package:petapp/model/pet_type.dart';

import '../model/pet_category_type.dart';

var profile = "https://avatars.githubusercontent.com/u/32471055?v=4";

List<PetCategoryType> categ = [
  PetCategoryType(
    category: PetCategory.all,
    name: "Todos",
    iconPath: "assets/icons/pet-border.svg",
  ),
  PetCategoryType(
    category: PetCategory.dog,
    name: "Cachorro",
    iconPath: "assets/icons/dog.svg",
  ),
  PetCategoryType(
    category: PetCategory.cat,
    name: "Gato",
    iconPath: "assets/icons/cat.svg",
  ),
  PetCategoryType(
    category: PetCategory.parrot,
    name: "Papagaio",
    iconPath: "assets/icons/parrot.svg",
  ),
  PetCategoryType(
    category: PetCategory.rabbit,
    name: "Coelho",
    iconPath: "assets/icons/rabbit.svg",
  ),
  PetCategoryType(
    category: PetCategory.fish,
    name: "Peixe",
    iconPath: "assets/icons/fish.svg",
  ),
  PetCategoryType(
    category: PetCategory.turtle,
    name: "Tartaruga",
    iconPath: "assets/icons/turtle.svg",
  ),
];

final defaultOwner = PetOwnerModel(
  name: 'Lucas Brandão',
  bioDescription:
      'Amo muito os animais!\nPreciso adotar meu pet pois minha condição finaceira apertou muito e estou de mudança para um local onde é proibido animais :(',
  phoneNumber: '(32) 91234-1234',
  socialMediaDescription: 'Instagram: @lucazbrand\nFacebook: @lucasbrandao',
);

List petAdoptionList = [
  {
    'id': 1,
    'owner': defaultOwner,
    'pet': PetModel(
      advId: 1,
      name: 'Jhon',
      race: 'Golden Retriver',
      age: '2 anos',
      type: PetType.dog,
      gender: PetGender.male,
      vaccinated: true,
      color: 'Caramelo',
      bioDescription:
          'Jhon é um cachorro muito foda, dócil e brincalhão! Ele vai adorar te conhecer.',
      images: [
        "https://images.unsplash.com/photo-1583511655826-05700d52f4d9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1558788353-f76d92427f16??ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1541364983171-a8ba01e95cfc?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1537151625747-768eb6cf92b2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1583511655826-05700d52f4d9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1591768575198-88dac53fbd0a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1583337130417-3346a1be7dee?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      ],
    ),
  },
  {
    'id': 2,
    'owner': defaultOwner,
    'pet': PetModel(
      advId: 2,
      name: 'Sassy',
      race: 'Bulldog',
      age: '7 meses',
      type: PetType.dog,
      gender: PetGender.female,
      vaccinated: true,
      color: 'Branco',
      bioDescription:
          'Sassy é um cachorro muito novo, dócil e brincalhão! Ela vai adorar te conhecer.',
      images: [
        "https://images.unsplash.com/photo-1591768575198-88dac53fbd0a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1541364983171-a8ba01e95cfc?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1537151625747-768eb6cf92b2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1583511655826-05700d52f4d9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1591768575198-88dac53fbd0a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1583337130417-3346a1be7dee?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      ],
    ),
  },
  {
    'id': 3,
    'owner': defaultOwner,
    'pet': PetModel(
      advId: 3,
      name: 'Bolt',
      race: 'Pug',
      age: '1 ano',
      type: PetType.dog,
      gender: PetGender.male,
      vaccinated: true,
      color: 'Preto',
      bioDescription:
          'Bolt é um cachorro muito foda, dócil e brincalhão! Ele vai adorar te conhecer.',
      images: [
        "https://images.unsplash.com/photo-1541364983171-a8ba01e95cfc?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1541364983171-a8ba01e95cfc?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1537151625747-768eb6cf92b2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1583511655826-05700d52f4d9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1591768575198-88dac53fbd0a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1583337130417-3346a1be7dee?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      ],
    ),
  },
  {
    'id': 4,
    'owner': defaultOwner,
    'pet': PetModel(
      advId: 4,
      name: 'Ruffy',
      race: 'Boston Terrier',
      age: '2 anos',
      type: PetType.dog,
      gender: PetGender.male,
      vaccinated: true,
      color: 'Caramelado',
      bioDescription:
          'Ruffy é um cachorro muito foda, dócil e brincalhão! Ele vai adorar te conhecer.',
      images: [
        "https://images.unsplash.com/photo-1556227702-d1e4e7b5c232?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      ],
    ),
  },
  {
    'id': 5,
    'owner': defaultOwner,
    'pet': PetModel(
      advId: 5,
      name: 'Mafalda',
      race: 'Shitzu',
      age: '3 anos',
      type: PetType.dog,
      gender: PetGender.female,
      vaccinated: true,
      color: 'Cinzento',
      bioDescription:
          'Mafalda é um cachorro muito foda, dócil e brincalhão! Ela vai adorar te conhecer.',
      images: [
        "https://images.unsplash.com/photo-1588269845464-8993565cac3a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      ],
    ),
  },
  {
    'id': 6,
    'owner': defaultOwner,
    'pet': PetModel(
      advId: 6,
      name: 'Bob',
      race: 'Golden',
      age: '2 anos',
      type: PetType.dog,
      gender: PetGender.male,
      vaccinated: true,
      color: 'Caramelo',
      bioDescription:
          'Bob é um cachorro muito foda, dócil e brincalhão! Ele vai adorar te conhecer.',
      images: [
        "https://images.unsplash.com/photo-1598875184988-5e67b1a874b8?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1541364983171-a8ba01e95cfc?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1537151625747-768eb6cf92b2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1583511655826-05700d52f4d9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1591768575198-88dac53fbd0a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1583337130417-3346a1be7dee?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      ],
    ),
  },
  {
    'id': 7,
    'owner': defaultOwner,
    'pet': PetModel(
      advId: 7,
      name: 'Clinkz',
      race: 'Labrador',
      age: '1 ano',
      type: PetType.dog,
      gender: PetGender.male,
      vaccinated: true,
      color: 'Branco',
      bioDescription:
          'Clinkz é um labrador muito foda, dócil e brincalhão! Ele vai adorar te conhecer.',
      images: [
        "https://images.unsplash.com/photo-1587764379873-97837921fd44?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1541364983171-a8ba01e95cfc?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1537151625747-768eb6cf92b2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1583511655826-05700d52f4d9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1591768575198-88dac53fbd0a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1583337130417-3346a1be7dee?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      ],
    ),
  },
  {
    'id': 8,
    'owner': defaultOwner,
    'pet': PetModel(
      advId: 8,
      name: 'Nakita',
      race: 'Persa',
      age: '1 ano',
      type: PetType.cat,
      gender: PetGender.female,
      vaccinated: true,
      color: 'Caramelo',
      bioDescription:
          'Nakita é um gato muito novo, dócil e brincalhão! Ela vai adorar te conhecer.',
      images: [
        "https://images.unsplash.com/photo-1596854407944-bf87f6fdd49e",
        "https://images.unsplash.com/photo-1596854407944-bf87f6fdd49e",
        "https://images.unsplash.com/photo-1596854407944-bf87f6fdd49e",
        "https://images.unsplash.com/photo-1596854407944-bf87f6fdd49e",
        "https://images.unsplash.com/photo-1596854407944-bf87f6fdd49e",
      ],
    ),
  },
  {
    'id': 9,
    'owner': defaultOwner,
    'pet': PetModel(
      advId: 9,
      name: 'Luna',
      race: 'Vira lata',
      age: '4 meses',
      type: PetType.cat,
      gender: PetGender.female,
      vaccinated: false,
      color: 'Branco',
      bioDescription:
          'Luna é um gato muito novo, dócil e brincalhão! Ela vai adorar te conhecer.',
      images: [
        "https://images.unsplash.com/photo-1529778873920-4da4926a72c2",
        "https://images.unsplash.com/photo-1529778873920-4da4926a72c2",
        "https://images.unsplash.com/photo-1529778873920-4da4926a72c2",
        "https://images.unsplash.com/photo-1529778873920-4da4926a72c2",
        "https://images.unsplash.com/photo-1529778873920-4da4926a72c2",
      ],
    ),
  },
  {
    'id': 10,
    'owner': defaultOwner,
    'pet': PetModel(
      advId: 10,
      name: 'Alfredo',
      race: 'Parrot',
      age: '1 ano',
      type: PetType.parrot,
      gender: PetGender.male,
      vaccinated: false,
      color: 'Verde',
      bioDescription:
          'Alfredo é um papagaio muito foda, dócil e brincalhão! Ele vai adorar te conhecer.',
      images: [
        "https://images.unsplash.com/photo-1552728089-57bdde30beb3",
        "https://images.unsplash.com/photo-1552728089-57bdde30beb3",
        "https://images.unsplash.com/photo-1552728089-57bdde30beb3",
        "https://images.unsplash.com/photo-1552728089-57bdde30beb3",
        "https://images.unsplash.com/photo-1552728089-57bdde30beb3",
      ],
    ),
  },
];

PetOwnerModel getPetOwnerByAdvId(String id) {
  return petAdoptionList.firstWhere((e) => e['id'] == int.parse(id))['owner'];
}

PetModel getPetModelByAdvId(String id) {
  return petAdoptionList.firstWhere((e) => e['id'] == int.parse(id))['pet'];
}
