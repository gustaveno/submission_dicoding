class DataPlant {
  String name;
  String description;
  String price;
  String image;

  DataPlant({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}

var plantList = [
  DataPlant(
    name: 'Ficus Altissima',
    description:
        'Sed fermentum pulvinar luctus. Etiam vitae eleifend ipsum, at molestie est. Aliquam tincidunt euismod lacinia. Aliquam porta libero ut auctor pharetra. Phasellus malesuada iaculis placerat. Nullam fringilla congue nibh, sit amet malesuada erat gravida vitae.',
    price: '228',
    image: 'images/gambar1.jpg',
  ),
  DataPlant(
    name: 'Ferocactus',
    description:
        'Phasellus viverra sem nec massa consectetur, ac mattis orci pharetra. Nullam vitae pulvinar nulla, sed imperdiet nulla. Mauris viverra porta libero nec euismod. Cras eleifend, leo ut sodales dignissim, neque odio fermentum felis, in gravida velit augue cursus enim. Proin fringilla ipsum in lorem semper, consequat viverra eros pulvinar.',
    price: '242',
    image: 'images/gambar2.jpg',
  ),
  DataPlant(
    name: 'Epipremnum Aureum',
    description:
        'Morbi eu accumsan justo. In hac habitasse platea dictumst. Nam sit amet tincidunt magna. Sed a facilisis dui. Fusce eu interdum nibh. Praesent non iaculis metus, a tempor enim. Aenean convallis tellus diam, eu rhoncus sem ultricies sit amet. Donec semper ligula ut orci aliquam hendrerit. Donec vitae porta enim.',
    price: '211',
    image: 'images/gambar3.jpg',
  ),
];
