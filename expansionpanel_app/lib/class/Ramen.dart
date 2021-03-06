class Ramen {
  int id;
  String header;
  String body;
  bool expanded = false;

  Ramen(this.header, this.body, {this.expanded = false, this.id});
}

List<Ramen> generateRamen(int numberOfRamen) {
  return List.generate(numberOfRamen, (index) => Ramen(list[index].header, list[index].body, id: index));
}

List<Ramen> list = [
  Ramen(
    '#1 면부터? 스프부터?',
    '회사 직원들이 알려주는 라면 끓이기의 정석은 면과 스프, 후레이크를 동시에 넣는 것! 말이 동시지 워낙 순식간에 일어나는 일이라 순서에 따라 맛이 달라진다고 느끼는 예민한 미각의 소유자라면, 면과 스프 포장을 미리 개봉해 놓고 한 번에 넣는 걸 추천해요!',
  ),
  Ramen('#2 국물라면 vs 짜장라면, 맛있게 끓이는 물의 양은?',
      '라면은 종류가 하도 다양해서 각 제품 뒷면의 설명서를 보는 게 가장 현명하다고 하죠? 일반적으로 국물라면의 경우에는 라면 1개를 끓일 때 물 550ml(종이컵 3잔 정도)가 필요하고요.'),
  Ramen('#3 뚜껑을 덮을까 말까?', '국물라면의 경우 물이 팔팔 끓으면 면과 스프를 동시에 넣은 뒤 4분 30분 정도를 더 끓여야 딱 알맞게 익는데요. 이때 냄비 뚜껑을 덮지 않아야 꼬들꼬들 맛있는 면발이 생성돼요!'),
  Ramen('#4 센 불로? 아님 디테일하게 불 세기 조절?',
      '대부분의 사람들이 처음 물을 끓일 때처럼 라면이 다 익을 때까지 한결같이 센 불을 유지한다면, 라면 고수들은 물을 끓일 때만 센 불로 하고 라면과 스프를 넣은 순간부터는 중간 불로 은근히 끓인답니다. 라면 거품이 중간에 도넛처럼 동그랗게 나타나면 딱 좋은 불 세기라고 하네요.'),
  Ramen('#5 면발을 탱글탱글하게 하려면 들었다 올렸다... 하지 말자! ', '일반 국물라면의 경우 4분 30초의 끓이는 시간 동안 최상으로 탱글탱글하게 만들어지도록 면발을 만들었기 때문에 의미 없는 행동이라고 하네요.'),
  Ramen('#6 물이 너무 많나, 좀 싱거울 땐? ',
      '라면이 싱거우면 정말 당황스러운데요. 그렇다고 더 졸이면 면이 퍼져서 최악의 상황으로 치달을 수 있기 때문이죠.😱 이럴 때는 액젓 1스푼을 넣으면 어느 정도 맛을 잡을 수 있어요. 국물 맛이 더 한식스러워지는 건 덤이고요!'),
  Ramen('#7 프라이팬🍳에 끓이면 더 맛있다! ', '냄비보다 열전도율이 높다 보니 빨리 끓일 수 있어 면이 불지 않거든요. 국물이 자작해진다 싶을 때 불을 끄고 먹으면 쫄깃함이 극에 달한 라면을 만나 보실 수 있어요!')
];
