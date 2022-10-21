enum MenuEnum {
  start(0, 'Início'),
  about(1, 'Sobre nós'),
  products(2, 'Nossos Produtos'),
  contact(3, 'Contato');

  final int id;
  final String name;
  const MenuEnum(this.id, this.name);
}
